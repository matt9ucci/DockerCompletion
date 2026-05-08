@{

RootModule        = 'DockerCompletion.psm1'
ModuleVersion     = '1.2904.0.260509'
GUID              = '3c963cd2-8dce-445a-b7b7-778726965d7d'
Author            = 'Masatoshi Higuchi'
CompanyName       = 'N/A'
Copyright         = '(c) 2017-2026 Masatoshi Higuchi. All rights reserved.'
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
CLI v29.4.3
Compose v5.1.3
'@
} }

DefaultCommandPrefix = 'Docker'

}
