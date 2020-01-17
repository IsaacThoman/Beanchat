@echo off
echo user beanchat> ftpcmd.dat
echo beanchat>> ftpcmd.dat
echo get motd.txt C:/beanchat/motd.txt>> ftpcmd.dat
echo get changelog.txt C:/beanchat/changelog.txt>> ftpcmd.dat
echo quit>> ftpcmd.dat
ftp -n -s:ftpcmd.dat direct.thebeanheccers.tk
del ftpcmd.dat