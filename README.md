# deno_tasklist

**List running processes on Windows.**

Like [tasklist](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tasklist). Returns the name of the executable file, the process ID, and the parent process ID. Built using [fastlist](https://github.com/marktiedemann/fastlist).

## Example

```typescript
import { tasklist } from "https://raw.githubusercontent.com/MarkTiedemann/deno_tasklist/v0.1.0/mod.ts";

async function main() {
  for (let task of await tasklist()) {
    console.log(task); /* => { exe: "deno.exe", pid: 3544, ppid: 13724 } */
  }
}

main();
```

## Development

```batch
:: Build and test
make

:: Clean
make clean

:: Run example
make example
```

## License

[Blue Oak](https://blueoakcouncil.org/license/1.0.0)
