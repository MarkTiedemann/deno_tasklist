async function main() {
  let enc = new TextEncoder();
  let bytes = await Deno.readFile("third_party/fastlist-0.1.0.exe");
  let script = `export function writeExe(filename){return Deno.writeFile(filename,Uint8Array.from([${bytes.toString()}]))}`;
  await Deno.writeFile("fastlist.js", enc.encode(script));
}

main();
