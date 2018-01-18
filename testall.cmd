del *.nupkg
choco pack
choco install -dv -source "'.;https://chocolatey.org/api/v2/'" -f -y --skip-virus-check splunk-universalforwarder
pause
choco uninstall -dv -y splunk-universalforwarder
pause
REM choco install -source "'.;https://chocolatey.org/api/v2/'" -f -y --x86 --skip-virus-check splunk-universalforwarder
REM pause
REM choco uninstall -y splunk-universalforwarder
REM pause
