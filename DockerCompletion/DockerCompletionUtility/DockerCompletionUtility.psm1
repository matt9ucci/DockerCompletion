function Get-Container {
	Param(
		[ValidateSet('created', 'dead', 'exited', 'paused', 'removing', 'restarting', 'running')]
		[string[]]$Status
	)

	$options = New-Object System.Collections.ArrayList
	if ($Status) {
		foreach ($s in $Status) {
			$options.Add("--filter 'status=$s'") > $null
		}
	} else {
		$options.Add('--all') > $null
	}

	$command = "docker container ls --format '{{{{.Names}}}}' {0}" -f ($options -join ' ')
	Invoke-Expression -Command $command
}

function Get-Image {
	docker image ls --format '{{.Repository}}' | Sort-Object
	docker image ls --format '{{.Repository}}:{{.Tag}}' | Sort-Object
}
