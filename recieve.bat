@echo off
echo user beanchat> ftpcmd.dat
echo beanchat>> ftpcmd.dat
echo get chat.txt C:/beanchat/chat.txt>> ftpcmd.dat
echo quit>> ftpcmd.dat
ftp -n -s:ftpcmd.dat legacyclient.beanchat.tk
del ftpcmd.dat