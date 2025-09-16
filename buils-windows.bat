@echo off
setlocal EnableDelayedExpansion

:: �˽ű����� Windows ƽ̨������ Go ����Ϊ��ͬƽ̨�Ŀ�ִ���ļ���

:: ����Ĭ�� Go �ļ�Ϊ main.go����ʹ�������в���ָ�����ļ�
set GO_FILE=%1
if "%GO_FILE%"=="" set GO_FILE=aigo.go

echo --- ��ʼΪ��ͬƽ̨�����ִ�г��� ---

:: ��� builds Ŀ¼�����ڣ��򴴽���
if not exist builds (
    mkdir builds
    echo  ���� 'builds' Ŀ¼
)

:: Windows 64-bit
echo  ���� Windows (amd64)...
set GOOS=windows
set GOARCH=amd64
go build -o builds\proxy-checker-windows-amd64.exe %GO_FILE%
echo  Windows ������ɡ�

:: Linux 64-bit (most desktops/servers)
echo  ���� Linux (amd64)...
set GOOS=linux
set GOARCH=amd64
go build -o builds\proxy-checker-linux-amd64 %GO_FILE%
echo  Linux ������ɡ�

:: macOS 64-bit (Intel)
echo  ���� macOS (Intel)...
set GOOS=darwin
set GOARCH=amd64
go build -o builds\proxy-checker-darwin-amd64 %GO_FILE%
echo  macOS (Intel) ������ɡ�

:: macOS ARM64 (Apple Silicon)
echo  ���� macOS (Apple Silicon)...
set GOOS=darwin
set GOARCH=arm64
go build -o builds\proxy-checker-darwin-arm64 %GO_FILE%
echo  macOS (Apple Silicon) ������ɡ�

:: Linux ARM64 (e.g., Raspberry Pi 4, Termux on modern phones)
echo  ���� Linux (ARM64)...
set GOOS=linux
set GOARCH=arm64
go build -o builds\proxy-checker-linux-arm64 %GO_FILE%
echo  Linux (ARM64) ������ɡ�

:: Android ARM64 (e.g., Termux on Android devices)
echo  ���� Android (arm64) for Termux...
set GOOS=android
set GOARCH=arm64
go build -o builds\proxy-checker-android-arm64 %GO_FILE%
echo  Android (arm64) ������ɡ�

:: Android ARM (e.g., Termux on older Android devices)
echo  ���� Android (arm) for Termux...
set GOOS=android
set GOARCH=arm
go build -o builds\proxy-checker-android-arm %GO_FILE%
echo  Android (arm) ������ɡ�

echo. :: ��ӿ�������߿ɶ���
echo --- ���б�����ɣ��ļ��Ѵ���� builds\ Ŀ¼�¡�---

endlocal