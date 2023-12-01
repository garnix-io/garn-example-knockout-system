import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import { knockOut } from "./knockout.ts";
import { neovimColorschemes, neovimWithColorscheme } from "./neovim.ts";
import { vscodiumColorschemes, vscodiumWithColorscheme } from "./vscodium.ts";

const allNeovims = Object.fromEntries(
  neovimColorschemes.map((colorscheme) => [
    colorscheme,
    neovimWithColorscheme(colorscheme),
  ]),
);

export const neovimRunAll: garn.Executable = garn.processCompose(allNeovims);

export const neovimBattle: garn.Executable = knockOut(allNeovims);

const allVscodiums = Object.fromEntries(
  vscodiumColorschemes.map((colorscheme) => [
    colorscheme,
    vscodiumWithColorscheme(colorscheme),
  ]),
);

export const vscodiumRunAll = garn.processCompose(allVscodiums);

export const vscodiumBattle = knockOut(allVscodiums);
