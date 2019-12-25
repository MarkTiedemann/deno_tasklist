import { tasklist } from "./mod.ts";

async function main() {
  for (let task of await tasklist()) {
    console.log(task); /* => { exe: "deno.exe", pid: 3544, ppid: 13724 } */
  }
}

main();
