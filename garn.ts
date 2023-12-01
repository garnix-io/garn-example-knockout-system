import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import { knockOut } from "./knockout.ts";
import { neovimColorschemes, neovimWithColorscheme } from "./neovim.ts";
import { vscodiumColorschemes, vscodiumWithColorscheme } from "./vscode.ts";

export const neovimBattle: garn.Executable = knockOut(
  Object.fromEntries(
    neovimColorschemes.map((colorscheme) => [
      colorscheme,
      neovimWithColorscheme(colorscheme),
    ]),
  ),
);

export const vscodiumBattle = knockOut(
  Object.fromEntries(
    vscodiumColorschemes.map((colorscheme) => [
      colorscheme,
      vscodiumWithColorscheme(colorscheme),
    ]),
  ),
);
