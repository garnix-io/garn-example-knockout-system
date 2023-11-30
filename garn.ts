import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import * as pkgs from "https://garn.io/ts/v0.0.18/nixpkgs.ts";
import * as nix from "https://garn.io/ts/v0.0.18/nix.ts";
import { openVsCodium } from "./vscode.ts";
import {
  mapValues,
  writeTextFile,
} from "https://garn.io/ts/v0.0.18/internal/utils.ts";
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

const colorThemes = [
  "Abyss",
  "Default Dark+",
  "Default High Contrast",
  "Default High Contrast Light",
  "Default Light+",
  "Default Light Modern",
  "Kimbie Dark",
  "Monokai",
  "Monokai Dimmed",
  "Quiet Light",
  "Red",
  "Solarized Dark",
  "Solarized Light",
  "Tomorrow Night Blue",
  "Visual Studio Dark",
  "Visual Studio Light",
];

const openVsCodiumWithColorTheme = (colorTheme: string): garn.Executable =>
  openVsCodium({
    file: nix.nixStrLit`${exampleFile}`,
    settings: {
      "update.mode": "none",
      "window.menuBarVisibility": "hidden",
      "workbench.colorTheme": colorTheme,
    },
  });

const knockOut = (
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
    .shell`deno run --allow-read --allow-run ${nix.nixRaw`./knock-out.ts`} ${executablesJson}`;
};

export const colorThemeBattle = knockOut(
  Object.fromEntries(
    colorThemes.map((colorTheme) => [
      colorTheme,
      openVsCodiumWithColorTheme(colorTheme),
    ]),
  ),
);

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

const nvimColorschemes = [
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

export const vimBattle: garn.Executable = knockOut(
  Object.fromEntries(
    nvimColorschemes.map((colorTheme) => [colorTheme, vim(colorTheme)]),
  ),
);
