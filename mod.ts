import { writeExe } from "./fastlist.js";

export async function tasklist() {
  let url = import.meta.url;
  let filename =
    url.substr(
      8 /* "file:///".length */,
      url.length - 14 /* "file:///".length + "mod.ts".length */
    ) + "fastlist-0.1.0.exe";

  try {
    await Deno.stat(filename);
  } catch {
    await writeExe(filename);
  }

  let proc = await Deno.run({ args: [filename], stdout: "piped" });
  let bytes = await proc.output();
  let dec = new TextDecoder();
  let str = dec.decode(bytes);
  return str
    .split("\r\n")
    .filter(line => line !== "")
    .map(line => line.split("\t"))
    .map(([exe, pid, ppid]) => ({
      exe,
      pid: parseInt(pid),
      ppid: parseInt(ppid)
    }));
}
