Import-Module -Name $PSScriptRoot\..\DockerCompletion -Force

function Get-Result([string]$Text, [int]$CursorPosition = $Text.Length, [hashtable]$Options) {
	[System.Management.Automation.CommandCompletion]::CompleteInput($Text, $CursorPosition, $Options).CompletionMatches
}

Describe 'docker' {
	$result = Get-Result 'docker --t'
	$result.Count | Should Be 5
	$result[0].CompletionText | Should Be --tls
	$result[1].CompletionText | Should Be --tlscacert
	$result[2].CompletionText | Should Be --tlscert
	$result[3].CompletionText | Should Be --tlskey
	$result[4].CompletionText | Should Be --tlsverify

	$result = Get-Result 'docker co'
	$result.Count | Should Be 3
	$result[0].CompletionText | Should Be config
	$result[1].CompletionText | Should Be container
	$result[2].CompletionText | Should Be commit
}

Describe 'docker container' {
	$result = Get-Result 'docker container s'
	$result.Count | Should Be 3
	$result[0].CompletionText | Should Be start
	$result[1].CompletionText | Should Be stats
	$result[2].CompletionText | Should Be stop

	$result = Get-Result 'docker container sta'
	$result.Count | Should Be 2
	$result[0].CompletionText | Should Be start
	$result[1].CompletionText | Should Be stats
}

Describe 'docker container run --mount' {
	$result = Get-Result 'docker container run --mount '
	$result.Count | Should Be 13
	$i = 0
	$result[$i++].CompletionText | Should Be type
	$result[$i++].CompletionText | Should Be source
	$result[$i++].CompletionText | Should Be src
	$result[$i++].CompletionText | Should Be destination
	$result[$i++].CompletionText | Should Be dst
	$result[$i++].CompletionText | Should Be target
	$result[$i++].CompletionText | Should Be readonly
	$result[$i++].CompletionText | Should Be ro
	$result[$i++].CompletionText | Should Be consistency
	$result[$i++].CompletionText | Should Be volume-driver
	$result[$i++].CompletionText | Should Be volume-label
	$result[$i++].CompletionText | Should Be volume-nocopy
	$result[$i++].CompletionText | Should Be volume-opt

	$result = Get-Result 'docker container run --mount type=bind,'
	$result.Count | Should Be 9
	$i = 0
	$result[$i++].CompletionText | Should Be source
	$result[$i++].CompletionText | Should Be src
	$result[$i++].CompletionText | Should Be destination
	$result[$i++].CompletionText | Should Be dst
	$result[$i++].CompletionText | Should Be target
	$result[$i++].CompletionText | Should Be readonly
	$result[$i++].CompletionText | Should Be ro
	$result[$i++].CompletionText | Should Be consistency
	$result[$i++].CompletionText | Should Be bind-propagation

	$result = Get-Result 'docker container run --mount type=bind,s'
	$result.Count | Should Be 2
	$i = 0
	$result[$i++].CompletionText | Should Be source
	$result[$i++].CompletionText | Should Be src

	$result = Get-Result 'docker container run --mount type=bind,ds'
	$result.Count | Should Be 1
	$i = 0
	$result[$i++].CompletionText | Should Be dst

	$result = Get-Result 'docker container run --mount src=/c/Users/matt9ucci,dst=/root' 30
	$result.Count | Should Be 2
	$i = 0
	$result[$i++].CompletionText | Should Be source
	$result[$i++].CompletionText | Should Be src

	$result = Get-Result 'docker container run --mount type=bind,src=/c/Users/matt9ucci,dst=/root' 63
	$result.Count | Should Be 2
	$i = 0
	$result[$i++].CompletionText | Should Be destination
	$result[$i++].CompletionText | Should Be dst
}
