# cerner_2^5_2019
# Pulls Cerner related news from Google News and creates an HTML document with the results

$news = Invoke-RestMethod -uri "https://news.google.com/rss/search?um=1&q=cerner&hl=en-US&gl=US&ceid=US:en"
$news = $news | ForEach-Object {Add-Member -InputObject $_ -MemberType NoteProperty -Name "NewPubDate" -Value (Get-date $_.pubdate) -Passthru; Add-Member -InputObject $_ -MemberType NoteProperty -Name "HTMLLink" -Value "<a href='$($_.Link)'>Article Link</a>"}
$news = ($news | Select-Object NewPubDate,Title,HTMLLink | Sort-Object NewPubDate -Descending | ConvertTo-Html -Fragment) -replace "title","Title" -replace "NewPubDate","Date" -replace "HTMLLink","Link"

$header = @"
<style>
        table {font-family: arial, sans-serif; width: 100%; border-collapse: collapse;}
        td, th {border: 2px solid #dddddd; text-align: left; padding: 8px;}
        tr:nth-child(even){background-color: #d1d1d1;}
</style>
"@

$date = Get-Date -UFormat "%m%d%Y"
$report = "$($env:TEMP)\CernerNewsFeed.html"
$body = @"
<title>Cerner News</title>
<center><font size="16" face="arial black">Cerner News</font></center><br>
$($news)
"@

$htmlOut = ConvertTo-Html -Head $header -Body $body

Add-Type -AssemblyName System.Web
[System.Web.HttpUtility]::HtmlDecode($htmlOut) | Set-Content $report
Invoke-Item $report