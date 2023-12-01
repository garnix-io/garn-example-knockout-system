import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import { knockOut } from "./knockout.ts";
import { neovimCandidates, neovimWithColorscheme } from "./neovim.ts";

export const neovim = garn.mkProject(
  { description: "neovims with different colorschemes" },
  {
    single: neovimWithColorscheme("murphy"),
    runAll: garn.processCompose(neovimCandidates),
    battle: knockOut(neovimCandidates),
  },
);

// const allVscodiums = Object.fromEntries(
//   vscodiumColorschemes.map((colorscheme) => [
//     colorscheme,
//     vscodiumWithColorscheme(colorscheme),
//   ]),
// );

// export const vscodiumRunAll = garn.processCompose(allVscodiums);

// export const vscodiumBattle = knockOut(allVscodiums);
