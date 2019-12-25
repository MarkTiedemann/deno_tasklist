import { tasklist } from "./mod.ts";
import { test, runTests } from "https://deno.land/std@v0.27.0/testing/mod.ts";
import { assertEquals } from "https://deno.land/std@v0.27.0/testing/asserts.ts";

test(async function mod() {
  let hasDeno = 0;
  let hasFastlist = 0;
  for (let task of await tasklist()) {
    if (task.exe === "deno-0.27.0.exe") hasDeno++;
    if (task.exe === "fastlist-0.1.0.exe") hasFastlist++;
  }
  assertEquals(hasDeno, 1);
  assertEquals(hasFastlist, 1);
});

runTests();
