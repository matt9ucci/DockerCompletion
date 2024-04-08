#Requires -Module @{ ModuleName = 'Pester'; ModuleVersion = '5.1.1' }

BeforeAll {
	Import-Module $PSScriptRoot/../DockerCompletion -Force

	function Get-Result([string]$Text, [int]$CursorPosition = $Text.Length, [hashtable]$Options) {
		[System.Management.Automation.CommandCompletion]::CompleteInput($Text, $CursorPosition, $Options).CompletionMatches
	}
}

Describe 'docker' {
	It 'completes --t' {
		$result = Get-Result 'docker --t'
		$result | Should -HaveCount 5
		$result[0].CompletionText | Should -Be --tls
		$result[1].CompletionText | Should -Be --tlscacert
		$result[2].CompletionText | Should -Be --tlscert
		$result[3].CompletionText | Should -Be --tlskey
		$result[4].CompletionText | Should -Be --tlsverify
	}

	It 'completes co' {
		$result = Get-Result 'docker co'
		$result | Should -HaveCount 5
		$result[0].CompletionText | Should -Be compose
		$result[1].CompletionText | Should -Be config
		$result[2].CompletionText | Should -Be container
		$result[3].CompletionText | Should -Be context
		$result[4].CompletionText | Should -Be commit
	}
}

Describe 'docker compose' {
	It 'completes p' {
		$result = Get-Result 'docker compose p'
		$result | Should -HaveCount 5
		$result[0].CompletionText | Should -Be pause
		$result[1].CompletionText | Should -Be port
		$result[2].CompletionText | Should -Be ps
		$result[3].CompletionText | Should -Be pull
		$result[4].CompletionText | Should -Be push
	}

	It 'completes pu' {
		$result = Get-Result 'docker compose pu'
		$result | Should -HaveCount 2
		$result[0].CompletionText | Should -Be pull
		$result[1].CompletionText | Should -Be push
	}

	It 'completes --p' {
		$result = Get-Result 'docker compose --p'
		$result | Should -HaveCount 5
		$result[0].CompletionText | Should -Be --parallel
		$result[1].CompletionText | Should -Be --profile
		$result[2].CompletionText | Should -Be --progress
		$result[3].CompletionText | Should -Be --project-directory
		$result[4].CompletionText | Should -Be --project-name
	}

	It 'completes --progress' {
		$result = Get-Result 'docker compose --progress '
		$result | Should -HaveCount 4
		$result[0].CompletionText | Should -Be auto
		$result[1].CompletionText | Should -Be plain
		$result[2].CompletionText | Should -Be quiet
		$result[3].CompletionText | Should -Be tty
	}
}

Describe 'docker compose create' {
	It 'completes --pull' {
		$result = Get-Result 'docker compose create --pull '
		$result | Should -HaveCount 4
		$result[0].CompletionText | Should -Be always
		$result[1].CompletionText | Should -Be build
		$result[2].CompletionText | Should -Be missing
		$result[3].CompletionText | Should -Be never
	}
}

Describe 'docker --log-level debug compose' {
	It 'completes c' {
		$result = Get-Result 'docker --log-level debug compose c'
		$result | Should -HaveCount 3
		$result[0].CompletionText | Should -Be config
		$result[1].CompletionText | Should -Be cp
		$result[2].CompletionText | Should -Be create
	}
}

Describe 'docker --log-level debug compose --file test.yaml' {
	It 'completes --profile' {
		$file = Join-Path $PSScriptRoot test.yaml
		$result = Get-Result "docker --log-level debug compose --file $file --profile "
		$result | Should -HaveCount 2
		$result[0].CompletionText | Should -Be dev-1
		$result[1].CompletionText | Should -Be dev-2
	}

	It 'completes l' {
		$file = Join-Path $PSScriptRoot test.yaml
		$result = Get-Result "docker --log-level debug compose --file $file l"
		$result | Should -HaveCount 2
		$result[0].CompletionText | Should -Be logs
		$result[1].CompletionText | Should -Be ls
	}

	It 'completes create' {
		$file = Join-Path $PSScriptRoot test.yaml
		$result = Get-Result "docker --log-level debug compose --file $file create "
		$result | Should -HaveCount 1
		$result[0].CompletionText | Should -Be web
	}
}

Describe 'docker container' {
	It 'completes s' {
		$result = Get-Result 'docker container s'
		$result | Should -HaveCount 3
		$result[0].CompletionText | Should -Be start
		$result[1].CompletionText | Should -Be stats
		$result[2].CompletionText | Should -Be stop
	}

	It 'completes sta' {
		$result = Get-Result 'docker container sta'
		$result | Should -HaveCount 2
		$result[0].CompletionText | Should -Be start
		$result[1].CompletionText | Should -Be stats
	}
}

Describe 'docker container run --mount' {
	It 'completes BLANK' {
		$result = Get-Result 'docker container run --mount '
		$result | Should -HaveCount 13
		$i = 0
		$result[$i++].CompletionText | Should -Be type
		$result[$i++].CompletionText | Should -Be source
		$result[$i++].CompletionText | Should -Be src
		$result[$i++].CompletionText | Should -Be destination
		$result[$i++].CompletionText | Should -Be dst
		$result[$i++].CompletionText | Should -Be target
		$result[$i++].CompletionText | Should -Be readonly
		$result[$i++].CompletionText | Should -Be ro
		$result[$i++].CompletionText | Should -Be consistency
		$result[$i++].CompletionText | Should -Be volume-driver
		$result[$i++].CompletionText | Should -Be volume-label
		$result[$i++].CompletionText | Should -Be volume-nocopy
		$result[$i++].CompletionText | Should -Be volume-opt
	}

	It 'completes type=bind,' {
		$result = Get-Result 'docker container run --mount type=bind,'
		$result | Should -HaveCount 10
		$i = 0
		$result[$i++].CompletionText | Should -Be source
		$result[$i++].CompletionText | Should -Be src
		$result[$i++].CompletionText | Should -Be destination
		$result[$i++].CompletionText | Should -Be dst
		$result[$i++].CompletionText | Should -Be target
		$result[$i++].CompletionText | Should -Be readonly
		$result[$i++].CompletionText | Should -Be ro
		$result[$i++].CompletionText | Should -Be consistency
		$result[$i++].CompletionText | Should -Be bind-propagation
		$result[$i++].CompletionText | Should -Be bind-nonrecursive
	}

	It 'completes type=bind,s' {
		$result = Get-Result 'docker container run --mount type=bind,s'
		$result | Should -HaveCount 2
		$i = 0
		$result[$i++].CompletionText | Should -Be source
		$result[$i++].CompletionText | Should -Be src
	}

	It 'completes type=bind,ds' {
		$result = Get-Result 'docker container run --mount type=bind,ds'
		$result | Should -HaveCount 1
		$i = 0
		$result[$i++].CompletionText | Should -Be dst
	}

	It 'completes s[tab]rc=/path,dst=/path' {
		$result = Get-Result 'docker container run --mount src=/c/Users/matt9ucci,dst=/root' 30
		$result | Should -HaveCount 2
		$i = 0
		$result[$i++].CompletionText | Should -Be source
		$result[$i++].CompletionText | Should -Be src
	}

	It 'completes type=bind,src=/path,d[tab]st=/path' {
		$result = Get-Result 'docker container run --mount type=bind,src=/c/Users/matt9ucci,dst=/root' 63
		$result | Should -HaveCount 2
		$i = 0
		$result[$i++].CompletionText | Should -Be destination
		$result[$i++].CompletionText | Should -Be dst
	}
}
