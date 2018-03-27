@echo off

pushd "%~dp0"
vagrant up && start "" "http://127.0.0.1:3002"
popd
