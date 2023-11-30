import { z } from "https://deno.land/x/zod@v3.22.4/mod.ts";

type Executable = {
  name: string;
  path: string;
};

const knockOut = async (exes: Array<Executable>): Promise<Executable> => {
  if (exes.length > 1) {
    const nextRound = await knockOutHalf(exes);
    return await knockOut(nextRound);
  } else {
    return exes[0];
  }
};

const knockOutHalf = async (
  exes: Array<Executable>,
): Promise<Array<Executable>> => {
  // todo: randomize
  const result = [];
  let i = 0;
  while (true) {
    const candidateA = exes.at(i);
    const candidateB = exes.at(i + 1);
    if (candidateA == null || candidateB == null) {
      if (candidateA != null) {
        result.push(candidateA);
      }
      return result;
    }
    const winner = await battle(candidateA, candidateB);
    console.error(`This rounds winner: ${JSON.stringify(winner.name)}`);
    result.push(winner);
    i += 2;
  }
};

const battle = async (a: Executable, b: Executable): Promise<Executable> => {
  console.error(
    `Running ${JSON.stringify(a.name)} against ${JSON.stringify(b.name)}`,
  );
  const aProcess = new Deno.Command(a.path).spawn();
  const bProcess = new Deno.Command(b.path).spawn();
  const winner: Executable = await Promise.race([
    aProcess.status.then(() => {
      bProcess.kill("SIGINT");
      return b;
    }),
    bProcess.status.then(() => {
      aProcess.kill("SIGINT");
      return a;
    }),
  ]);
  return winner;
};

const executablesSchema = z.record(z.string());

const executables = executablesSchema.parse(
  JSON.parse(Deno.readTextFileSync(Deno.args[0])),
);

const winner = await knockOut(
  Object.entries(executables).map(([name, path]) => ({ name, path })),
);
console.error(`The overall winner is: ${JSON.stringify(winner.name)}`);
