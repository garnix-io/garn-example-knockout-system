import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import { openVsCodium } from "./vscode.ts";
import { writeTextFile } from "https://garn.io/ts/v0.0.18/internal/utils.ts";
import { nixStrLit } from "https://garn.io/ts/v0.0.18/nix.ts";
import outdent from "https://deno.land/x/outdent@v0.8.0/mod.ts";
import { processCompose } from "https://garn.io/ts/v0.0.18/process_compose.ts";

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

const openVsCodiumWithColorTheme = (colorTheme: string) =>
  openVsCodium({
    file: nixStrLit`${exampleFile}`,
    settings: {
      "update.mode": "none",
      "window.menuBarVisibility": "hidden",
      "workbench.colorTheme": colorTheme,
    },
  });

export const all = processCompose(
  Object.fromEntries(
    colorThemes.map((colorTheme) => [
      colorTheme,
      openVsCodiumWithColorTheme(colorTheme),
    ]),
  ),
);
