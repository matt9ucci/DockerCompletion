$containerAll = { Get-Container }
$containerRunning = { Get-Container -Status running }

$formatBasic = @("'{{json .}}'")

$logDriver = {
	'awslogs'
	'etwlogs'
	'fluentd'
	'gcplogs'
	'gelf'
	'journald'
	'json-file'
	'logentries'
	'none'
	'splunk'
	'syslog'
}

$networkAll = { Get-Network }

$repositoryWithTag = { Get-Image }

$serviceAll = { docker service ls --format '{{.Name}}' }

$volumeAll = { docker volume ls --quiet }

Register-Completer docker_--log-level { 'debug', 'info', 'warn', 'error', 'fatal' }
Register-Completer docker_-l (Get-Completer docker_--log-level)

Register-Completer docker_config_inspect { docker config ls --format '{{.Name}}' }
Register-Completer docker_config_ls_--filter {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN id string 'Config ID'
		COMPGEN name string 'Config name'
		COMPGEN label string 'Config label'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		id { docker config ls --quiet }
		name { docker config ls --format '{{.Name}}' }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_config_rm { docker config ls --format '{{.Name}}' }

Register-Completer docker_container_attach $containerRunning
Register-Completer docker_container_commit {
	Param([string]$wordToComplete, $commandAst, $cursorPosition, $indexOfFirstArg)

	if ($indexOfFirstArg -lt 0) {
		Get-Container
	} else {
		$extent = $commandAst.CommandElements[$indexOfFirstArg].Extent
		if (($extent.StartOffset -le $cursorPosition) -and ($cursorPosition -le $extent.EndOffset)) {
			Get-Container
		} else {
			Get-Image
		}
	}
}
Register-Completer docker_container_create $repositoryWithTag
Register-Completer docker_container_create_--log-driver $logDriver
Register-Completer docker_container_create_--volume $volumeAll
Register-Completer docker_container_create_-v (Get-Completer docker_container_create_--volume)
Register-Completer docker_container_create_--volumes-from $containerAll
Register-Completer docker_container_diff $containerAll
Register-Completer docker_container_exec $containerRunning
Register-Completer docker_container_export $containerAll
Register-Completer docker_container_inspect $containerAll
Register-Completer docker_container_kill $containerRunning
Register-Completer docker_container_logs $containerAll
Register-Completer docker_container_ls_--filter {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN ancestor string 'Filter containers which share a given image as an ancestor'
		COMPGEN before string 'Filter containers created before a given container ID or name'
		COMPGEN exited string 'Represent the container''s exit code. Only useful with --all'
		COMPGEN expose string 'Filter containers which expose a given port'
		COMPGEN health string 'Filter containers based on their healthcheck status'
		COMPGEN id string 'Container''s ID'
		COMPGEN isolation string 'Windows daemon only'
		COMPGEN is-task boolean 'Filter containers that are a "task" for a service'
		COMPGEN label string 'An arbitrary string representing either a key or a key-value pair'
		COMPGEN name string 'Container''s name'
		COMPGEN network string 'Filter running containers connected to a given network'
		COMPGEN publish string 'Filter containers which publish a given port'
		COMPGEN since string 'Filter containers created after a given container ID or name'
		COMPGEN status string 'Container''s status'
		COMPGEN volume string 'Filter running containers which have mounted a given volume or bind mount'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		ancestor { Get-Image }
		{ 'before', 'since', 'name' -contains $_ } {
			Get-Container
		}
		health { 'starting', 'healthy', 'unhealthy', 'none' }
		id { docker container ls --format '{{.ID}}' --all }
		isolation { 'default', 'process', 'hyperv' }
		is-task { 'true', 'false' }
		network { Get-Network }
		status {
			'created'
			'dead'
			'exited'
			'paused'
			'removing'
			'restarting'
			'running'
		}
		volume { docker volume ls --quiet }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_container_ls_-f (Get-Completer docker_container_ls_--filter)
Register-Completer docker_container_ls_--format $formatBasic
Register-Completer docker_container_pause $containerRunning
Register-Completer docker_container_port $containerAll
Register-Completer docker_container_rename $containerAll
Register-Completer docker_container_restart $containerAll
Register-Completer docker_container_rm {
	Param($wordToComplete, $commandAst, $cursorPosition)

	$force = $false
	foreach ($ce in $commandAst.CommandElements) {
		if (@('--force', '-f') -contains $ce.Extent.Text) {
			$force = $true
			break
		}
	}

	if ($force) {
		Get-Container
	} else {
		Get-Container -Status created, exited
	}
}
Register-Completer docker_container_run $repositoryWithTag
Register-Completer docker_container_run_--log-driver $logDriver
Register-Completer docker_container_start { Get-Container -Status created, exited }
Register-Completer docker_container_run_--volume $volumeAll
Register-Completer docker_container_run_-v (Get-Completer docker_container_run_--volume)
Register-Completer docker_container_run_--volumes-from $containerAll
Register-Completer docker_container_stats $containerRunning
Register-Completer docker_container_stop $containerRunning
Register-Completer docker_container_top $containerRunning
Register-Completer docker_container_wait $containerAll

Register-Completer docker_image_history $repositoryWithTag
Register-Completer docker_image_import {
	Param([string]$wordToComplete, $commandAst, $cursorPosition, $indexOfFirstArg)

	if ($indexOfFirstArg -ge 0) {
		if ($commandAst.CommandElements[$indexOfFirstArg].Extent.EndOffset -lt $cursorPosition) {
			# 2nd arg
			Get-Image
		}
	}
}
Register-Completer docker_image_inspect $repositoryWithTag
Register-Completer docker_image_ls $repositoryWithTag
Register-Completer docker_image_ls_--filter {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN before string 'Filter images created before a given container ID or name'
		COMPGEN dangling string 'Show untagged images'
		COMPGEN label string 'An arbitrary string representing either a key or a key-value pair'
		COMPGEN reference string 'Filter images whose reference matches the specified pattern'
		COMPGEN since string 'Filter images created after a given container ID or name'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		{ 'before', 'since', 'reference' -contains $_ } {
			Get-Image
		}
		dangling { 'true', 'false' }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_image_ls_-f (Get-Completer docker_image_ls_--filter)
Register-Completer docker_image_ls_--format $formatBasic
Register-Completer docker_image_push $repositoryWithTag
Register-Completer docker_image_rm $repositoryWithTag
Register-Completer docker_image_save $repositoryWithTag
Register-Completer docker_image_tag $repositoryWithTag

Register-Completer docker_network_connect {
	Param([string]$wordToComplete, $commandAst, $cursorPosition, $indexOfFirstArg)

	if ($indexOfFirstArg -lt 0) {
		Get-Network
	} else {
		$extent = $commandAst.CommandElements[$indexOfFirstArg].Extent
		if (($extent.StartOffset -le $cursorPosition) -and ($cursorPosition -le $extent.EndOffset)) {
			Get-Network
		} else {
			Get-Container
		}
	}
}
Register-Completer docker_network_create_--driver {
	(docker system info --format '{{json .Plugins.Network}}' | ConvertFrom-Json) |
		Where-Object { $_ -notin @('host', 'null') }
}
Register-Completer docker_network_create_-d (Get-Completer docker_network_create_--driver)
Register-Completer docker_network_inspect $networkAll
Register-Completer docker_network_ls_--filter {
	Param([string]$wordToComplete)
	
	if ($wordToComplete -notlike '*=*') {
		COMPGEN driver string 'Network driver'
		COMPGEN id string 'Network id'
		COMPGEN label string '<key> or <key>=<value>'
		COMPGEN name string 'Network name'
		COMPGEN scope string 'Scope name'
		COMPGEN type string 'Type name'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		driver { docker system info --format '{{json .Plugins.Network}}' | ConvertFrom-Json }
		id { docker network ls --format '{{.ID}}' }
		name { docker network ls --format '{{.Name}}' }
		scope { 'global', 'local', 'swarm' }
		type { 'builtin', 'custom' }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_network_ls_-f (Get-Completer docker_network_ls_--filter)
Register-Completer docker_network_rm { Get-Network -Type custom }

Register-Completer docker_node_demote { Get-Node -Role manager }
Register-Completer docker_node_inspect {
	Get-Node
	'self'
}
Register-Completer docker_node_ls_--filter {
	Param([string]$wordToComplete)
	
	if ($wordToComplete -notlike '*=*') {
		COMPGEN id string 'Node id'
		COMPGEN label string '<key> or <key>=<value>'
		COMPGEN membership string 'accepted or pending'
		COMPGEN name string 'Node hostname'
		COMPGEN role string 'manager or worker'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		id { docker node ls --quiet }
		membership { 'accepted', 'pending' }
		name { docker node ls --format '{{.Hostname}}' }
		role { 'manager', 'worker' }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_node_ls_-f (Get-Completer docker_node_ls_--filter)
Register-Completer docker_node_ls_--format {
	"'{{.Availability}}'"
	"'{{.Hostname}}'"
	"'{{.ID}}'"
	"'{{.ManagerStatus}}'"
	"'{{.Self}}'"
	"'{{.Status}}'"
	"'{{.TLSStatus}}'"
}
Register-Completer docker_node_promote { Get-Node -Role worker }
Register-Completer docker_node_ps {
	Get-Node
	'self'
}
Register-Completer docker_node_ps_--filter {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN desired-state string 'Desired state of the task'
		COMPGEN id string 'Task id'
		COMPGEN label string '<key> or <key>=<value>'
		COMPGEN name string 'Task name'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		desired-state { 'accepted', 'running', 'shutdown' }
		id { docker node ps --quiet }
		name { docker node ps --format '{{.Name}}' }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_node_ps_-f (Get-Completer docker_node_ps_--filter)
Register-Completer docker_node_ps_--format {
	"'{{.CurrentState}}'"
	"'{{.DesiredState}}'"
	"'{{.Error}}'"
	"'{{.Image}}'"
	"'{{.Name}}'"
	"'{{.Node}}'"
	"'{{.Ports}}'"
}
Register-Completer docker_node_rm { Get-Node }
Register-Completer docker_node_update { Get-Node }
Register-Completer docker_node_update_--availability { 'active', 'drain', 'pause' }
Register-Completer docker_node_update_--role { 'manager', 'worker' }

Register-Completer docker_plugin_ls_--filter {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN capability string 'Plugin capabilities'
		COMPGEN enabled boolean 'True or false'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		capability { 'authz', 'ipamdriver', 'logdriver', 'metricscollector', 'networkdriver', 'volumedriver' }
		enabled { 'true', 'false' }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_plugin_ls_-f (Get-Completer docker_plugin_ls_--filter)

Register-Completer docker_secret_inspect { Get-Secret }
Register-Completer docker_secret_ls_--filter {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN id string 'Secret id'
		COMPGEN label string '<key> or <key>=<value>'
		COMPGEN name string 'Secret name'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		id { docker secret ls --quiet }
		name { docker secret ls --format '{{.Name}}' }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_secret_ls_-f (Get-Completer docker_secret_ls_--filter)
Register-Completer docker_secret_ls_--format {
	"'{{.CreatedAt}}'"
	"'{{.ID}}'"
	"'{{.Labels}}'"
	"'{{.Name}}'"
	"'{{.UpdatedAt}}'"
}
Register-Completer docker_secret_rm { Get-Secret }

Register-Completer docker_search_--filter {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN is-automated boolean 'Autobuild or not'
		COMPGEN is-official boolean 'Official repository or not'
		COMPGEN stars int 'Number of stars'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		is-automated { 'true', 'false' }
		is-official { 'true', 'false' }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}

Register-Completer docker_service_create $repositoryWithTag
Register-Completer docker_service_create_--config { docker config ls --format '{{.Name}}' }
Register-Completer docker_service_create_--log-driver $logDriver
Register-Completer docker_service_create_--mode { 'global', 'replicated' }
Register-Completer docker_service_create_--restart-condition { 'any', 'none', 'on-failure' }
Register-Completer docker_service_create_--rollback-failure-action { 'continue', 'pause' }
Register-Completer docker_service_create_--rollback-order { 'start-first', 'stop-first' }
Register-Completer docker_service_create_--secret { Get-Secret }
Register-Completer docker_service_create_--update-failure-action { 'continue', 'pause', 'rollback' }
Register-Completer docker_service_create_--update-order { 'start-first', 'stop-first' }
Register-Completer docker_service_inspect $serviceAll
Register-Completer docker_service_logs {
	$services = docker service ls --format '{{.Name}}'
	$services
	foreach ($s in $services) {
		docker service ps --format '{{.ID}}' $s
	}
}
Register-Completer docker_service_ls_--filter {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN id string 'Service id'
		COMPGEN label string '<key> or <key>=<value>'
		COMPGEN mode string 'Service mode'
		COMPGEN name string 'Service name'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		id { docker service ls --quiet }
		mode { 'global', 'replicated' }
		name { docker service ls --format '{{.Name}}' }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_service_ps $serviceAll
Register-Completer docker_service_ps_--filter {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN desired-state string 'Desired state of the task'
		COMPGEN id string 'Task id'
		COMPGEN name string 'Task name'
		COMPGEN node string 'Node name or id'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		desired-state { 'accepted', 'running', 'shutdown' }
		id { docker node ps --quiet }
		name { docker node ps --format '{{.Name}}' }
		node  {
			Get-Node
			'self'
		}
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_service_ps_-f (Get-Completer docker_service_ps_--filter)
Register-Completer docker_service_rm $serviceAll
Register-Completer docker_service_scale {
	docker service ls --format '{{.Name}}' | ForEach-Object {
		COMPGEN "$_=" string $_ $_ ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_service_update $serviceAll
Register-Completer docker_service_update_--config-add { docker config ls --format '{{.Name}}' }
Register-Completer docker_service_update_--config-rm { docker config ls --format '{{.Name}}' }
Register-Completer docker_service_update_--image $repositoryWithTag
Register-Completer docker_service_update_--log-driver (Get-Completer docker_service_create_--log-driver)
Register-Completer docker_service_update_--network-add $networkAll
Register-Completer docker_service_update_--network-rm $networkAll
Register-Completer docker_service_update_--restart-condition (Get-Completer docker_service_create_--restart-condition)
Register-Completer docker_service_update_--rollback-failure-action (Get-Completer docker_service_create_--rollback-failure-action)
Register-Completer docker_service_update_--rollback-order (Get-Completer docker_service_create_--rollback-order)
Register-Completer docker_service_update_--secret-add { Get-Secret }
Register-Completer docker_service_update_--secret-rm { Get-Secret }
Register-Completer docker_service_update_--update-failure-action (Get-Completer docker_service_create_--update-failure-action)
Register-Completer docker_service_update_--update-order (Get-Completer docker_service_create_--update-order)

Register-Completer docker_stack_deploy { docker stack ls --format '{{.Name}}' }
Register-Completer docker_stack_ps { docker stack ls --format '{{.Name}}' }
Register-Completer docker_stack_ps_--filter {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN desired-state string 'Desired state of the task'
		COMPGEN id string 'Task id'
		COMPGEN name string 'Task name'
		COMPGEN node string 'Node name or id'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		desired-state { 'accepted', 'running', 'shutdown' }
		id { docker node ps --quiet }
		name { docker node ps --format '{{.Name}}' }
		node { Get-Node }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_stack_ps_-f (Get-Completer docker_stack_ps_--filter)
Register-Completer docker_stack_rm { docker stack ls --format '{{.Name}}' }
Register-Completer docker_stack_services { docker stack ls --format '{{.Name}}' }
Register-Completer docker_stack_services_--filter {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN id string 'Service id'
		COMPGEN label string '<key> or <key>=<value>'
		COMPGEN name string 'Service name'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		id { docker service ls --quiet }
		name { docker service ls --format '{{.Name}}' }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_stack_services_-f (Get-Completer docker_stack_services_--filter)

Register-Completer docker_swarm_init_--availability { 'active', 'drain', 'pause' }
Register-Completer docker_swarm_join_--availability { 'active', 'drain', 'pause' }
Register-Completer docker_swarm_join-token { 'manager', 'worker' }

Register-Completer docker_system_df_--format $formatBasic
Register-Completer docker_system_events_--filter {
	Param([string]$wordToComplete)

		if ($wordToComplete -notlike '*=*') {
			COMPGEN container string 'Container name or id'
			COMPGEN daemon string 'Daemon name or id'
			COMPGEN event string 'Event name'
			COMPGEN image string 'Image name or id'
			COMPGEN label string '<key> or <key>=<value>'
			COMPGEN network string 'Network name or id'
			COMPGEN plugin string 'Plugin name or id'
			COMPGEN scope string 'local or swarm'
			COMPGEN type string 'Object type'
			COMPGEN volume string 'Volume name or id'
			return
		}

		$key = ($wordToComplete -split '=')[0]
		$values = switch ($key) {
			container { Get-Container }
			daemon {
				docker system info --format '{{.Name}}'
				docker system info --format '{{.ID}}'
			}
			event {
				'attach'
				'commit'
				'connect'
				'copy'
				'create'
				'delete'
				'destroy'
				'detach'
				'die'
				'disable'
				'disconnect'
				'enable'
				'exec_create'
				'exec_detach'
				'exec_start'
				'export'
				'health_status'
				'import'
				'install'
				'kill'
				'load'
				'mount'
				'oom'
				'pause'
				'pull'
				'push'
				'reload'
				'remove'
				'rename'
				'resize'
				'restart'
				'save'
				'start'
				'stop'
				'tag'
				'top'
				'unmount'
				'unpause'
				'untag'
				'update'
			}
			image { Get-Image }
			network { Get-Network }
			plugin { docker plugin ls --format '{{.Name}}' }
			scope { 'local', 'swarm' }
			type { 'config', 'container', 'daemon', 'image', 'network', 'node', 'plugin', 'secret', 'service', 'volume' }
			volume { docker volume ls --format '{{.Name}}' }
		}

		foreach ($v in $values) {
			COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
		}
}
Register-Completer docker_system_events_-f (Get-Completer docker_system_events_--filter)
Register-Completer docker_system_events_--format $formatBasic
Register-Completer docker_system_info_--format $formatBasic

Register-Completer docker_volume_inspect $volumeAll
Register-Completer docker_volume_ls_--filter {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN dangling string 'Referenced or not'
		COMPGEN driver string 'Volume''s driver name'
		COMPGEN label string '<key> or <key>=<value>'
		COMPGEN name string 'Volume''s name'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		dangling { 'true', 'false' }
		driver { docker system info --format '{{json .Plugins.Volume}}' | ConvertFrom-Json }
		name { docker volume ls --quiet }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_volume_rm $volumeAll

Register-Completer docker_run (Get-Completer docker_container_run)
Register-Completer docker_run_--log-driver (Get-Completer docker_container_run_--log-driver)
Register-Completer docker_run_--volume (Get-Completer docker_container_run_--volume)
Register-Completer docker_run_-v (Get-Completer docker_run_--volume)
Register-Completer docker_run_--volumes-from (Get-Completer docker_container_run_--volumes-from)

if ($env:DOCKER_HIDE_LEGACY_COMMANDS) {
	return
}

Register-Completer docker_attach (Get-Completer docker_container_attach)
Register-Completer docker_commit (Get-Completer docker_container_commit)
Register-Completer docker_create (Get-Completer docker_container_create)
Register-Completer docker_create_--log-driver (Get-Completer docker_container_create_--log-driver)
Register-Completer docker_create_--volume (Get-Completer docker_container_create_--volume)
Register-Completer docker_create_-v (Get-Completer docker_create_--volume)
Register-Completer docker_create_--volumes-from (Get-Completer docker_container_create_--volumes-from)
Register-Completer docker_diff (Get-Completer docker_container_diff)
Register-Completer docker_events_--filter (Get-Completer docker_system_events_--filter)
Register-Completer docker_events_-f (Get-Completer docker_events_--filter)
Register-Completer docker_events_--format (Get-Completer docker_system_events_--format)
Register-Completer docker_exec (Get-Completer docker_container_exec)
Register-Completer docker_export (Get-Completer docker_container_export)
Register-Completer docker_history (Get-Completer docker_image_history)
Register-Completer docker_images (Get-Completer docker_image_ls)
Register-Completer docker_import (Get-Completer docker_image_import)
Register-Completer docker_images_--filter (Get-Completer docker_image_ls_--filter)
Register-Completer docker_images_-f (Get-Completer docker_images_--filter)
Register-Completer docker_images_--format (Get-Completer docker_image_ls_--format)
Register-Completer docker_info_--format (Get-Completer docker_system_info_--format)
Register-Completer docker_inspect {
	Param($wordToComplete, $commandAst, $cursorPosition)

	$type = $null
	for ($i = 2; $i -lt $commandAst.CommandElements.Count; $i++) {
		$ce = $commandAst.CommandElements[$i]
		if ('--type' -eq $ce.Extent.Text) {
			$type = $commandAst.CommandElements[$i + 1].Extent.Text
			break
		}
	}

	switch ($type) {
		'' {
			Get-Container
			Get-Image
			Get-Network
			Get-Node
			docker plugin ls --format '{{.Name}}'
			Get-Secret
			docker service ls --format '{{.Name}}'
			docker volume ls --format '{{.Name}}'
		}
		container { Get-Container }
		image { Get-Image }
		network { Get-Network }
		node { Get-Node }
		plugin { docker plugin ls --format '{{.Name}}' }
		secret { Get-Secret }
		service { docker service ls --format '{{.Name}}' }
		volume { docker volume ls --format '{{.Name}}' }
	}
}
Register-Completer docker_inspect_--type { 'container', 'image', 'network', 'node', 'plugin', 'secret', 'service', 'volume' }
Register-Completer docker_kill (Get-Completer docker_container_kill)
Register-Completer docker_logs (Get-Completer docker_container_logs)
Register-Completer docker_pause (Get-Completer docker_container_pause)
Register-Completer docker_port (Get-Completer docker_container_port)
Register-Completer docker_ps_--filter (Get-Completer docker_container_ls_--filter)
Register-Completer docker_ps_-f (Get-Completer docker_ps_--filter)
Register-Completer docker_ps_--format (Get-Completer docker_container_ls_--format)
Register-Completer docker_push (Get-Completer docker_image_push)
Register-Completer docker_rename (Get-Completer docker_container_rename)
Register-Completer docker_restart (Get-Completer docker_container_restart)
Register-Completer docker_rm (Get-Completer docker_container_rm)
Register-Completer docker_rmi (Get-Completer docker_image_rm)
Register-Completer docker_save (Get-Completer docker_image_save)
Register-Completer docker_start (Get-Completer docker_container_start)
Register-Completer docker_stats (Get-Completer docker_container_stats)
Register-Completer docker_stop (Get-Completer docker_container_stop)
Register-Completer docker_tag (Get-Completer docker_image_tag)
Register-Completer docker_top (Get-Completer docker_container_top)
Register-Completer docker_wait (Get-Completer docker_container_wait)
