@{

RootModule        = 'DockerCompletion.psm1'
ModuleVersion     = '1.1903.0.190723'
GUID              = '3c963cd2-8dce-445a-b7b7-778726965d7d'
Author            = 'Masatoshi Higuchi'
CompanyName       = 'N/A'
Copyright         = '(c) 2019 Masatoshi Higuchi. All rights reserved.'
Description       = 'Docker command completion for PowerShell.'
PowerShellVersion = '5.0'

NestedModules     = @('NativeCommandCompletion', 'DockerCompletionUtility')
FunctionsToExport = @()
CmdletsToExport   = @()
VariablesToExport = @()
AliasesToExport   = @()

PrivateData = @{ PSData = @{
	Tags         = 'docker', 'completion'
	LicenseUri   = 'https://github.com/matt9ucci/DockerCompletion/blob/master/LICENSE'
	ProjectUri   = 'https://github.com/matt9ucci/DockerCompletion'
	ReleaseNotes = 'First release for docker-ce v19.03.0'
} }

DefaultCommandPrefix = 'Docker'

}
