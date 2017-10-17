$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=windows&version=6.6.3&product=universalforwarder&filename=splunkforwarder-6.6.3-e21ee54bc796-x86-release.msi&wget=true' # download url, HTTPS preferred
$url64 = 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version=6.6.3&product=universalforwarder&filename=splunkforwarder-6.6.3-e21ee54bc796-x64-release.msi&wget=true' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'msi'
    url            = $url
    url64bit       = $url64

    softwareName   = 'SplunkUniversalForwarder'
    checksum       = 'fc3cd256c61fe26688cf49173920e0b7'
    checksumType   = 'md5'
    checksum64     = '830c54b695e297f92c1d94122db753f3'
    checksumType64 = $checksumType

    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AGREETOLICENSE=YES" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
