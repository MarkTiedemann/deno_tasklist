@echo off
if not exist third_party (
  echo mkdir third_party
  mkdir third_party
)
if not exist third_party\make-4.2.exe (
    echo powershell -c "Invoke-WebRequest -Uri ftp://ftp.equation.com/make/64/make.exe -OutFile third_party\make-4.2.exe"
    powershell -c "Invoke-WebRequest -Uri ftp://ftp.equation.com/make/64/make.exe -OutFile third_party\make-4.2.exe"
)
echo third_party\make-4.2.exe %*
third_party\make-4.2.exe %*
