cd D:\Users\Jeffrey\Documents\Inetpub
:: robocopy /PURGE /e /r:2 /w:2 "ECP" ../ECP_BACKUP

for /d %%x in (ECP*) do svn update "%%x"

svn update CommunicationsLib
svn update Offline
svn update TestingScripts
svn update Tools
svn update Upgrade

:: svn diff

pause
