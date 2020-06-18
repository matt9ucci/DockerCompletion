@{

RootModule        = 'DockerCompletion.psm1'
ModuleVersion     = '1.1903.0.200618'
GUID              = '3c963cd2-8dce-445a-b7b7-778726965d7d'
Author            = 'Masatoshi Higuchi'
CompanyName       = 'N/A'
Copyright         = '(c) 2020 Masatoshi Higuchi. All rights reserved.'
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
	ReleaseNotes = @'
Add completers:

--context/-c
--isolation
--log-driver local
context create --from
context export
context inspect
context rm
context update
context update --default-stack-orchestrator
context use
network disconnect
'@
} }

DefaultCommandPrefix = 'Docker'

}
