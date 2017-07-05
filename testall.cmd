del *.nupkg
choco pack
choco install -dv -s '%cd%' -f -y --skip-virus-check splunk-universalforwarder
pause
choco uninstall -dv -y splunk-universalforwarder
REM pause
REM choco install -s '%cd%' -f -y --x86 --skip-virus-check splunk-universalforwarder
REM pause
REM choco uninstall -y splunk-universalforwarder
REM pause