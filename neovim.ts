import * as pkgs from "https://garn.io/ts/v0.0.18/nixpkgs.ts";
import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import * as nix from "https://garn.io/ts/v0.0.18/nix.ts";
import { mkExecutable } from "https://garn.io/ts/v0.0.18/executable.ts";
import { ifSystemIsElse } from "./utils.ts";
import { writeTextFile } from "https://garn.io/ts/v0.0.18/internal/utils.ts";
import outdent from "https://deno.land/x/outdent@v0.8.0/mod.ts";

const exampleFile: garn.Package = garn.mkPackage(
  writeTextFile(
    "example.ts",
    outdent`
        function fac(x: number): number {
          if (x === 0) {
            return 1;
          } else if (x < 0) {
            throw new Error("fac called with a negative number");
          } else {
            return x * fac(x - 1);
          }
        }

        console.log(fac(6));
      `,
  ),
  "example code file",
);

const terminalEmulator = (command: nix.NixExpression): garn.Executable => {
  const onLinux = garn.emptyEnvironment.withDevTools([pkgs.lxterminal])
    .shell`exec lxterminal --no-remote --command ${command}`;
  const onMac = garn.emptyEnvironment.withDevTools([pkgs.alacritty])
    .shell`exec alacritty --command ${command}`;
  return mkExecutable(
    ifSystemIsElse(
      ["aarch64-linux", "x86_64-linux"],
      onLinux.nixExpression,
      onMac.nixExpression,
    ),
    "run neovim in a terminal emulator",
  );
};

export const neovimWithColorscheme = (colorscheme: string): garn.Executable => {
  const vimrc = garn.build(`
    echo 'colorscheme ${colorscheme}' > $out/.vimrc
  `);
  return terminalEmulator(
    nix.nixStrLit`${pkgs.neovim}/bin/nvim -u ${vimrc}/.vimrc ${exampleFile}`,
  );
};

export const neovimColorschemes = [
  "blue",
  "darkblue",
  "default",
  "delek",
  "desert",
  "elflord",
  "evening",
  "habamax",
  "industry",
  "koehler",
  "lunaperche",
  "morning",
  "murphy",
  "pablo",
  "peachpuff",
  "quiet",
  "ron",
  "shine",
  "slate",
  "torte",
  "zellner",
];

export const neovimCandidates = Object.fromEntries(
  neovimColorschemes.map((colorscheme) => [
    colorscheme,
    neovimWithColorscheme(colorscheme),
  ]),
);
