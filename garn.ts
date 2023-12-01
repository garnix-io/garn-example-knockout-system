import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";
import { knockOut } from "./knockout.ts";
import { neovimCandidates, neovimWithColorscheme } from "./neovim.ts";

export const neovim = garn.mkProject(
  { description: "neovims with different colorschemes" },
  {
    single: neovimWithColorscheme("murphy").setDescription(
      "run a single neovim",
    ),
    all: garn
      .processCompose(neovimCandidates)
      .setDescription("run all neovims at once"),
    battle: knockOut(neovimCandidates).setDescription(
      "run two neovims at a time in a knockout system",
    ),
  },
);
