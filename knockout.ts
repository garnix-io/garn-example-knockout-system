import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import * as pkgs from "https://garn.io/ts/v0.0.18/nixpkgs.ts";
import * as nix from "https://garn.io/ts/v0.0.18/nix.ts";
import { mapValues } from "https://garn.io/ts/v0.0.18/internal/utils.ts";

export const knockOut = (
  executables: Record<string, garn.Executable>,
): garn.Executable => {
  const value: nix.NixExpression = nix.nixAttrSet(
    mapValues((e) => e.nixExpression, executables),
  );
  const executablesJson = garn.mkPackage(
    nix.nixRaw`
      pkgs.writeTextFile {
        name = "executables-json";
        text = builtins.toJSON ${value};
      }
    `,
    "executables-json",
  );
  return garn.emptyEnvironment.withDevTools([pkgs.deno])
    .shell`deno run --allow-read --allow-run ${nix.nixRaw`./knockout-runner.ts`} ${executablesJson}`;
};
