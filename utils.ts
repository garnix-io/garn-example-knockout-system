import {
  NixExpression,
  nixList,
  nixRaw,
  nixStrLit,
} from "https://garn.io/ts/v0.0.18/nix.ts";

export const ifSystemIsElse = (
  systems: Array<string>,
  _then: NixExpression,
  _else: NixExpression,
): NixExpression =>
  nixRaw`
    if (pkgs.lib.any (x : x == system) ${nixList(systems.map(nixStrLit))})
      then ${_then}
      else ${_else}
  `;
