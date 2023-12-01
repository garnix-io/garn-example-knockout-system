import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import * as pkgs from "https://garn.io/ts/v0.0.18/nixpkgs.ts";
import * as nix from "https://garn.io/ts/v0.0.18/nix.ts";
import { openVsCodium } from "./vscode.ts";
import { mapValues } from "https://garn.io/ts/v0.0.18/internal/utils.ts";
import { nvimColorschemes, vim } from "./vim.ts";
import { exampleFile } from "./exampleFile.ts";

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

export const vimBattle: garn.Executable = knockOut(
  Object.fromEntries(
    nvimColorschemes.map((colorTheme) => [colorTheme, vim(colorTheme)]),
  ),
);
