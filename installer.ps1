Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}


cd C:/
rmdir beanchat -Recurse

rmdir beanchatlauncher -Recurse

mkdir beanchat


Invoke-WebRequest -Uri 'https://cdn.beanchat.tk/beanchat.zip' -OutFile 'C:\beanchat\beanchat.zip'
		


Unzip "C:\beanchat\beanchat.zip" "C:\beanchat"


cd C:\beanchat
start C:/beanchat/beanchat.exe



