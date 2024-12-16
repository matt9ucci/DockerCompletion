@{

RootModule        = 'DockerCompletion.psm1'
ModuleVersion     = '1.2704.0.241216'
GUID              = '3c963cd2-8dce-445a-b7b7-778726965d7d'
Author            = 'Masatoshi Higuchi'
CompanyName       = 'N/A'
Copyright         = '(c) 2017-2024 Masatoshi Higuchi. All rights reserved.'
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
CLI v27.4.0
Compose v2.32.0
'@
} }

DefaultCommandPrefix = 'Docker'

}
