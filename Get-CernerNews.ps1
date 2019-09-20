$news = Invoke-RestMethod -uri "https://news.google.com/rss/search?um=1&q=cerner&hl=en-US&gl=US&ceid=US:en"
$news = $news | ForEach-Object {Add-Member -InputObject $_ -MemberType NoteProperty -Name "PubDateMod" -Value (Get-date $_.pubdate) -Passthru}
$news = $news | Select-Object Title,PubDateMod,Link | Sort-Object PubDateMod -Descending | ConvertTo-Html -Fragment

$header = @"
<style>
        table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
        }
        td, th {
        border: 1px solid #dddddd;
        background-color: #dddddd
        text-align: left;
        padding: 8px;
        }
</style>
"@

$date = Get-Date -UFormat "%m%d%Y"
$report = "$($env:TEMP)\CernerNewsFeed.html"
$body = @"
<title>Cerner News</title>
<center><H1>Cerner News</H1></center>
$($news)
"@

ConvertTo-Html -Head $header -Body $body | Set-Content $report

Invoke-Item $report