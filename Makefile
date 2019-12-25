SHELL := cmd.exe

.PHONY: all
all: .tested

.PHONY: example
example: third_party\deno-0.27.0.exe mod.ts fastlist.js example.ts
	cmd /V /C "set DENO_DIR=deno_dir& .\third_party\deno-0.27.0.exe -A example.ts"

.tested: third_party\deno-0.27.0.exe mod.ts fastlist.js test.ts
	cmd /V /C "set DENO_DIR=deno_dir& .\third_party\deno-0.27.0.exe -A test.ts"
	copy NUL .tested

fastlist.js: third_party\deno-0.27.0.exe third_party\fastlist-0.1.0.exe build.ts
	cmd /V /C "set DENO_DIR=deno_dir& third_party\deno-0.27.0.exe -A build.ts"

third_party\deno-0.27.0.exe:
	powershell -c "Invoke-WebRequest -Uri https://github.com/denoland/deno/releases/download/v0.27.0/deno_win_x64.zip -OutFile third_party\deno.zip"
	powershell -c "Expand-Archive -Path third_party\deno.zip -DestinationPath third_party"
	move third_party\deno.exe third_party\deno-0.27.0.exe
	copy /b third_party\deno-0.27.0.exe+,,third_party\deno-0.27.0.exe
	del /q third_party\deno.zip

third_party\fastlist-0.1.0.exe:
	powershell -c "Invoke-WebRequest -Uri https://github.com/MarkTiedemann/fastlist/releases/download/v0.1.0/fastlist.exe -OutFile third_party\fastlist-0.1.0.exe"

.PHONY: clean
clean:
	-rmdir /q /s third_party deno_dir
	-del /f /q fastlist.js fastlist-0.1.0.exe .tested
