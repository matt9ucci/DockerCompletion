@{

RootModule        = 'DockerCompletion.psm1'
ModuleVersion     = '1.2010.1.211002'
GUID              = '3c963cd2-8dce-445a-b7b7-778726965d7d'
Author            = 'Masatoshi Higuchi'
CompanyName       = 'N/A'
Copyright         = '(c) 2021 Masatoshi Higuchi. All rights reserved.'
Description       = 'Docker command completion for PowerShell.'
PowerShellVersion = '5.0'

NestedModules     = @(
	'NativeCommandCompletion/NativeCommandCompletion.psd1'
	'DockerCompletionUtility/DockerCompletionUtility.psd1'
)
FunctionsToExport = @()
CmdletsToExport   = @()
VariablesToExport = @()
AliasesToExport   = @()

PrivateData = @{ PSData = @{
	Tags         = 'docker', 'completion'
	LicenseUri   = 'https://github.com/matt9ucci/DockerCompletion/blob/master/LICENSE'
	ProjectUri   = 'https://github.com/matt9ucci/DockerCompletion'
	ReleaseNotes = @'
First release for `docker compose` completion (Compose v2.0.0)

In this release, the expression of NestedModules in psd1 file has changed:
  Old: NestedModules = @('NativeCommandCompletion')
  New: NestedModules = @('NativeCommandCompletion/NativeCommandCompletion.psd1')

The change is due to the Publish-Module function and PowerShell Gallery, which can not accept the old style.
'@
} }

DefaultCommandPrefix = 'Docker'

}
