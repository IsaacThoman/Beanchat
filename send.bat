@echo off
echo user beanchat> ftpcmd.dat
echo beanchat>> ftpcmd.dat
echo put "C:/beanchat/chat.txt" chat.txt>> ftpcmd.dat
echo quit>> ftpcmd.dat
ftp -n -s:ftpcmd.dat internal.beanchat.tk
del ftpcmd.dat