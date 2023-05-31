#Requires -Module @{ ModuleName = 'Pester'; ModuleVersion = '5.1.1' }

BeforeAll {
	$env:DOCKER_HIDE_LEGACY_COMMANDS = $true
	Import-Module $PSScriptRoot/../DockerCompletion -Force

	function Get-Result([string]$Text, [int]$CursorPosition = $Text.Length, [hashtable]$Options) {
		[System.Management.Automation.CommandCompletion]::CompleteInput($Text, $CursorPosition, $Options).CompletionMatches
	}
}

AfterAll {
	$env:DOCKER_HIDE_LEGACY_COMMANDS = $null
}

Describe 'docker' {
	It 'completes co' {
		$result = Get-Result 'docker co'
		$result | Should -HaveCount 4
		$result[0].CompletionText | Should -Be compose
		$result[1].CompletionText | Should -Be config
		$result[2].CompletionText | Should -Be container
		$result[3].CompletionText | Should -Be context
	}

	It 'completes s' {
		$result = Get-Result 'docker s'
		$result | Should -HaveCount 6
		$result[0].CompletionText | Should -Be secret
		$result[1].CompletionText | Should -Be service
		$result[2].CompletionText | Should -Be stack
		$result[3].CompletionText | Should -Be swarm
		$result[4].CompletionText | Should -Be system
		$result[5].CompletionText | Should -Be search
	}
}
