import outdent from "https://deno.land/x/outdent@v0.8.0/mod.ts";
import { writeTextFile } from "https://garn.io/ts/v0.0.18/internal/utils.ts";
import * as garn from "https://garn.io/ts/v0.0.18/mod.ts";

export const exampleFile: garn.Package = garn.mkPackage(
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
