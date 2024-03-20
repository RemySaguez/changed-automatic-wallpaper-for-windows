Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" & Chr(34) & " -WindowStyle Hidden -ExecutionPolicy Bypass -File ""C:\Users\le\chemin\a\votre\programme.ps1""", 0
Set WshShell = Nothing
