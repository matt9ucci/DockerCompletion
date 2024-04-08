$profileAll = {
	param ($WordToComplete, $CommandAst)

	$commandTextsOriginal = Get-ComposeCommandText -CommandAst $CommandAst
	$commandTexts = New-Object System.Collections.ArrayList

	# Remove all `--profile stringArray`
	# Because this scriptblock is used for `--profile` argument completion
	$ignoreNext = $false
	foreach ($text in $commandTextsOriginal) {
		if ($ignoreNext) {
			$ignoreNext = $false
			continue
		}

		if ($text -eq '--profile') {
			$ignoreNext = $true
		} else {
			$commandTexts.Add($text) > $null
		}
	}

	Invoke-Expression -Command ("{0} convert --profiles" -f ($commandTexts -join ' ')) | Sort-Object
}

$serviceAll = {
	param ($WordToComplete, $CommandAst)

	$commandTexts = Get-ComposeCommandText -CommandAst $CommandAst
	Invoke-Expression -Command ("{0} convert --services" -f ($commandTexts -join ' ')) | Sort-Object
}

$serviceRunning = {
	param ($WordToComplete, $CommandAst)

	$commandTexts = Get-ComposeCommandText -CommandAst $CommandAst
	$services = Invoke-Expression -Command ("{0} ps --format json --status running | ConvertFrom-Json" -f ($commandTexts -join ' '))
	$services.Service | Sort-Object -Unique
}

$serviceStartable = {
	param ($WordToComplete, $CommandAst)

	$commandTexts = Get-ComposeCommandText -CommandAst $CommandAst
	# Multi-status, `--status created --status exited`, is prefered, but it does not work with Compose v2.0.0
	# See: https://github.com/docker/compose/issues/8700
	$services = Invoke-Expression -Command ("{0} ps --format json --all | ConvertFrom-Json" -f ($commandTexts -join ' '))
	($services | Where-Object State -In @('created', 'exited')).Service | Sort-Object -Unique
}

$servicePaused = {
	param ($WordToComplete, $CommandAst)

	$commandTexts = Get-ComposeCommandText -CommandAst $CommandAst
	$services = Invoke-Expression -Command ("{0} ps --format json --status paused | ConvertFrom-Json" -f ($commandTexts -join ' '))
	$services.Service | Sort-Object -Unique
}

Register-Completer docker_compose_--ansi { 'always', 'auto', 'never' }
Register-Completer docker_compose_--profile $profileAll
Register-Completer docker_compose_--progress { 'auto', 'plain', 'quiet', 'tty' }
Register-Completer docker_compose_build $serviceAll
Register-Completer docker_compose_build_--progress { 'auto', 'plain', 'quiet', 'tty' }
Register-Completer docker_compose_config_--format { 'json', 'yaml' }
Register-Completer docker_compose_create $serviceAll
Register-Completer docker_compose_create_--pull { 'always', 'build', 'missing', 'never' }
Register-Completer docker_compose_down_--rmi { 'all', 'local' }
Register-Completer docker_compose_events $serviceAll
Register-Completer docker_compose_exec $serviceRunning
Register-Completer docker_compose_images $serviceAll
Register-Completer docker_compose_images_--format { 'json', 'table' }
Register-Completer docker_compose_kill $serviceRunning
Register-Completer docker_compose_kill_--signal {
	'SIGCONT'
	'SIGHUP'
	'SIGINT'
	'SIGKILL'
	'SIGSTOP'
	'SIGUSR1'
	'SIGUSR2'
}
Register-Completer docker_compose_kill_-s (Get-Completer docker_compose_kill_--signal)
Register-Completer docker_compose_logs $serviceAll
Register-Completer docker_compose_ls_--format { 'json', 'table' }
Register-Completer docker_compose_pause $serviceRunning
Register-Completer docker_compose_port $serviceAll
Register-Completer docker_compose_port_--protocol { 'tcp', 'udp' }
Register-Completer docker_compose_ps $serviceAll
Register-Completer docker_compose_ps_--format { 'json', 'table' }
Register-Completer docker_compose_ps_--status { 'created', 'dead', 'exited', 'paused', 'removing', 'restarting', 'running' }
Register-Completer docker_compose_pull $serviceAll
Register-Completer docker_compose_push $serviceAll
Register-Completer docker_compose_restart $serviceRunning
Register-Completer docker_compose_rm $serviceAll
Register-Completer docker_compose_run $serviceAll
Register-Completer docker_compose_scale $serviceAll
Register-Completer docker_compose_start $serviceStartable
Register-Completer docker_compose_stop $serviceRunning
Register-Completer docker_compose_top $serviceRunning
Register-Completer docker_compose_unpause $servicePaused
Register-Completer docker_compose_up $serviceAll
Register-Completer docker_compose_up_--exit-code-from $serviceAll
Register-Completer docker_compose_up_--pull { 'always', 'missing', 'never' }
Register-Completer docker_compose_up_--scale $serviceAll
Register-Completer docker_compose_version_--format { 'json', 'pretty' }
Register-Completer docker_compose_version_-f (Get-Completer docker_compose_version_--format)
