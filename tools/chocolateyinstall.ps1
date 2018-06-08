$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=windows&version=7.1.1&product=universalforwarder&filename=splunkforwarder-7.1.1-8f0ead9ec3db-x86-release.msi&wget=true' # download url, HTTPS preferred
$url64 = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=7.1.1&product=universalforwarder&filename=splunkforwarder-7.1.1-8f0ead9ec3db-x64-release.msi&wget=true' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'msi'
    url            = $url
    url64bit       = $url64

    softwareName   = 'SplunkUniversalForwarder'
    checksum       = '675f75f02ceb12cd4531c1128084f3a3'
    checksumType   = 'md5'
    checksum64     = 'bf6fc3004daac0edddf7ddf798c9b9f1'
    checksumType64 = $checksumType

    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AGREETOLICENSE=YES" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
