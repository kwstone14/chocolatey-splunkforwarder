##dont forget the icon!

$ErrorActionPreference = 'Stop';


$packageName = 'splunkforwarder'
$registryUninstallerKeyName = 'splunkforwarder' #ensure this is the value in the registry
$installerType = 'MSI'
$url = 'http://download.splunk.com/products/splunk/releases/6.5.1/universalforwarder/windows/splunkforwarder-6.5.1-f74036626f0c-x86-release.msi'
$url64 = 'http://download.splunk.com/products/splunk/releases/6.5.1/universalforwarder/windows/splunkforwarder-6.5.1-f74036626f0c-x64-release.msi'
$checksum      = 'c0135f218cea5a6cdeb181b7ef9025cd'
$checksumType  = 'md5'
$checksum64    = '34d4004ffef30b0a286b1dbad467a465'
$checksumType64= $checksumType
$silentArgs = '/quiet' # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
$validExitCodes = @(0)
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageParameters = $env:chocolateyPackageParameters;

if (!($packageParameters -like "*RECEIVING_INDEXER*") -and !($packageParameters -like "*DEPLOYMENT_SERVER*"))
{
	Write-Warning "Did not specify RECEIVING_INDEXER or DEPLOYMENT_SERVER. It's a good idea to set one of these. Refer to the documentation"
}
Write-Output "Installing with  $packageParameters AGREETOLICENSE=Yes $silentArgs"

#Install-ChocolateyPackage "$packageName" "$installerType" "$packageParameters AGREETOLICENSE=Yes $silentArgs" "$url" "$url64"
Install-ChocolateyPackage "$packageName" "$installerType" "$packageParameters AGREETOLICENSE=Yes $silentArgs" "$url" "$url64" "-validExitCodes $validExitCodes" "-checksum $checksum" "-checksumType $checksumType" "-checksum64 $checksum64" "-checksumType64 $checksumType64"
