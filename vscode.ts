import { writeTextFile } from "https://garn.io/ts/v0.0.18/internal/utils.ts";
import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import { nix } from "https://garn.io/ts/v0.0.18/mod.ts";
import { NixExpression } from "https://garn.io/ts/v0.0.18/nix.ts";

const vscodium: nix.NixExpression = nix.nixRaw`
  (pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )
`;

/**
 * Create a fake home directory that contains the given config.
 */
const tempHomeDir = (settings: Record<string, unknown>): garn.Package => {
  return garn.build`
    USER_CONFIG=.config/VSCodium/User
    if test $(uname) = "Darwin" ; then
      USER_CONFIG="Library/Application Support/VSCodium/User"
    fi
    mkdir -p "$out/$USER_CONFIG/User"
    cp ${writeTextFile(
      "vscodium-config",
      JSON.stringify(settings, null, 2),
    )} "$out/$USER_CONFIG/settings.json"
  `;
};

export const openVsCodium = (
  args: {
    settings?: Record<string, unknown>;
    file?: NixExpression;
  } = {},
): garn.Executable => {
  const file = args.file ? args.file : "";
  return garn.shell`
    set -euo pipefail

    TEMP_DIR=$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${tempHomeDir(args.settings ?? {})}/. $TEMP_DIR
    chmod -R u+rwX $TEMP_DIR

    echo $TEMP_DIR

    export HOME=$TEMP_DIR
    export XDG_CONFIG_HOME=$TEMP_DIR/.config

    ${vscodium}/bin/codium --new-window --disable-workspace-trust ${file} --wait

    rm -rf $TEMP_DIR
  `.setDescription("open vscodium");
};
