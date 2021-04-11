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
		$result | Should -HaveCount 4
		$result[0].CompletionText | Should -Be config
		$result[1].CompletionText | Should -Be container
		$result[2].CompletionText | Should -Be context
		$result[3].CompletionText | Should -Be commit
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

Describe 'docker.exe' {
	It 'completes --t' {
		$result = Get-Result 'docker.exe --t'
		$result | Should -HaveCount 5
		$result[0].CompletionText | Should -Be --tls
		$result[1].CompletionText | Should -Be --tlscacert
		$result[2].CompletionText | Should -Be --tlscert
		$result[3].CompletionText | Should -Be --tlskey
		$result[4].CompletionText | Should -Be --tlsverify
	}

	It 'completes co' {
		$result = Get-Result 'docker.exe co'
		$result | Should -HaveCount 4
		$result[0].CompletionText | Should -Be config
		$result[1].CompletionText | Should -Be container
		$result[2].CompletionText | Should -Be context
		$result[3].CompletionText | Should -Be commit
	}
}

Describe 'docker.exe container' {
	It 'completes s' {
		$result = Get-Result 'docker.exe container s'
		$result | Should -HaveCount 3
		$result[0].CompletionText | Should -Be start
		$result[1].CompletionText | Should -Be stats
		$result[2].CompletionText | Should -Be stop
	}

	It 'completes sta' {
		$result = Get-Result 'docker.exe container sta'
		$result | Should -HaveCount 2
		$result[0].CompletionText | Should -Be start
		$result[1].CompletionText | Should -Be stats
	}
}

Describe 'docker.exe container run --mount' {
	It 'completes BLANK' {
		$result = Get-Result 'docker.exe container run --mount '
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
		$result = Get-Result 'docker.exe container run --mount type=bind,'
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
		$result = Get-Result 'docker.exe container run --mount type=bind,s'
		$result | Should -HaveCount 2
		$i = 0
		$result[$i++].CompletionText | Should -Be source
		$result[$i++].CompletionText | Should -Be src
	}

	It 'completes type=bind,ds' {
		$result = Get-Result 'docker.exe container run --mount type=bind,ds'
		$result | Should -HaveCount 1
		$i = 0
		$result[$i++].CompletionText | Should -Be dst
	}

	It 'completes s[tab]rc=/path,dst=/path' {
		$result = Get-Result 'docker.exe container run --mount src=/c/Users/matt9ucci,dst=/root' 34
		$result | Should -HaveCount 2
		$i = 0
		$result[$i++].CompletionText | Should -Be source
		$result[$i++].CompletionText | Should -Be src
	}

	It 'completes type=bind,src=/path,d[tab]st=/path' {
		$result = Get-Result 'docker.exe container run --mount type=bind,src=/c/Users/matt9ucci,dst=/root' 67
		$result | Should -HaveCount 2
		$i = 0
		$result[$i++].CompletionText | Should -Be destination
		$result[$i++].CompletionText | Should -Be dst
	}
}
