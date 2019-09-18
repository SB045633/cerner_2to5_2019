# cerner_2^5_2019
# Find encrypted files in user home or full home drive
# Shortened/obfuscated for brevity

param ([switch]$DriveSearch,[switch]$HomeSearch)
if ($DriveSearch){(ls "$($env:HOMEDRIVE)\" -Recurse -ErrorAction SilentlyContinue | where {$_.Attributes -match "encrypted"} | select name,fullname,attributes) | ogv }
elseif ($HomeSearch){(ls "$($env:HOMEDRIVE)$($env:HOMEPATH)\" -Recurse -ErrorAction SilentlyContinue | where {$_.Attributes -match "encrypted"} | select name,fullname,attributes) | ogv }
else {echo "`nSelect -DriveSearch or -HomeSearch parameter`n"}