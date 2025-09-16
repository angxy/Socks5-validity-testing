@echo off
setlocal EnableDelayedExpansion

:: 此脚本用于 Windows 平台，编译 Go 程序为不同平台的可执行文件。

:: 设置默认 Go 文件为 main.go，或使用命令行参数指定的文件
set GO_FILE=%1
if "%GO_FILE%"=="" set GO_FILE=aigo.go

echo --- 开始为不同平台编译可执行程序 ---

:: 如果 builds 目录不存在，则创建它
if not exist builds (
    mkdir builds
    echo  创建 'builds' 目录
)

:: Windows 64-bit
echo  编译 Windows (amd64)...
set GOOS=windows
set GOARCH=amd64
go build -o builds\proxy-checker-windows-amd64.exe %GO_FILE%
echo  Windows 编译完成。

:: Linux 64-bit (most desktops/servers)
echo  编译 Linux (amd64)...
set GOOS=linux
set GOARCH=amd64
go build -o builds\proxy-checker-linux-amd64 %GO_FILE%
echo  Linux 编译完成。

:: macOS 64-bit (Intel)
echo  编译 macOS (Intel)...
set GOOS=darwin
set GOARCH=amd64
go build -o builds\proxy-checker-darwin-amd64 %GO_FILE%
echo  macOS (Intel) 编译完成。

:: macOS ARM64 (Apple Silicon)
echo  编译 macOS (Apple Silicon)...
set GOOS=darwin
set GOARCH=arm64
go build -o builds\proxy-checker-darwin-arm64 %GO_FILE%
echo  macOS (Apple Silicon) 编译完成。

:: Linux ARM64 (e.g., Raspberry Pi 4, Termux on modern phones)
echo  编译 Linux (ARM64)...
set GOOS=linux
set GOARCH=arm64
go build -o builds\proxy-checker-linux-arm64 %GO_FILE%
echo  Linux (ARM64) 编译完成。

:: Android ARM64 (e.g., Termux on Android devices)
echo  编译 Android (arm64) for Termux...
set GOOS=android
set GOARCH=arm64
go build -o builds\proxy-checker-android-arm64 %GO_FILE%
echo  Android (arm64) 编译完成。

:: Android ARM (e.g., Termux on older Android devices)
echo  编译 Android (arm) for Termux...
set GOOS=android
set GOARCH=arm
go build -o builds\proxy-checker-android-arm %GO_FILE%
echo  Android (arm) 编译完成。

echo. :: 添加空行以提高可读性
echo --- 所有编译完成！文件已存放在 builds\ 目录下。---

endlocal