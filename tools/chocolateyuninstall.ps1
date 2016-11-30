$ErrorActionPreference = 'Stop';


$packageName = 'splunkforwarder'
$registryUninstallerKeyName = '{5E5CC6A6-6A6B-4B13-BDD5-F64B3FE90634}' #ensure this is the value in the registry
$installerType = 'MSI'
$silentArgs = "$registryUninstallerKeyname /quiet"
$validExitCodes = @(0)

Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $registryUninstallerKeyName