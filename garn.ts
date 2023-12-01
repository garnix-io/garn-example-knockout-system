import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import { knockOut } from "./knockout.ts";
import { neovimCandidates, neovimWithColorscheme } from "./neovim.ts";
import { vscodiumCandidates, vscodiumWithColorscheme } from "./vscodium.ts";

export const neovim = garn.mkProject(
  { description: "neovims with different colorschemes" },
  {
    single: neovimWithColorscheme("murphy"),
    runAll: garn.processCompose(neovimCandidates),
    battle: knockOut(neovimCandidates),
  },
);

export const vscodium = garn.mkProject(
  { description: "vscodiums with different colorschemes" },
  {
    single: vscodiumWithColorscheme("Abyss"),
    runAll: garn.processCompose(vscodiumCandidates),
    battle: knockOut(vscodiumCandidates),
  },
);
