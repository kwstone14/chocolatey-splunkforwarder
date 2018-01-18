choco install -dv -source "'.;https://chocolatey.org/api/v2/'" -f -y --skip-virus-check splunk-universalforwarder
choco uninstall -dv -y splunk-universalforwarder
REM choco install -source "'.;https://chocolatey.org/api/v2/'" -f -y --x86 --skip-virus-check splunk-universalforwarder
REM choco uninstall -y splunk-universalforwarder
