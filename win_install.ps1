#
#	Discord4Slack Windows Automatic Installer!
#	Created by Tom Hightower, 2018 (v1.0)
#>

#$file1 = '%AppData%\local\Slack\*\resources\app.asar.unpacked\src\static\ssb-interop.js'
$file1 = '/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js'

Write-Host "Discord4Slack Windows Installer! v(=∩_∩=)ﾌ      (v1.0)"
Write-Host '                          (  0%)\r'

cat $file1 | %{$_ -replace "/Discord4Slack start/,/Discord4Slack end/d",""}

Add-Content $FILE "//### Discord4Slack start auto-generated line (Don't remove pls) ###"

$file2 = Get-Content "Discord4Slack.js"
$file1content = Get-Content $file1
Add-Content $file1content $file2

Add-Content $FILE "//### Discord4Slack end auto-generated line (Don't remove pls) ###"

Write-Host 'Done!  Reload Slack to see changes (✿ ◠‿◠)'