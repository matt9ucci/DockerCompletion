$configAll = { Get-Config }

$containerAll = { Get-Container }
$containerRunning = { Get-Container -Status running }

$contextAll = { Get-Context }

$formatBasic = @("'{{json .}}'")

$isolation = { 'default', 'hyperv', 'process' }

$logDriver = {
	'awslogs'
	'etwlogs'
	'fluentd'
	'gcplogs'
	'gelf'
	'journald'
	'json-file'
	'local'
	'logentries'
	'none'
	'splunk'
	'syslog'
}

$networkAll = { Get-Network }

$imageAll = { Get-Image }

$serviceAll = { Get-Service }

$stackAll = { docker stack ls --format '{{.Name}}' }

$volumeAll = { Get-Volume }
$volumeCluster = { docker volume ls --quiet --cluster }

$capAddable = {
	COMPGEN ALL string 'All capabilities'
	COMPGEN AUDIT_CONTROL string 'Enable and disable kernel auditing; change auditing filter rules; retrieve auditing status and filtering rules'
	COMPGEN AUDIT_READ string 'Allow reading the audit log via multicast netlink socket'
	COMPGEN BLOCK_SUSPEND string 'Employ features that can block system suspend'
	COMPGEN BPF string 'Allow creating BPF maps, loading BPF Type Format (BTF) data, retrieve JITed code of BPF programs, and more'
	COMPGEN CHECKPOINT_RESTORE string 'Allow checkpoint/restore related operations. Introduced in kernel 5.9'
	COMPGEN DAC_READ_SEARCH string 'Bypass file read permission checks and directory read and execute permission checks'
	COMPGEN IPC_LOCK string 'Lock memory (mlock(2), mlockall(2), mmap(2), shmctl(2))'
	COMPGEN IPC_OWNER string 'Bypass permission checks for operations on System V IPC objects'
	COMPGEN LEASE string 'Establish leases on arbitrary files (see fcntl(2))'
	COMPGEN LINUX_IMMUTABLE string 'Set the FS_APPEND_FL and FS_IMMUTABLE_FL i-node flags'
	COMPGEN MAC_ADMIN string 'Override Mandatory Access Control (MAC). Implemented for the Smack Linux Security Module (LSM)'
	COMPGEN MAC_OVERRIDE string 'Allow MAC configuration or state changes. Implemented for the Smack LSM'
	COMPGEN NET_ADMIN string 'Perform various network-related operations'
	COMPGEN NET_BROADCAST string 'Make socket broadcasts, and listen to multicasts'
	COMPGEN PERFMON string 'Allow system performance and observability privileged operations using perf_events, i915_perf and other kernel subsystems'
	COMPGEN SYS_ADMIN string 'Perform a range of system administration operations'
	COMPGEN SYS_BOOT string 'Use reboot(2) and kexec_load(2), reboot and load a new kernel for later execution'
	COMPGEN SYS_MODULE string 'Load and unload kernel modules'
	COMPGEN SYS_NICE string 'Raise process nice value (nice(2), setpriority(2)) and change the nice value for arbitrary processes'
	COMPGEN SYS_PACCT string 'Use acct(2), switch process accounting on or off'
	COMPGEN SYS_PTRACE string 'Trace arbitrary processes using ptrace(2)'
	COMPGEN SYS_RAWIO string 'Perform I/O port operations (iopl(2) and ioperm(2))'
	COMPGEN SYS_RESOURCE string 'Override resource Limits'
	COMPGEN SYS_TIME string 'Set system clock (settimeofday(2), stime(2), adjtimex(2)); set real-time (hardware) clock'
	COMPGEN SYS_TTY_CONFIG string 'Use vhangup(2); employ various privileged ioctl(2) operations on virtual terminals'
	COMPGEN SYSLOG string 'Perform privileged syslog(2) operations'
	COMPGEN WAKE_ALARM string 'Trigger something that will wake up the system'
}

$capDroppable = {
	COMPGEN ALL string 'All capabilities'
	COMPGEN AUDIT_WRITE string 'Write records to kernel auditing log'
	COMPGEN CHOWN string 'Make arbitrary changes to file UIDs and GIDs (see chown(2))'
	COMPGEN DAC_OVERRIDE string 'Bypass file read, write, and execute permission checks'
	COMPGEN FOWNER string 'Bypass permission checks on operations that normally require the file system UID of the process to match the UID of the file'
	COMPGEN FSETID string 'Don''t clear set-user-ID and set-group-ID permission bits when a file is modified'
	COMPGEN KILL string 'Bypass permission checks for sending signals'
	COMPGEN MKNOD string 'Create special files using mknod(2)'
	COMPGEN NET_BIND_SERVICE string 'Bind a socket to internet domain privileged ports (port numbers less than 1024)'
	COMPGEN NET_RAW string 'Use RAW and PACKET sockets'
	COMPGEN SETFCAP string 'Set file capabilities'
	COMPGEN SETGID string 'Make arbitrary manipulations of process GIDs and supplementary GID list'
	COMPGEN SETPCAP string 'Modify process capabilities'
	COMPGEN SETUID string 'Make arbitrary manipulations of process UIDs'
	COMPGEN SYS_CHROOT string 'Use chroot(2), change root directory'
}

$mount = {
	Param($wordToComplete, $commandAst, $cursorPosition)

	# Get type
	foreach ($keyValue in ($commandAst.CommandElements[-1] -split ',')) {
		$key, $value = $keyValue -split '='
		if ($key -eq 'type') {
			$type = $value
		}
	}

	if (!$type) {
		$type = 'volume' # Default type
		COMPGEN type string 'The type of mount'
	}

	if ($wordToComplete -notlike '*=*') {
		switch ($type) {
			bind {
				COMPGEN source string 'The source of mount'
				COMPGEN src string 'The abbreviation of "source"'
				COMPGEN destination string 'The destination of mount'
				COMPGEN dst string 'The abbreviation of "destination"'
				COMPGEN target string 'The alias of "destination"'
				COMPGEN readonly string 'true or 1 or no value: readonly, false or 0: read-write'
				COMPGEN ro string 'The abbreviation of "readonly"'
				COMPGEN consistency string 'The consistency requirements for the mount'
				COMPGEN bind-propagation string 'Refers to whether or not mounts created within a given bind mount or named volume can be propagated to replicas of that mount'
				COMPGEN bind-nonrecursive string 'To disable recursive bind-mount'
			}
			volume {
				COMPGEN source string 'The source of mount'
				COMPGEN src string 'The abbreviation of "source"'
				COMPGEN destination string 'The destination of mount'
				COMPGEN dst string 'The abbreviation of "destination"'
				COMPGEN target string 'The alias of "destination"'
				COMPGEN readonly string 'true or 1 or no value: readonly, false or 0: read-write'
				COMPGEN ro string 'The abbreviation of "readonly"'
				COMPGEN consistency string 'The consistency requirements for the mount'
				COMPGEN volume-driver string 'Name of the volume-driver plugin to use for the volume'
				COMPGEN volume-label string 'One or more custom metadata ("labels") to apply to the volume upon creation'
				COMPGEN volume-nocopy string 'To disable copying files from the container''s filesystem to the volume and mount the empty volume'
				COMPGEN volume-opt string 'Options specific to a given volume driver, which will be passed to the driver when creating the volume'
			}
			tmpfs {
				COMPGEN destination string 'The destination of mount'
				COMPGEN dst string 'The abbreviation of "destination"'
				COMPGEN target string 'The alias of "destination"'
				COMPGEN readonly string 'true or 1 or no value: readonly, false or 0: read-write'
				COMPGEN ro string 'The abbreviation of "readonly"'
				COMPGEN consistency string 'The consistency requirements for the mount'
				COMPGEN tmpfs-size string 'Size of the tmpfs mount in bytes'
				COMPGEN tmpfs-mode string 'File mode of the tmpfs in octal (e.g. "700" or "0700".)'
			}
		}
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		type { 'bind', 'volume', 'tmpfs' }
		{ 'readonly', 'ro' -contains $_ } { 'true', 'false', 1, 0 }
		consistency {'default', 'consistent', 'cached', 'delegated'}
		bind-propagation { 'shared', 'slave', 'private', 'rshared', 'rslave', 'rprivate' }
		bind-nonrecursive { 'true', 'false' }
		volume-nocopy { 'true', 'false' }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}

Register-Completer docker_--context $contextAll
Register-Completer docker_-c (Get-Completer docker_--context)
Register-Completer docker_--log-level { 'debug', 'info', 'warn', 'error', 'fatal' }
Register-Completer docker_-l (Get-Completer docker_--log-level)

Register-Completer docker_config_inspect $configAll
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
Register-Completer docker_config_rm $configAll

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
Register-Completer docker_container_create $imageAll
Register-Completer docker_container_create_--cap-add $capAddable
Register-Completer docker_container_create_--cap-drop $capDroppable
Register-Completer docker_container_create_--cgroupns { 'host', 'private' }
Register-Completer docker_container_create_--isolation $isolation
Register-Completer docker_container_create_--log-driver $logDriver
Register-Completer docker_container_create_--mount $mount
Register-Completer docker_container_create_--pull { 'always', 'missing', 'never' }
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
		volume { Get-Volume }
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
Register-Completer docker_container_run $imageAll
Register-Completer docker_container_run_--cap-add $capAddable
Register-Completer docker_container_run_--cap-drop $capDroppable
Register-Completer docker_container_run_--cgroupns { 'host', 'private' }
Register-Completer docker_container_run_--isolation $isolation
Register-Completer docker_container_run_--log-driver $logDriver
Register-Completer docker_container_run_--network {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike 'container:*') {
		@(
			(docker system info --format '{{json .Plugins.Network}}' | ConvertFrom-Json)
			'container'
			Get-Network
		) | Sort-Object -Unique
		return
	}

	$values = Get-Container

	foreach ($v in $values) {
		COMPGEN "container:$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_container_run_--pull { 'always', 'missing', 'never' }
Register-Completer docker_container_start { Get-Container -Status created, exited }
Register-Completer docker_container_run_--mount $mount
Register-Completer docker_container_run_--volume $volumeAll
Register-Completer docker_container_run_-v (Get-Completer docker_container_run_--volume)
Register-Completer docker_container_run_--volumes-from $containerAll
Register-Completer docker_container_stats $containerRunning
Register-Completer docker_container_stop $containerRunning
Register-Completer docker_container_top $containerRunning
Register-Completer docker_container_wait $containerAll

Register-Completer docker_context_create_--from $contextAll
Register-Completer docker_context_export {
	Param([string]$wordToComplete, $commandAst, $cursorPosition, $indexOfFirstArg)

	if ($indexOfFirstArg -lt 0) {
		Get-Context
	}
}
Register-Completer docker_context_inspect $contextAll
Register-Completer docker_context_rm $contextAll
Register-Completer docker_context_update $contextAll
Register-Completer docker_context_update_--default-stack-orchestrator { 'all', 'kubernetes', 'swarm' }
Register-Completer docker_context_use $contextAll

Register-Completer docker_image_build_--cache-from $imageAll
Register-Completer docker_image_build_--isolation $isolation
Register-Completer docker_image_build_--progress { 'auto', 'plain', 'tty' }
Register-Completer docker_image_build_--network {
	Param([string]$wordToComplete)

	if ($wordToComplete -notlike 'container:*') {
		@(
			(docker system info --format '{{json .Plugins.Network}}' | ConvertFrom-Json)
			'container'
			Get-Network
		) | Sort-Object -Unique
		return
	}

	$values = Get-Container

	foreach ($v in $values) {
		COMPGEN "container:$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_image_build_--secret {
	param ([string]$wordToComplete)

	if ($wordToComplete -notlike '*=*') {
		COMPGEN id string 'Secret name'
		COMPGEN source string 'Secret source'
		COMPGEN src string 'Abbreviation of "source"'
		COMPGEN type string 'Secret type'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		id { Get-Secret }
		type { 'file' }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_image_build_--tag $imageAll
Register-Completer docker_image_build_-t (Get-Completer docker_image_build_--tag)
Register-Completer docker_image_history $imageAll
Register-Completer docker_image_history_--format {
	"'{{.Comment}}'"
	"'{{.CreatedAt}}'"
	"'{{.CreatedBy}}'"
	"'{{.CreatedSince}}'"
	"'{{.ID}}'"
	"'{{.Size}}'"
}
Register-Completer docker_image_import {
	Param([string]$wordToComplete, $commandAst, $cursorPosition, $indexOfFirstArg)

	if ($indexOfFirstArg -ge 0) {
		if ($commandAst.CommandElements[$indexOfFirstArg].Extent.EndOffset -lt $cursorPosition) {
			# 2nd arg
			Get-Image
		}
	}
}
Register-Completer docker_image_inspect $imageAll
Register-Completer docker_image_ls $imageAll
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
Register-Completer docker_image_pull $imageAll
Register-Completer docker_image_pull_--all-tags { Get-ImageRepository }
Register-Completer docker_image_pull_-a { Get-ImageRepository }
Register-Completer docker_image_push $imageAll
Register-Completer docker_image_rm $imageAll
Register-Completer docker_image_save $imageAll
Register-Completer docker_image_tag $imageAll

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
Register-Completer docker_network_disconnect {
	Param([string]$wordToComplete, $commandAst, $cursorPosition, $indexOfFirstArg)

	if ($indexOfFirstArg -lt 0) {
		Get-Network
	} else {
		$extent = $commandAst.CommandElements[$indexOfFirstArg].Extent
		if (($extent.StartOffset -le $cursorPosition) -and ($cursorPosition -le $extent.EndOffset)) {
			Get-Network
		} else {
			$containersInNetwork = docker network inspect --format '{{json .Containers}}' $extent.Text
			($containersInNetwork | ConvertFrom-Json).psobject.Properties.Value.Name | Sort-Object
		}
	}
}
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

Register-Completer docker_service_create $imageAll
Register-Completer docker_service_create_--cap-add $capAddable
Register-Completer docker_service_create_--cap-drop $capDroppable
Register-Completer docker_service_create_--config $configAll
Register-Completer docker_service_create_--endpoint-mode { 'dnsrr', 'vip' }
Register-Completer docker_service_create_--isolation $isolation
Register-Completer docker_service_create_--log-driver $logDriver
Register-Completer docker_service_create_--mode { 'global', 'global-job', 'replicated', 'replicated-job' }
Register-Completer docker_service_create_--mount $mount
Register-Completer docker_service_create_--restart-condition { 'any', 'none', 'on-failure' }
Register-Completer docker_service_create_--rollback-failure-action { 'continue', 'pause' }
Register-Completer docker_service_create_--rollback-order { 'start-first', 'stop-first' }
Register-Completer docker_service_create_--secret { Get-Secret }
Register-Completer docker_service_create_--update-failure-action { 'continue', 'pause', 'rollback' }
Register-Completer docker_service_create_--update-order { 'start-first', 'stop-first' }
Register-Completer docker_service_inspect $serviceAll
Register-Completer docker_service_logs {
	$services = Get-Service
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
		node {
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
Register-Completer docker_service_update_--cap-add $capAddable
Register-Completer docker_service_update_--cap-drop $capDroppable
Register-Completer docker_service_update_--config-add $configAll
Register-Completer docker_service_update_--config-rm $configAll
Register-Completer docker_service_update_--endpoint-mode { 'dnsrr', 'vip' }
Register-Completer docker_service_update_--image $imageAll
Register-Completer docker_service_update_--isolation $isolation
Register-Completer docker_service_update_--log-driver (Get-Completer docker_service_create_--log-driver)
Register-Completer docker_service_update_--mount-add $mount
Register-Completer docker_service_update_--network-add $networkAll
Register-Completer docker_service_update_--network-rm $networkAll
Register-Completer docker_service_update_--restart-condition (Get-Completer docker_service_create_--restart-condition)
Register-Completer docker_service_update_--rollback-failure-action (Get-Completer docker_service_create_--rollback-failure-action)
Register-Completer docker_service_update_--rollback-order (Get-Completer docker_service_create_--rollback-order)
Register-Completer docker_service_update_--secret-add { Get-Secret }
Register-Completer docker_service_update_--secret-rm { Get-Secret }
Register-Completer docker_service_update_--update-failure-action (Get-Completer docker_service_create_--update-failure-action)
Register-Completer docker_service_update_--update-order (Get-Completer docker_service_create_--update-order)

Register-Completer docker_stack_--orchestrator { 'swarm', 'kubernetes', 'all' }
Register-Completer docker_stack_deploy $stackAll
Register-Completer docker_stack_deploy_--resolve-image { 'always', 'changed', 'never' }
Register-Completer docker_stack_ps $stackAll
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
Register-Completer docker_stack_rm $stackAll
Register-Completer docker_stack_services $stackAll
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
		COMPGEN config string 'Config name or id'
		COMPGEN container string 'Container name or id'
		COMPGEN daemon string 'Daemon name or id'
		COMPGEN event string 'Event name'
		COMPGEN image string 'Image name or id'
		COMPGEN label string '<key> or <key>=<value>'
		COMPGEN network string 'Network name or id'
		COMPGEN node string 'Node id'
		COMPGEN plugin string 'Plugin name or id'
		COMPGEN scope string 'local or swarm'
		COMPGEN secret string 'Secret name or id'
		COMPGEN service string 'Service name or id'
		COMPGEN type string 'Object type'
		COMPGEN volume string 'Volume name or id'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		config { Get-Config }
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
		node { docker node ls --quiet }
		plugin { Get-Plugin }
		scope { 'local', 'swarm' }
		secret { Get-Secret }
		service { Get-Service }
		type { 'config', 'container', 'daemon', 'image', 'network', 'node', 'plugin', 'secret', 'service', 'volume' }
		volume { Get-Volume }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_system_events_-f (Get-Completer docker_system_events_--filter)
Register-Completer docker_system_events_--format $formatBasic
Register-Completer docker_system_info_--format $formatBasic

Register-Completer docker_trust_inspect $imageAll
Register-Completer docker_trust_revoke $imageAll
Register-Completer docker_trust_sign { Get-Image -WithTag }

Register-Completer docker_volume_create_--availability { 'active', 'drain', 'pause' }
Register-Completer docker_volume_create_--scope { 'multi', 'single' }
Register-Completer docker_volume_create_--sharing { 'all', 'none', 'onewriter', 'readonly' }
Register-Completer docker_volume_create_--type { 'block', 'mount' }
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
		name { Get-Volume }
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" string $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
Register-Completer docker_volume_ls_-f (Get-Completer docker_volume_ls_--filter)
Register-Completer docker_volume_ls_--format {
	"'{{.Driver}}'"
	"'{{.Label}}'"
	"'{{.Labels}}'"
	"'{{.Mountpoint}}'"
	"'{{.Name}}'"
	"'{{.Scope}}'"
}

Register-Completer docker_volume_rm $volumeAll
Register-Completer docker_volume_update $volumeCluster
Register-Completer docker_volume_update_--availability { 'active', 'drain', 'pause' }

Register-Completer docker_builder_build_--cache-from (Get-Completer docker_image_build_--cache-from)
Register-Completer docker_builder_build_--isolation (Get-Completer docker_image_build_--isolation)
Register-Completer docker_builder_build_--progress (Get-Completer docker_image_build_--progress)
Register-Completer docker_builder_build_--network (Get-Completer docker_image_build_--network)
Register-Completer docker_builder_build_--secret (Get-Completer docker_image_build_--secret)
Register-Completer docker_builder_build_--tag (Get-Completer docker_image_build_--tag)
Register-Completer docker_builder_build_-t (Get-Completer docker_image_build_-t)

Register-Completer docker_build_--cache-from (Get-Completer docker_image_build_--cache-from)
Register-Completer docker_build_--isolation (Get-Completer docker_image_build_--isolation)
Register-Completer docker_build_--progress (Get-Completer docker_image_build_--progress)
Register-Completer docker_build_--network (Get-Completer docker_image_build_--network)
Register-Completer docker_build_--secret (Get-Completer docker_image_build_--secret)
Register-Completer docker_build_--tag (Get-Completer docker_image_build_--tag)
Register-Completer docker_build_-t (Get-Completer docker_build_--tag)

Register-Completer docker_run (Get-Completer docker_container_run)
Register-Completer docker_run_--cap-add (Get-Completer docker_container_run_--cap-add)
Register-Completer docker_run_--cap-drop (Get-Completer docker_container_run_--cap-drop)
Register-Completer docker_run_--cgroupns (Get-Completer docker_container_run_--cgroupns)
Register-Completer docker_run_--isolation (Get-Completer docker_container_run_--isolation)
Register-Completer docker_run_--mount (Get-Completer docker_container_run_--mount)
Register-Completer docker_run_--network (Get-Completer docker_container_run_--network)
Register-Completer docker_run_--log-driver (Get-Completer docker_container_run_--log-driver)
Register-Completer docker_run_--pull (Get-Completer docker_container_run_--pull)
Register-Completer docker_run_--volume (Get-Completer docker_container_run_--volume)
Register-Completer docker_run_-v (Get-Completer docker_run_--volume)
Register-Completer docker_run_--volumes-from (Get-Completer docker_container_run_--volumes-from)

if ($env:DOCKER_HIDE_LEGACY_COMMANDS) {
	return
}

Register-Completer docker_attach (Get-Completer docker_container_attach)
Register-Completer docker_commit (Get-Completer docker_container_commit)
Register-Completer docker_create (Get-Completer docker_container_create)
Register-Completer docker_create_--cap-add (Get-Completer docker_container_create_--cap-add)
Register-Completer docker_create_--cap-drop (Get-Completer docker_container_create_--cap-drop)
Register-Completer docker_create_--cgroupns (Get-Completer docker_container_create_--cgroupns)
Register-Completer docker_create_--isolation (Get-Completer docker_container_create_--isolation)
Register-Completer docker_create_--log-driver (Get-Completer docker_container_create_--log-driver)
Register-Completer docker_create_--mount (Get-Completer docker_container_create_--mount)
Register-Completer docker_create_--pull (Get-Completer docker_container_create_--pull)
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
Register-Completer docker_history_--format (Get-Completer docker_image_history_--format)
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
			Get-Plugin
			Get-Secret
			Get-Service
			Get-Volume
		}
		container { Get-Container }
		image { Get-Image }
		network { Get-Network }
		node { Get-Node }
		plugin { Get-Plugin }
		secret { Get-Secret }
		service { Get-Service }
		volume { Get-Volume }
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
Register-Completer docker_pull (Get-Completer docker_image_pull)
Register-Completer docker_pull_--all-tags (Get-Completer docker_image_pull_--all-tags)
Register-Completer docker_pull_-a (Get-Completer docker_pull_--all-tags)
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
