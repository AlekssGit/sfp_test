@echo off
cls

if exist sim\*.* rd /S /Q sim
if not exist sim md sim

rem Дополнительные действия, перед запуском симуляции
rem copy model\s27kl0641.mem sim
rem copy model\is66wvh16m8_d0.mem sim
rem copy model\is66wvh16m8_d1.mem sim

rem Запуск симуляции
cd sim
vsim -do ../%1