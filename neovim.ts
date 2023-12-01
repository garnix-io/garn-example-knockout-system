import * as pkgs from "https://garn.io/ts/v0.0.18/nixpkgs.ts";
import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import * as nix from "https://garn.io/ts/v0.0.18/nix.ts";
import { exampleFile } from "./exampleFile.ts";

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
  return garn.shell`
    exec ${nix.nixRaw`pkgs.xfce.xfce4-terminal`}/bin/xfce4-terminal --hide-menubar --disable-server --command "${
    pkgs.neovim
  }/bin/nvim -u ${vimrc} ${exampleFile}" &> /dev/null
  `;
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
