import * as pkgs from "https://garn.io/ts/v0.0.18/nixpkgs.ts";
import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import * as nix from "https://garn.io/ts/v0.0.18/nix.ts";
import { exampleFile } from "./exampleFile.ts";
import { mkExecutable } from "https://garn.io/ts/v0.0.18/executable.ts";

const terminalEmulator = (command: nix.NixExpression): garn.Executable => {
  const onLinux = garn.emptyEnvironment.withDevTools([pkgs.lxterminal])
    .shell`lxterminal --command ${command}`;
  const onMac = garn.emptyEnvironment.withDevTools([pkgs.alacritty])
    .shell`alacritty --command ${command}`;
  return (
    // # then ${nix.nixStrLit`\${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --disable-server --hide-menubar --command "${command}"`}
    mkExecutable(
      nix.nixRaw`
        builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then ${onLinux.nixExpression}
          else ${onMac.nixExpression})
      `,
      "run neovim in a terminal emulator",
    )
  );
};

export const neovimWithColorscheme = (colorscheme: string): garn.Executable => {
  const vimrc = garn.mkPackage(
    nix.nixRaw`
      pkgs.writeTextFile {
        name = "vimrc";
        text = ${nix.nixStrLit`colorscheme ${colorscheme}`};
      }
    `,
    "vimrc",
  );
  return terminalEmulator(
    nix.nixStrLit`${pkgs.neovim}/bin/nvim -u ${vimrc} ${exampleFile}`,
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
