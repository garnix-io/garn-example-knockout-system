import * as pkgs from "https://garn.io/ts/v0.0.18/nixpkgs.ts";
import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import * as nix from "https://garn.io/ts/v0.0.18/nix.ts";
import { mkExecutable } from "https://garn.io/ts/v0.0.18/executable.ts";
import { ifSystemIsElse, writeTextDir } from "./utils.ts";
import outdent from "https://deno.land/x/outdent@v0.8.0/mod.ts";

const exampleFile: garn.Package = writeTextDir(
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
);

const terminalEmulator = (command: nix.NixExpression): garn.Executable => {
  const onLinux = garn.emptyEnvironment.withDevTools([pkgs.lxterminal])
    .shell`exec lxterminal --no-remote --command ${command} &> /dev/null`;
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
  const vimrc = writeTextDir(".vimrc", `colorscheme ${colorscheme}`);
  return terminalEmulator(
    nix.nixStrLit`${pkgs.neovim}/bin/nvim -u ${vimrc}/.vimrc ${exampleFile}/example.ts`,
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

export const neovimCandidates: Record<string, garn.Executable> =
  Object.fromEntries(
    neovimColorschemes.map((colorscheme) => [
      colorscheme,
      neovimWithColorscheme(colorscheme),
    ]),
  );
