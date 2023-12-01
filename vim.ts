import * as pkgs from "https://garn.io/ts/v0.0.18/nixpkgs.ts";
import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import * as nix from "https://garn.io/ts/v0.0.18/nix.ts";
import { exampleFile } from "./exampleFile.ts";

export const vim = (colorScheme: string): garn.Executable => {
  const vimrc = garn.mkPackage(
    nix.nixRaw`
      pkgs.writeTextFile {
        name = "vimrc";
        text = ${nix.nixStrLit`colorscheme ${colorScheme}`};
      }
    `,
    "vimrc",
  );
  return garn.shell`
    # export HOME=/nope
    exec ${nix.nixRaw`pkgs.xfce.xfce4-terminal`}/bin/xfce4-terminal --disable-server --command "${
    pkgs.neovim
  }/bin/nvim -u ${vimrc} ${exampleFile}" &> /dev/null
  `;
};

export const nvimColorschemes = [
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
