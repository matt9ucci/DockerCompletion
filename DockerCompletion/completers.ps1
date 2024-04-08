# docker/cli v26.0.0 https://github.com/docker/cli/tree/v26.0.0
Register-Completer docker {
	COMPGEN builder ManagementCommand 'Manage builds'
	COMPGEN checkpoint ManagementCommand 'Manage checkpoints'
	COMPGEN compose ManagementCommand 'Docker Compose'
	COMPGEN config ManagementCommand 'Manage Swarm configs'
	COMPGEN container ManagementCommand 'Manage containers'
	COMPGEN context ManagementCommand 'Manage contexts'
	COMPGEN image ManagementCommand 'Manage images'
	COMPGEN manifest ManagementCommand 'Manage Docker image manifests and manifest lists'
	COMPGEN network ManagementCommand 'Manage networks'
	COMPGEN node ManagementCommand 'Manage Swarm nodes'
	COMPGEN plugin ManagementCommand 'Manage plugins'
	COMPGEN secret ManagementCommand 'Manage Swarm secrets'
	COMPGEN service ManagementCommand 'Manage Swarm services'
	COMPGEN stack ManagementCommand 'Manage Swarm stacks'
	COMPGEN swarm ManagementCommand 'Manage Swarm'
	COMPGEN system ManagementCommand 'Manage Docker'
	COMPGEN trust ManagementCommand 'Manage trust on Docker images'
	COMPGEN volume ManagementCommand 'Manage volumes'

	COMPGEN build TopLevelCommand 'Build an image from a Dockerfile'
	COMPGEN exec TopLevelCommand 'Execute a command in a running container'
	COMPGEN images TopLevelCommand 'List images'
	COMPGEN info TopLevelCommand 'Display system-wide information'
	COMPGEN login TopLevelCommand 'Log in to a registry'
	COMPGEN logout TopLevelCommand 'Log out from a registry'
	COMPGEN ps TopLevelCommand 'List containers'
	COMPGEN pull TopLevelCommand 'Download an image from a registry'
	COMPGEN push TopLevelCommand 'Upload an image to a registry'
	COMPGEN run TopLevelCommand 'Create and run a new container from an image'
	COMPGEN search TopLevelCommand 'Search Docker Hub for images'
	COMPGEN version TopLevelCommand 'Show the Docker version information'

	if (!$env:DOCKER_HIDE_LEGACY_COMMANDS) {
		COMPGEN attach LegacyCommand 'Attach local standard input, output, and error streams to a running container'
		COMPGEN commit LegacyCommand 'Create a new image from a container''s changes'
		COMPGEN cp LegacyCommand 'Copy files/folders between a container and the local filesystem'
		COMPGEN create LegacyCommand 'Create a new container'
		COMPGEN diff LegacyCommand 'Inspect changes to files or directories on a container''s filesystem'
		COMPGEN events LegacyCommand 'Get real time events from the server'
		COMPGEN export LegacyCommand 'Export a container''s filesystem as a tar archive'
		COMPGEN history LegacyCommand 'Show the history of an image'
		COMPGEN import LegacyCommand 'Import the contents from a tarball to create a filesystem image'
		COMPGEN inspect LegacyCommand 'Return low-level information on Docker objects'
		COMPGEN kill LegacyCommand 'Kill one or more running containers'
		COMPGEN load LegacyCommand 'Load an image from a tar archive or STDIN'
		COMPGEN logs LegacyCommand 'Fetch the logs of a container'
		COMPGEN pause LegacyCommand 'Pause all processes within one or more containers'
		COMPGEN port LegacyCommand 'List port mappings or a specific mapping for the container'
		COMPGEN rename LegacyCommand 'Rename a container'
		COMPGEN restart LegacyCommand 'Restart one or more containers'
		COMPGEN rm LegacyCommand 'Remove one or more containers'
		COMPGEN rmi LegacyCommand 'Remove one or more images'
		COMPGEN save LegacyCommand 'Save one or more images to a tar archive (streamed to STDOUT by default)'
		COMPGEN start LegacyCommand 'Start one or more stopped containers'
		COMPGEN stats LegacyCommand 'Display a live stream of container(s) resource usage statistics'
		COMPGEN stop LegacyCommand 'Stop one or more running containers'
		COMPGEN tag LegacyCommand 'Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE'
		COMPGEN top LegacyCommand 'Display the running processes of a container'
		COMPGEN unpause LegacyCommand 'Unpause all processes within one or more containers'
		COMPGEN update LegacyCommand 'Update configuration of one or more containers'
		COMPGEN wait LegacyCommand 'Block until one or more containers stop, then print their exit codes'
	}
}

Register-Completer docker -Option {
	COMPGEN --config string 'Location of client config files'
	COMPGEN '-c' string 'Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with "docker context use")'
	COMPGEN --context string 'Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with "docker context use")'
	COMPGEN '-D' Switch 'Enable debug mode'
	COMPGEN --debug Switch 'Enable debug mode'
	COMPGEN '-h' Switch 'Print usage'
	COMPGEN --help Switch 'Print usage'
	COMPGEN '-H' list 'Daemon socket to connect to'
	COMPGEN --host list 'Daemon socket to connect to'
	COMPGEN '-l' string 'Set the logging level ("debug", "info", "warn", "error", "fatal")'
	COMPGEN --log-level string 'Set the logging level ("debug", "info", "warn", "error", "fatal")'
	COMPGEN --tls Switch 'Use TLS; implied by --tlsverify'
	COMPGEN --tlscacert string 'Trust certs signed only by this CA'
	COMPGEN --tlscert string 'Path to TLS certificate file'
	COMPGEN --tlskey string 'Path to TLS key file'
	COMPGEN --tlsverify Switch 'Use TLS and verify the remote'
	COMPGEN '-v' Switch 'Print version information and quit'
	COMPGEN --version Switch 'Print version information and quit'
}

Register-Completer docker_builder {
	COMPGEN build SubCommand 'Build an image from a Dockerfile'
	COMPGEN prune SubCommand 'Remove build cache'
}

Register-Completer docker_builder_build -Option {
	COMPGEN --add-host list 'Add a custom host-to-IP mapping ("host:ip")'
	COMPGEN --build-arg list 'Set build-time variables'
	COMPGEN --cache-from strings 'Images to consider as cache sources'
	COMPGEN --cgroup-parent string 'Set the parent cgroup for the "RUN" instructions during build'
	COMPGEN --compress Switch 'Compress the build context using gzip'
	COMPGEN --cpu-period int 'Limit the CPU CFS (Completely Fair Scheduler) period'
	COMPGEN --cpu-quota int 'Limit the CPU CFS (Completely Fair Scheduler) quota'
	COMPGEN '-c' int 'CPU shares (relative weight)'
	COMPGEN --cpu-shares int 'CPU shares (relative weight)'
	COMPGEN --cpuset-cpus string 'CPUs in which to allow execution (0-3, 0,1)'
	COMPGEN --cpuset-mems string 'MEMs in which to allow execution (0-3, 0,1)'
	COMPGEN --disable-content-trust Switch 'Skip image verification'
	COMPGEN '-f' string 'Name of the Dockerfile (Default is "PATH/Dockerfile")'
	COMPGEN --file string 'Name of the Dockerfile (Default is "PATH/Dockerfile")'
	COMPGEN --force-rm Switch 'Always remove intermediate containers'
	COMPGEN --iidfile string 'Write the image ID to the file'
	COMPGEN --isolation string 'Container isolation technology'
	COMPGEN --label list 'Set metadata for an image'
	COMPGEN '-m' bytes 'Memory limit'
	COMPGEN --memory bytes 'Memory limit'
	COMPGEN --memory-swap bytes 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
	COMPGEN --network string 'Set the networking mode for the RUN instructions during build'
	COMPGEN --no-cache Switch 'Do not use cache when building the image'
	COMPGEN --platform string 'Set platform if server is multi-platform capable'
	COMPGEN --pull Switch 'Always attempt to pull a newer version of the image'
	COMPGEN '-q' Switch 'Suppress the build output and print image ID on success'
	COMPGEN --quiet Switch 'Suppress the build output and print image ID on success'
	COMPGEN --rm Switch 'Remove intermediate containers after a successful build'
	COMPGEN --security-opt strings 'Security options'
	COMPGEN --shm-size bytes 'Size of "/dev/shm"'
	COMPGEN --squash Switch 'Squash newly built layers into a single new layer'
	COMPGEN '-t' list 'Name and optionally a tag in the "name:tag" format'
	COMPGEN --tag list 'Name and optionally a tag in the "name:tag" format'
	COMPGEN --target string 'Set the target build stage to build.'
	COMPGEN --ulimit ulimit 'Ulimit options'
}

Register-Completer docker_builder_prune -Option {
	COMPGEN '-a' Switch 'Remove all unused build cache, not just dangling ones'
	COMPGEN --all Switch 'Remove all unused build cache, not just dangling ones'
	COMPGEN --filter filter 'Provide filter values (e.g. "until=24h")'
	COMPGEN '-f' Switch 'Do not prompt for confirmation'
	COMPGEN --force Switch 'Do not prompt for confirmation'
	COMPGEN --keep-storage bytes 'Amount of disk space to keep for cache'
}

Register-Completer docker_checkpoint {
	COMPGEN create SubCommand 'Create a checkpoint from a running container'
	COMPGEN ls SubCommand 'List checkpoints for a container'
	COMPGEN rm SubCommand 'Remove a checkpoint'
}

Register-Completer docker_checkpoint_create -Option {
	COMPGEN --checkpoint-dir string 'Use a custom checkpoint storage directory'
	COMPGEN --leave-running Switch 'Leave the container running after checkpoint'
}

Register-Completer docker_checkpoint_ls -Option {
	COMPGEN --checkpoint-dir string 'Use a custom checkpoint storage directory'
}

Register-Completer docker_checkpoint_rm -Option {
	COMPGEN --checkpoint-dir string 'Use a custom checkpoint storage directory'
}

Register-Completer docker_config {
	COMPGEN create SubCommand 'Create a config from a file or STDIN'
	COMPGEN inspect SubCommand 'Display detailed information on one or more configs'
	COMPGEN ls SubCommand 'List configs'
	COMPGEN rm SubCommand 'Remove one or more configs'
}

Register-Completer docker_config_create -Option {
	COMPGEN '-l' list 'Config labels'
	COMPGEN --label list 'Config labels'
	COMPGEN --template-driver string 'Template driver'
}

Register-Completer docker_config_inspect -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --pretty Switch 'Print the information in a human friendly format'
}

Register-Completer docker_config_ls -Option {
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-q' Switch 'Only display IDs'
	COMPGEN --quiet Switch 'Only display IDs'
}

Register-Completer docker_container {
	COMPGEN attach SubCommand 'Attach local standard input, output, and error streams to a running container'
	COMPGEN commit SubCommand 'Create a new image from a container''s changes'
	COMPGEN cp SubCommand 'Copy files/folders between a container and the local filesystem'
	COMPGEN create SubCommand 'Create a new container'
	COMPGEN diff SubCommand 'Inspect changes to files or directories on a container''s filesystem'
	COMPGEN exec SubCommand 'Execute a command in a running container'
	COMPGEN export SubCommand 'Export a container''s filesystem as a tar archive'
	COMPGEN inspect SubCommand 'Display detailed information on one or more containers'
	COMPGEN kill SubCommand 'Kill one or more running containers'
	COMPGEN logs SubCommand 'Fetch the logs of a container'
	COMPGEN ls SubCommand 'List containers'
	COMPGEN pause SubCommand 'Pause all processes within one or more containers'
	COMPGEN port SubCommand 'List port mappings or a specific mapping for the container'
	COMPGEN prune SubCommand 'Remove all stopped containers'
	COMPGEN rename SubCommand 'Rename a container'
	COMPGEN restart SubCommand 'Restart one or more containers'
	COMPGEN rm SubCommand 'Remove one or more containers'
	COMPGEN run SubCommand 'Create and run a new container from an image'
	COMPGEN start SubCommand 'Start one or more stopped containers'
	COMPGEN stats SubCommand 'Display a live stream of container(s) resource usage statistics'
	COMPGEN stop SubCommand 'Stop one or more running containers'
	COMPGEN top SubCommand 'Display the running processes of a container'
	COMPGEN unpause SubCommand 'Unpause all processes within one or more containers'
	COMPGEN update SubCommand 'Update configuration of one or more containers'
	COMPGEN wait SubCommand 'Block until one or more containers stop, then print their exit codes'
}

Register-Completer docker_container_attach -Option {
	COMPGEN --detach-keys string 'Override the key sequence for detaching a container'
	COMPGEN --no-stdin Switch 'Do not attach STDIN'
	COMPGEN --sig-proxy Switch 'Proxy all received signals to the process'
}

Register-Completer docker_container_commit -Option {
	COMPGEN '-a' string 'Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")'
	COMPGEN --author string 'Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")'
	COMPGEN '-c' list 'Apply Dockerfile instruction to the created image'
	COMPGEN --change list 'Apply Dockerfile instruction to the created image'
	COMPGEN '-m' string 'Commit message'
	COMPGEN --message string 'Commit message'
	COMPGEN '-p' Switch 'Pause container during commit'
	COMPGEN --pause Switch 'Pause container during commit'
}

Register-Completer docker_container_cp -Option {
	COMPGEN '-a' Switch 'Archive mode (copy all uid/gid information)'
	COMPGEN --archive Switch 'Archive mode (copy all uid/gid information)'
	COMPGEN '-L' Switch 'Always follow symbol link in SRC_PATH'
	COMPGEN --follow-link Switch 'Always follow symbol link in SRC_PATH'
	COMPGEN '-q' Switch 'Suppress progress output during copy. Progress output is automatically suppressed if no terminal is attached'
	COMPGEN --quiet Switch 'Suppress progress output during copy. Progress output is automatically suppressed if no terminal is attached'
}

Register-Completer docker_container_create -Option {
	COMPGEN --add-host list 'Add a custom host-to-IP mapping (host:ip)'
	COMPGEN --annotation map 'Add an annotation to the container (passed through to the OCI runtime)'
	COMPGEN '-a' list 'Attach to STDIN, STDOUT or STDERR'
	COMPGEN --attach list 'Attach to STDIN, STDOUT or STDERR'
	COMPGEN --blkio-weight uint16 'Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)'
	COMPGEN --blkio-weight-device list 'Block IO weight (relative device weight)'
	COMPGEN --cap-add list 'Add Linux capabilities'
	COMPGEN --cap-drop list 'Drop Linux capabilities'
	COMPGEN --cgroup-parent string 'Optional parent cgroup for the container'
	COMPGEN --cgroupns string 'Cgroup namespace to use (host|private)
''host'':    Run the container in the Docker host''s cgroup namespace
''private'': Run the container in its own private cgroup namespace
'''':        Use the cgroup namespace as configured by the
           default-cgroupns-mode option on the daemon (default)'
	COMPGEN --cidfile string 'Write the container ID to the file'
	COMPGEN --cpu-count int 'CPU count (Windows only)'
	COMPGEN --cpu-percent int 'CPU percent (Windows only)'
	COMPGEN --cpu-period int 'Limit CPU CFS (Completely Fair Scheduler) period'
	COMPGEN --cpu-quota int 'Limit CPU CFS (Completely Fair Scheduler) quota'
	COMPGEN --cpu-rt-period int 'Limit CPU real-time period in microseconds'
	COMPGEN --cpu-rt-runtime int 'Limit CPU real-time runtime in microseconds'
	COMPGEN '-c' int 'CPU shares (relative weight)'
	COMPGEN --cpu-shares int 'CPU shares (relative weight)'
	COMPGEN --cpus decimal 'Number of CPUs'
	COMPGEN --cpuset-cpus string 'CPUs in which to allow execution (0-3, 0,1)'
	COMPGEN --cpuset-mems string 'MEMs in which to allow execution (0-3, 0,1)'
	COMPGEN --device list 'Add a host device to the container'
	COMPGEN --device-cgroup-rule list 'Add a rule to the cgroup allowed devices list'
	COMPGEN --device-read-bps list 'Limit read rate (bytes per second) from a device'
	COMPGEN --device-read-iops list 'Limit read rate (IO per second) from a device'
	COMPGEN --device-write-bps list 'Limit write rate (bytes per second) to a device'
	COMPGEN --device-write-iops list 'Limit write rate (IO per second) to a device'
	COMPGEN --disable-content-trust Switch 'Skip image verification'
	COMPGEN --dns list 'Set custom DNS servers'
	COMPGEN --dns-option list 'Set DNS options'
	COMPGEN --dns-search list 'Set custom DNS search domains'
	COMPGEN --domainname string 'Container NIS domain name'
	COMPGEN --entrypoint string 'Overwrite the default ENTRYPOINT of the image'
	COMPGEN '-e' list 'Set environment variables'
	COMPGEN --env list 'Set environment variables'
	COMPGEN --env-file list 'Read in a file of environment variables'
	COMPGEN --expose list 'Expose a port or a range of ports'
	COMPGEN --gpus gpu-request 'GPU devices to add to the container (''all'' to pass all GPUs)'
	COMPGEN --group-add list 'Add additional groups to join'
	COMPGEN --health-cmd string 'Command to run to check health'
	COMPGEN --health-interval duration 'Time between running the check (ms|s|m|h) (default 0s)'
	COMPGEN --health-retries int 'Consecutive failures needed to report unhealthy'
	COMPGEN --health-start-interval duration 'Time between running the check during the start period (ms|s|m|h) (default 0s)'
	COMPGEN --health-start-period duration 'Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)'
	COMPGEN --health-timeout duration 'Maximum time to allow one check to run (ms|s|m|h) (default 0s)'
	COMPGEN --help Switch 'Print usage'
	COMPGEN '-h' string 'Container host name'
	COMPGEN --hostname string 'Container host name'
	COMPGEN --init Switch 'Run an init inside the container that forwards signals and reaps processes'
	COMPGEN '-i' Switch 'Keep STDIN open even if not attached'
	COMPGEN --interactive Switch 'Keep STDIN open even if not attached'
	COMPGEN --io-maxbandwidth bytes 'Maximum IO bandwidth limit for the system drive (Windows only)'
	COMPGEN --io-maxiops uint 'Maximum IOps limit for the system drive (Windows only)'
	COMPGEN --ip string 'IPv4 address (e.g., 172.30.100.104)'
	COMPGEN --ip6 string 'IPv6 address (e.g., 2001:db8::33)'
	COMPGEN --ipc string 'IPC mode to use'
	COMPGEN --isolation string 'Container isolation technology'
	COMPGEN --kernel-memory bytes 'Kernel memory limit'
	COMPGEN '-l' list 'Set meta data on a container'
	COMPGEN --label list 'Set meta data on a container'
	COMPGEN --label-file list 'Read in a line delimited file of labels'
	COMPGEN --link list 'Add link to another container'
	COMPGEN --link-local-ip list 'Container IPv4/IPv6 link-local addresses'
	COMPGEN --log-driver string 'Logging driver for the container'
	COMPGEN --log-opt list 'Log driver options'
	COMPGEN --mac-address string 'Container MAC address (e.g., 92:d0:c6:0a:29:33)'
	COMPGEN '-m' bytes 'Memory limit'
	COMPGEN --memory bytes 'Memory limit'
	COMPGEN --memory-reservation bytes 'Memory soft limit'
	COMPGEN --memory-swap bytes 'Swap limit equal to memory plus swap: ''-1'' to enable unlimited swap'
	COMPGEN --memory-swappiness int 'Tune container memory swappiness (0 to 100)'
	COMPGEN --mount mount 'Attach a filesystem mount to the container'
	COMPGEN --name string 'Assign a name to the container'
	COMPGEN --network network 'Connect a container to a network'
	COMPGEN --network-alias list 'Add network-scoped alias for the container'
	COMPGEN --no-healthcheck Switch 'Disable any container-specified HEALTHCHECK'
	COMPGEN --oom-kill-disable Switch 'Disable OOM Killer'
	COMPGEN --oom-score-adj int 'Tune host''s OOM preferences (-1000 to 1000)'
	COMPGEN --pid string 'PID namespace to use'
	COMPGEN --pids-limit int 'Tune container pids limit (set -1 for unlimited)'
	COMPGEN --platform string 'Set platform if server is multi-platform capable'
	COMPGEN --privileged Switch 'Give extended privileges to this container'
	COMPGEN '-p' list 'Publish a container''s port(s) to the host'
	COMPGEN --publish list 'Publish a container''s port(s) to the host'
	COMPGEN '-P' Switch 'Publish all exposed ports to random ports'
	COMPGEN --publish-all Switch 'Publish all exposed ports to random ports'
	COMPGEN --pull string 'Pull image before creating ("always", "|missing", "never")'
	COMPGEN '-q' Switch 'Suppress the pull output'
	COMPGEN --quiet Switch 'Suppress the pull output'
	COMPGEN --read-only Switch 'Mount the container''s root filesystem as read only'
	COMPGEN --restart string 'Restart policy to apply when a container exits'
	COMPGEN --rm Switch 'Automatically remove the container when it exits'
	COMPGEN --runtime string 'Runtime to use for this container'
	COMPGEN --security-opt list 'Security Options'
	COMPGEN --shm-size bytes 'Size of /dev/shm'
	COMPGEN --stop-signal string 'Signal to stop the container'
	COMPGEN --stop-timeout int 'Timeout (in seconds) to stop a container'
	COMPGEN --storage-opt list 'Storage driver options for the container'
	COMPGEN --sysctl map 'Sysctl options'
	COMPGEN --tmpfs list 'Mount a tmpfs directory'
	COMPGEN '-t' Switch 'Allocate a pseudo-TTY'
	COMPGEN --tty Switch 'Allocate a pseudo-TTY'
	COMPGEN --ulimit ulimit 'Ulimit options'
	COMPGEN '-u' string 'Username or UID (format: <name|uid>[:<group|gid>])'
	COMPGEN --user string 'Username or UID (format: <name|uid>[:<group|gid>])'
	COMPGEN --userns string 'User namespace to use'
	COMPGEN --uts string 'UTS namespace to use'
	COMPGEN '-v' list 'Bind mount a volume'
	COMPGEN --volume list 'Bind mount a volume'
	COMPGEN --volume-driver string 'Optional volume driver for the container'
	COMPGEN --volumes-from list 'Mount volumes from the specified container(s)'
	COMPGEN '-w' string 'Working directory inside the container'
	COMPGEN --workdir string 'Working directory inside the container'
}

Register-Completer docker_container_exec -Option {
	COMPGEN '-d' Switch 'Detached mode: run command in the background'
	COMPGEN --detach Switch 'Detached mode: run command in the background'
	COMPGEN --detach-keys string 'Override the key sequence for detaching a container'
	COMPGEN '-e' list 'Set environment variables'
	COMPGEN --env list 'Set environment variables'
	COMPGEN --env-file list 'Read in a file of environment variables'
	COMPGEN '-i' Switch 'Keep STDIN open even if not attached'
	COMPGEN --interactive Switch 'Keep STDIN open even if not attached'
	COMPGEN --privileged Switch 'Give extended privileges to the command'
	COMPGEN '-t' Switch 'Allocate a pseudo-TTY'
	COMPGEN --tty Switch 'Allocate a pseudo-TTY'
	COMPGEN '-u' string 'Username or UID (format: "<name|uid>[:<group|gid>]")'
	COMPGEN --user string 'Username or UID (format: "<name|uid>[:<group|gid>]")'
	COMPGEN '-w' string 'Working directory inside the container'
	COMPGEN --workdir string 'Working directory inside the container'
}

Register-Completer docker_container_export -Option {
	COMPGEN '-o' string 'Write to a file, instead of STDOUT'
	COMPGEN --output string 'Write to a file, instead of STDOUT'
}

Register-Completer docker_container_inspect -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-s' Switch 'Display total file sizes'
	COMPGEN --size Switch 'Display total file sizes'
}

Register-Completer docker_container_kill -Option {
	COMPGEN '-s' string 'Signal to send to the container'
	COMPGEN --signal string 'Signal to send to the container'
}

Register-Completer docker_container_logs -Option {
	COMPGEN --details Switch 'Show extra details provided to logs'
	COMPGEN '-f' Switch 'Follow log output'
	COMPGEN --follow Switch 'Follow log output'
	COMPGEN --since string 'Show logs since timestamp (e.g. "2013-01-02T13:23:37Z") or relative (e.g. "42m" for 42 minutes)'
	COMPGEN '-n' string 'Number of lines to show from the end of the logs'
	COMPGEN --tail string 'Number of lines to show from the end of the logs'
	COMPGEN '-t' Switch 'Show timestamps'
	COMPGEN --timestamps Switch 'Show timestamps'
	COMPGEN --until string 'Show logs before a timestamp (e.g. "2013-01-02T13:23:37Z") or relative (e.g. "42m" for 42 minutes)'
}

Register-Completer docker_container_ls -Option {
	COMPGEN '-a' Switch 'Show all containers (default shows just running)'
	COMPGEN --all Switch 'Show all containers (default shows just running)'
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-n' int 'Show n last created containers (includes all states)'
	COMPGEN --last int 'Show n last created containers (includes all states)'
	COMPGEN '-l' Switch 'Show the latest created container (includes all states)'
	COMPGEN --latest Switch 'Show the latest created container (includes all states)'
	COMPGEN --no-trunc Switch 'Don''t truncate output'
	COMPGEN '-q' Switch 'Only display container IDs'
	COMPGEN --quiet Switch 'Only display container IDs'
	COMPGEN '-s' Switch 'Display total file sizes'
	COMPGEN --size Switch 'Display total file sizes'
}

Register-Completer docker_container_prune -Option {
	COMPGEN --filter filter 'Provide filter values (e.g. "until=<timestamp>")'
	COMPGEN '-f' Switch 'Do not prompt for confirmation'
	COMPGEN --force Switch 'Do not prompt for confirmation'
}

Register-Completer docker_container_restart -Option {
	COMPGEN '-s' string 'Signal to send to the container'
	COMPGEN --signal string 'Signal to send to the container'
	COMPGEN '-t' int 'Seconds to wait before killing the container'
	COMPGEN --time int 'Seconds to wait before killing the container'
}

Register-Completer docker_container_rm -Option {
	COMPGEN '-f' Switch 'Force the removal of a running container (uses SIGKILL)'
	COMPGEN --force Switch 'Force the removal of a running container (uses SIGKILL)'
	COMPGEN '-l' Switch 'Remove the specified link'
	COMPGEN --link Switch 'Remove the specified link'
	COMPGEN '-v' Switch 'Remove anonymous volumes associated with the container'
	COMPGEN --volumes Switch 'Remove anonymous volumes associated with the container'
}

Register-Completer docker_container_run -Option {
	COMPGEN --add-host list 'Add a custom host-to-IP mapping (host:ip)'
	COMPGEN --annotation map 'Add an annotation to the container (passed through to the OCI runtime)'
	COMPGEN '-a' list 'Attach to STDIN, STDOUT or STDERR'
	COMPGEN --attach list 'Attach to STDIN, STDOUT or STDERR'
	COMPGEN --blkio-weight uint16 'Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)'
	COMPGEN --blkio-weight-device list 'Block IO weight (relative device weight)'
	COMPGEN --cap-add list 'Add Linux capabilities'
	COMPGEN --cap-drop list 'Drop Linux capabilities'
	COMPGEN --cgroup-parent string 'Optional parent cgroup for the container'
	COMPGEN --cgroupns string 'Cgroup namespace to use (host|private)
''host'':    Run the container in the Docker host''s cgroup namespace
''private'': Run the container in its own private cgroup namespace
'''':        Use the cgroup namespace as configured by the
           default-cgroupns-mode option on the daemon (default)'
	COMPGEN --cidfile string 'Write the container ID to the file'
	COMPGEN --cpu-count int 'CPU count (Windows only)'
	COMPGEN --cpu-percent int 'CPU percent (Windows only)'
	COMPGEN --cpu-period int 'Limit CPU CFS (Completely Fair Scheduler) period'
	COMPGEN --cpu-quota int 'Limit CPU CFS (Completely Fair Scheduler) quota'
	COMPGEN --cpu-rt-period int 'Limit CPU real-time period in microseconds'
	COMPGEN --cpu-rt-runtime int 'Limit CPU real-time runtime in microseconds'
	COMPGEN '-c' int 'CPU shares (relative weight)'
	COMPGEN --cpu-shares int 'CPU shares (relative weight)'
	COMPGEN --cpus decimal 'Number of CPUs'
	COMPGEN --cpuset-cpus string 'CPUs in which to allow execution (0-3, 0,1)'
	COMPGEN --cpuset-mems string 'MEMs in which to allow execution (0-3, 0,1)'
	COMPGEN '-d' Switch 'Run container in background and print container ID'
	COMPGEN --detach Switch 'Run container in background and print container ID'
	COMPGEN --detach-keys string 'Override the key sequence for detaching a container'
	COMPGEN --device list 'Add a host device to the container'
	COMPGEN --device-cgroup-rule list 'Add a rule to the cgroup allowed devices list'
	COMPGEN --device-read-bps list 'Limit read rate (bytes per second) from a device'
	COMPGEN --device-read-iops list 'Limit read rate (IO per second) from a device'
	COMPGEN --device-write-bps list 'Limit write rate (bytes per second) to a device'
	COMPGEN --device-write-iops list 'Limit write rate (IO per second) to a device'
	COMPGEN --disable-content-trust Switch 'Skip image verification'
	COMPGEN --dns list 'Set custom DNS servers'
	COMPGEN --dns-option list 'Set DNS options'
	COMPGEN --dns-search list 'Set custom DNS search domains'
	COMPGEN --domainname string 'Container NIS domain name'
	COMPGEN --entrypoint string 'Overwrite the default ENTRYPOINT of the image'
	COMPGEN '-e' list 'Set environment variables'
	COMPGEN --env list 'Set environment variables'
	COMPGEN --env-file list 'Read in a file of environment variables'
	COMPGEN --expose list 'Expose a port or a range of ports'
	COMPGEN --gpus gpu-request 'GPU devices to add to the container (''all'' to pass all GPUs)'
	COMPGEN --group-add list 'Add additional groups to join'
	COMPGEN --health-cmd string 'Command to run to check health'
	COMPGEN --health-interval duration 'Time between running the check (ms|s|m|h) (default 0s)'
	COMPGEN --health-retries int 'Consecutive failures needed to report unhealthy'
	COMPGEN --health-start-interval duration 'Time between running the check during the start period (ms|s|m|h) (default 0s)'
	COMPGEN --health-start-period duration 'Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)'
	COMPGEN --health-timeout duration 'Maximum time to allow one check to run (ms|s|m|h) (default 0s)'
	COMPGEN --help Switch 'Print usage'
	COMPGEN '-h' string 'Container host name'
	COMPGEN --hostname string 'Container host name'
	COMPGEN --init Switch 'Run an init inside the container that forwards signals and reaps processes'
	COMPGEN '-i' Switch 'Keep STDIN open even if not attached'
	COMPGEN --interactive Switch 'Keep STDIN open even if not attached'
	COMPGEN --io-maxbandwidth bytes 'Maximum IO bandwidth limit for the system drive (Windows only)'
	COMPGEN --io-maxiops uint 'Maximum IOps limit for the system drive (Windows only)'
	COMPGEN --ip string 'IPv4 address (e.g., 172.30.100.104)'
	COMPGEN --ip6 string 'IPv6 address (e.g., 2001:db8::33)'
	COMPGEN --ipc string 'IPC mode to use'
	COMPGEN --isolation string 'Container isolation technology'
	COMPGEN --kernel-memory bytes 'Kernel memory limit'
	COMPGEN '-l' list 'Set meta data on a container'
	COMPGEN --label list 'Set meta data on a container'
	COMPGEN --label-file list 'Read in a line delimited file of labels'
	COMPGEN --link list 'Add link to another container'
	COMPGEN --link-local-ip list 'Container IPv4/IPv6 link-local addresses'
	COMPGEN --log-driver string 'Logging driver for the container'
	COMPGEN --log-opt list 'Log driver options'
	COMPGEN --mac-address string 'Container MAC address (e.g., 92:d0:c6:0a:29:33)'
	COMPGEN '-m' bytes 'Memory limit'
	COMPGEN --memory bytes 'Memory limit'
	COMPGEN --memory-reservation bytes 'Memory soft limit'
	COMPGEN --memory-swap bytes 'Swap limit equal to memory plus swap: ''-1'' to enable unlimited swap'
	COMPGEN --memory-swappiness int 'Tune container memory swappiness (0 to 100)'
	COMPGEN --mount mount 'Attach a filesystem mount to the container'
	COMPGEN --name string 'Assign a name to the container'
	COMPGEN --network network 'Connect a container to a network'
	COMPGEN --network-alias list 'Add network-scoped alias for the container'
	COMPGEN --no-healthcheck Switch 'Disable any container-specified HEALTHCHECK'
	COMPGEN --oom-kill-disable Switch 'Disable OOM Killer'
	COMPGEN --oom-score-adj int 'Tune host''s OOM preferences (-1000 to 1000)'
	COMPGEN --pid string 'PID namespace to use'
	COMPGEN --pids-limit int 'Tune container pids limit (set -1 for unlimited)'
	COMPGEN --platform string 'Set platform if server is multi-platform capable'
	COMPGEN --privileged Switch 'Give extended privileges to this container'
	COMPGEN '-p' list 'Publish a container''s port(s) to the host'
	COMPGEN --publish list 'Publish a container''s port(s) to the host'
	COMPGEN '-P' Switch 'Publish all exposed ports to random ports'
	COMPGEN --publish-all Switch 'Publish all exposed ports to random ports'
	COMPGEN --pull string 'Pull image before running ("always", "missing", "never")'
	COMPGEN '-q' Switch 'Suppress the pull output'
	COMPGEN --quiet Switch 'Suppress the pull output'
	COMPGEN --read-only Switch 'Mount the container''s root filesystem as read only'
	COMPGEN --restart string 'Restart policy to apply when a container exits'
	COMPGEN --rm Switch 'Automatically remove the container when it exits'
	COMPGEN --runtime string 'Runtime to use for this container'
	COMPGEN --security-opt list 'Security Options'
	COMPGEN --shm-size bytes 'Size of /dev/shm'
	COMPGEN --sig-proxy Switch 'Proxy received signals to the process'
	COMPGEN --stop-signal string 'Signal to stop the container'
	COMPGEN --stop-timeout int 'Timeout (in seconds) to stop a container'
	COMPGEN --storage-opt list 'Storage driver options for the container'
	COMPGEN --sysctl map 'Sysctl options'
	COMPGEN --tmpfs list 'Mount a tmpfs directory'
	COMPGEN '-t' Switch 'Allocate a pseudo-TTY'
	COMPGEN --tty Switch 'Allocate a pseudo-TTY'
	COMPGEN --ulimit ulimit 'Ulimit options'
	COMPGEN '-u' string 'Username or UID (format: <name|uid>[:<group|gid>])'
	COMPGEN --user string 'Username or UID (format: <name|uid>[:<group|gid>])'
	COMPGEN --userns string 'User namespace to use'
	COMPGEN --uts string 'UTS namespace to use'
	COMPGEN '-v' list 'Bind mount a volume'
	COMPGEN --volume list 'Bind mount a volume'
	COMPGEN --volume-driver string 'Optional volume driver for the container'
	COMPGEN --volumes-from list 'Mount volumes from the specified container(s)'
	COMPGEN '-w' string 'Working directory inside the container'
	COMPGEN --workdir string 'Working directory inside the container'
}

Register-Completer docker_container_start -Option {
	COMPGEN '-a' Switch 'Attach STDOUT/STDERR and forward signals'
	COMPGEN --attach Switch 'Attach STDOUT/STDERR and forward signals'
	COMPGEN --checkpoint string 'Restore from this checkpoint'
	COMPGEN --checkpoint-dir string 'Use a custom checkpoint storage directory'
	COMPGEN --detach-keys string 'Override the key sequence for detaching a container'
	COMPGEN '-i' Switch 'Attach container''s STDIN'
	COMPGEN --interactive Switch 'Attach container''s STDIN'
}

Register-Completer docker_container_stats -Option {
	COMPGEN '-a' Switch 'Show all containers (default shows just running)'
	COMPGEN --all Switch 'Show all containers (default shows just running)'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --no-stream Switch 'Disable streaming stats and only pull the first result'
	COMPGEN --no-trunc Switch 'Do not truncate output'
}

Register-Completer docker_container_stop -Option {
	COMPGEN '-s' string 'Signal to send to the container'
	COMPGEN --signal string 'Signal to send to the container'
	COMPGEN '-t' int 'Seconds to wait before killing the container'
	COMPGEN --time int 'Seconds to wait before killing the container'
}

Register-Completer docker_container_update -Option {
	COMPGEN --blkio-weight uint16 'Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)'
	COMPGEN --cpu-period int 'Limit CPU CFS (Completely Fair Scheduler) period'
	COMPGEN --cpu-quota int 'Limit CPU CFS (Completely Fair Scheduler) quota'
	COMPGEN --cpu-rt-period int 'Limit the CPU real-time period in microseconds'
	COMPGEN --cpu-rt-runtime int 'Limit the CPU real-time runtime in microseconds'
	COMPGEN '-c' int 'CPU shares (relative weight)'
	COMPGEN --cpu-shares int 'CPU shares (relative weight)'
	COMPGEN --cpus decimal 'Number of CPUs'
	COMPGEN --cpuset-cpus string 'CPUs in which to allow execution (0-3, 0,1)'
	COMPGEN --cpuset-mems string 'MEMs in which to allow execution (0-3, 0,1)'
	COMPGEN '-m' bytes 'Memory limit'
	COMPGEN --memory bytes 'Memory limit'
	COMPGEN --memory-reservation bytes 'Memory soft limit'
	COMPGEN --memory-swap bytes 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
	COMPGEN --pids-limit int 'Tune container pids limit (set -1 for unlimited)'
	COMPGEN --restart string 'Restart policy to apply when a container exits'
}

Register-Completer docker_context {
	COMPGEN create SubCommand 'Create a context'
	COMPGEN export SubCommand 'Export a context to a tar archive FILE or a tar stream on STDOUT.'
	COMPGEN import SubCommand 'Import a context from a tar or zip file'
	COMPGEN inspect SubCommand 'Display detailed information on one or more contexts'
	COMPGEN ls SubCommand 'List contexts'
	COMPGEN rm SubCommand 'Remove one or more contexts'
	COMPGEN show SubCommand 'Print the name of the current context'
	COMPGEN update SubCommand 'Update a context'
	COMPGEN use SubCommand 'Set the current docker context'
}

Register-Completer docker_context_create -Option {
	COMPGEN --description string 'Description of the context'
	COMPGEN --docker stringToString 'set the docker endpoint'
	COMPGEN --from string 'create context from a named context'
}

Register-Completer docker_context_inspect -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
}

Register-Completer docker_context_ls -Option {
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-q' Switch 'Only show context names'
	COMPGEN --quiet Switch 'Only show context names'
}

Register-Completer docker_context_rm -Option {
	COMPGEN '-f' Switch 'Force the removal of a context in use'
	COMPGEN --force Switch 'Force the removal of a context in use'
}

Register-Completer docker_context_update -Option {
	COMPGEN --description string 'Description of the context'
	COMPGEN --docker stringToString 'set the docker endpoint'
}

Register-Completer docker_image {
	COMPGEN build SubCommand 'Build an image from a Dockerfile'
	COMPGEN history SubCommand 'Show the history of an image'
	COMPGEN import SubCommand 'Import the contents from a tarball to create a filesystem image'
	COMPGEN inspect SubCommand 'Display detailed information on one or more images'
	COMPGEN load SubCommand 'Load an image from a tar archive or STDIN'
	COMPGEN ls SubCommand 'List images'
	COMPGEN prune SubCommand 'Remove unused images'
	COMPGEN pull SubCommand 'Download an image from a registry'
	COMPGEN push SubCommand 'Upload an image to a registry'
	COMPGEN rm SubCommand 'Remove one or more images'
	COMPGEN save SubCommand 'Save one or more images to a tar archive (streamed to STDOUT by default)'
	COMPGEN tag SubCommand 'Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE'
}

Register-Completer docker_image_build -Option {
	COMPGEN --add-host list 'Add a custom host-to-IP mapping ("host:ip")'
	COMPGEN --build-arg list 'Set build-time variables'
	COMPGEN --cache-from strings 'Images to consider as cache sources'
	COMPGEN --cgroup-parent string 'Set the parent cgroup for the "RUN" instructions during build'
	COMPGEN --compress Switch 'Compress the build context using gzip'
	COMPGEN --cpu-period int 'Limit the CPU CFS (Completely Fair Scheduler) period'
	COMPGEN --cpu-quota int 'Limit the CPU CFS (Completely Fair Scheduler) quota'
	COMPGEN '-c' int 'CPU shares (relative weight)'
	COMPGEN --cpu-shares int 'CPU shares (relative weight)'
	COMPGEN --cpuset-cpus string 'CPUs in which to allow execution (0-3, 0,1)'
	COMPGEN --cpuset-mems string 'MEMs in which to allow execution (0-3, 0,1)'
	COMPGEN --disable-content-trust Switch 'Skip image verification'
	COMPGEN '-f' string 'Name of the Dockerfile (Default is "PATH/Dockerfile")'
	COMPGEN --file string 'Name of the Dockerfile (Default is "PATH/Dockerfile")'
	COMPGEN --force-rm Switch 'Always remove intermediate containers'
	COMPGEN --iidfile string 'Write the image ID to the file'
	COMPGEN --isolation string 'Container isolation technology'
	COMPGEN --label list 'Set metadata for an image'
	COMPGEN '-m' bytes 'Memory limit'
	COMPGEN --memory bytes 'Memory limit'
	COMPGEN --memory-swap bytes 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
	COMPGEN --network string 'Set the networking mode for the RUN instructions during build'
	COMPGEN --no-cache Switch 'Do not use cache when building the image'
	COMPGEN --platform string 'Set platform if server is multi-platform capable'
	COMPGEN --pull Switch 'Always attempt to pull a newer version of the image'
	COMPGEN '-q' Switch 'Suppress the build output and print image ID on success'
	COMPGEN --quiet Switch 'Suppress the build output and print image ID on success'
	COMPGEN --rm Switch 'Remove intermediate containers after a successful build'
	COMPGEN --security-opt strings 'Security options'
	COMPGEN --shm-size bytes 'Size of "/dev/shm"'
	COMPGEN --squash Switch 'Squash newly built layers into a single new layer'
	COMPGEN '-t' list 'Name and optionally a tag in the "name:tag" format'
	COMPGEN --tag list 'Name and optionally a tag in the "name:tag" format'
	COMPGEN --target string 'Set the target build stage to build.'
	COMPGEN --ulimit ulimit 'Ulimit options'
}

Register-Completer docker_image_history -Option {
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-H' Switch 'Print sizes and dates in human readable format'
	COMPGEN --human Switch 'Print sizes and dates in human readable format'
	COMPGEN --no-trunc Switch 'Don''t truncate output'
	COMPGEN '-q' Switch 'Only show image IDs'
	COMPGEN --quiet Switch 'Only show image IDs'
}

Register-Completer docker_image_import -Option {
	COMPGEN '-c' list 'Apply Dockerfile instruction to the created image'
	COMPGEN --change list 'Apply Dockerfile instruction to the created image'
	COMPGEN '-m' string 'Set commit message for imported image'
	COMPGEN --message string 'Set commit message for imported image'
	COMPGEN --platform string 'Set platform if server is multi-platform capable'
}

Register-Completer docker_image_inspect -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
}

Register-Completer docker_image_load -Option {
	COMPGEN '-i' string 'Read from tar archive file, instead of STDIN'
	COMPGEN --input string 'Read from tar archive file, instead of STDIN'
	COMPGEN '-q' Switch 'Suppress the load output'
	COMPGEN --quiet Switch 'Suppress the load output'
}

Register-Completer docker_image_ls -Option {
	COMPGEN '-a' Switch 'Show all images (default hides intermediate images)'
	COMPGEN --all Switch 'Show all images (default hides intermediate images)'
	COMPGEN --digests Switch 'Show digests'
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --no-trunc Switch 'Don''t truncate output'
	COMPGEN '-q' Switch 'Only show image IDs'
	COMPGEN --quiet Switch 'Only show image IDs'
}

Register-Completer docker_image_prune -Option {
	COMPGEN '-a' Switch 'Remove all unused images, not just dangling ones'
	COMPGEN --all Switch 'Remove all unused images, not just dangling ones'
	COMPGEN --filter filter 'Provide filter values (e.g. "until=<timestamp>")'
	COMPGEN '-f' Switch 'Do not prompt for confirmation'
	COMPGEN --force Switch 'Do not prompt for confirmation'
}

Register-Completer docker_image_pull -Option {
	COMPGEN '-a' Switch 'Download all tagged images in the repository'
	COMPGEN --all-tags Switch 'Download all tagged images in the repository'
	COMPGEN --disable-content-trust Switch 'Skip image verification'
	COMPGEN --platform string 'Set platform if server is multi-platform capable'
	COMPGEN '-q' Switch 'Suppress verbose output'
	COMPGEN --quiet Switch 'Suppress verbose output'
}

Register-Completer docker_image_push -Option {
	COMPGEN '-a' Switch 'Push all tags of an image to the repository'
	COMPGEN --all-tags Switch 'Push all tags of an image to the repository'
	COMPGEN --disable-content-trust Switch 'Skip image signing'
	COMPGEN '-q' Switch 'Suppress verbose output'
	COMPGEN --quiet Switch 'Suppress verbose output'
}

Register-Completer docker_image_rm -Option {
	COMPGEN '-f' Switch 'Force removal of the image'
	COMPGEN --force Switch 'Force removal of the image'
	COMPGEN --no-prune Switch 'Do not delete untagged parents'
}

Register-Completer docker_image_save -Option {
	COMPGEN '-o' string 'Write to a file, instead of STDOUT'
	COMPGEN --output string 'Write to a file, instead of STDOUT'
}

Register-Completer docker_manifest {
	COMPGEN annotate SubCommand 'Add additional information to a local image manifest'
	COMPGEN create SubCommand 'Create a local manifest list for annotating and pushing to a registry'
	COMPGEN inspect SubCommand 'Display an image manifest, or manifest list'
	COMPGEN push SubCommand 'Push a manifest list to a repository'
	COMPGEN rm SubCommand 'Delete one or more manifest lists from local storage'
}

Register-Completer docker_manifest_annotate -Option {
	COMPGEN --arch string 'Set architecture'
	COMPGEN --os string 'Set operating system'
	COMPGEN --os-features strings 'Set operating system feature'
	COMPGEN --os-version string 'Set operating system version'
	COMPGEN --variant string 'Set architecture variant'
}

Register-Completer docker_manifest_create -Option {
	COMPGEN '-a' Switch 'Amend an existing manifest list'
	COMPGEN --amend Switch 'Amend an existing manifest list'
	COMPGEN --insecure Switch 'Allow communication with an insecure registry'
}

Register-Completer docker_manifest_inspect -Option {
	COMPGEN --insecure Switch 'Allow communication with an insecure registry'
	COMPGEN '-v' Switch 'Output additional info including layers and platform'
	COMPGEN --verbose Switch 'Output additional info including layers and platform'
}

Register-Completer docker_manifest_push -Option {
	COMPGEN --insecure Switch 'Allow push to an insecure registry'
	COMPGEN '-p' Switch 'Remove the local manifest list after push'
	COMPGEN --purge Switch 'Remove the local manifest list after push'
}

Register-Completer docker_network {
	COMPGEN connect SubCommand 'Connect a container to a network'
	COMPGEN create SubCommand 'Create a network'
	COMPGEN disconnect SubCommand 'Disconnect a container from a network'
	COMPGEN inspect SubCommand 'Display detailed information on one or more networks'
	COMPGEN ls SubCommand 'List networks'
	COMPGEN prune SubCommand 'Remove all unused networks'
	COMPGEN rm SubCommand 'Remove one or more networks'
}

Register-Completer docker_network_connect -Option {
	COMPGEN --alias strings 'Add network-scoped alias for the container'
	COMPGEN --driver-opt strings 'driver options for the network'
	COMPGEN --ip string 'IPv4 address (e.g., "172.30.100.104")'
	COMPGEN --ip6 string 'IPv6 address (e.g., "2001:db8::33")'
	COMPGEN --link list 'Add link to another container'
	COMPGEN --link-local-ip strings 'Add a link-local address for the container'
}

Register-Completer docker_network_create -Option {
	COMPGEN --attachable Switch 'Enable manual container attachment'
	COMPGEN --aux-address map 'Auxiliary IPv4 or IPv6 addresses used by Network driver'
	COMPGEN --config-from string 'The network from which to copy the configuration'
	COMPGEN --config-only Switch 'Create a configuration only network'
	COMPGEN '-d' string 'Driver to manage the Network'
	COMPGEN --driver string 'Driver to manage the Network'
	COMPGEN --gateway strings 'IPv4 or IPv6 Gateway for the master subnet'
	COMPGEN --ingress Switch 'Create swarm routing-mesh network'
	COMPGEN --internal Switch 'Restrict external access to the network'
	COMPGEN --ip-range strings 'Allocate container ip from a sub-range'
	COMPGEN --ipam-driver string 'IP Address Management Driver'
	COMPGEN --ipam-opt map 'Set IPAM driver specific options'
	COMPGEN --ipv6 Switch 'Enable IPv6 networking'
	COMPGEN --label list 'Set metadata on a network'
	COMPGEN '-o' map 'Set driver specific options'
	COMPGEN --opt map 'Set driver specific options'
	COMPGEN --scope string 'Control the network''s scope'
	COMPGEN --subnet strings 'Subnet in CIDR format that represents a network segment'
}

Register-Completer docker_network_disconnect -Option {
	COMPGEN '-f' Switch 'Force the container to disconnect from a network'
	COMPGEN --force Switch 'Force the container to disconnect from a network'
}

Register-Completer docker_network_inspect -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-v' Switch 'Verbose output for diagnostics'
	COMPGEN --verbose Switch 'Verbose output for diagnostics'
}

Register-Completer docker_network_ls -Option {
	COMPGEN '-f' filter 'Provide filter values (e.g. "driver=bridge")'
	COMPGEN --filter filter 'Provide filter values (e.g. "driver=bridge")'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --no-trunc Switch 'Do not truncate the output'
	COMPGEN '-q' Switch 'Only display network IDs'
	COMPGEN --quiet Switch 'Only display network IDs'
}

Register-Completer docker_network_prune -Option {
	COMPGEN --filter filter 'Provide filter values (e.g. "until=<timestamp>")'
	COMPGEN '-f' Switch 'Do not prompt for confirmation'
	COMPGEN --force Switch 'Do not prompt for confirmation'
}

Register-Completer docker_network_rm -Option {
	COMPGEN '-f' Switch 'Do not error if the network does not exist'
	COMPGEN --force Switch 'Do not error if the network does not exist'
}

Register-Completer docker_node {
	COMPGEN demote SubCommand 'Demote one or more nodes from manager in the swarm'
	COMPGEN inspect SubCommand 'Display detailed information on one or more nodes'
	COMPGEN ls SubCommand 'List nodes in the swarm'
	COMPGEN promote SubCommand 'Promote one or more nodes to manager in the swarm'
	COMPGEN ps SubCommand 'List tasks running on one or more nodes, defaults to current node'
	COMPGEN rm SubCommand 'Remove one or more nodes from the swarm'
	COMPGEN update SubCommand 'Update a node'
}

Register-Completer docker_node_inspect -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --pretty Switch 'Print the information in a human friendly format'
}

Register-Completer docker_node_ls -Option {
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-q' Switch 'Only display IDs'
	COMPGEN --quiet Switch 'Only display IDs'
}

Register-Completer docker_node_ps -Option {
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Pretty-print tasks using a Go template'
	COMPGEN --no-resolve Switch 'Do not map IDs to Names'
	COMPGEN --no-trunc Switch 'Do not truncate output'
	COMPGEN '-q' Switch 'Only display task IDs'
	COMPGEN --quiet Switch 'Only display task IDs'
}

Register-Completer docker_node_rm -Option {
	COMPGEN '-f' Switch 'Force remove a node from the swarm'
	COMPGEN --force Switch 'Force remove a node from the swarm'
}

Register-Completer docker_node_update -Option {
	COMPGEN --availability string 'Availability of the node ("active", "pause", "drain")'
	COMPGEN --label-add list 'Add or update a node label ("key=value")'
	COMPGEN --label-rm list 'Remove a node label if exists'
	COMPGEN --role string 'Role of the node ("worker", "manager")'
}

Register-Completer docker_plugin {
	COMPGEN create SubCommand 'Create a plugin from a rootfs and configuration. Plugin data directory must contain config.json and rootfs directory.'
	COMPGEN disable SubCommand 'Disable a plugin'
	COMPGEN enable SubCommand 'Enable a plugin'
	COMPGEN inspect SubCommand 'Display detailed information on one or more plugins'
	COMPGEN install SubCommand 'Install a plugin'
	COMPGEN ls SubCommand 'List plugins'
	COMPGEN push SubCommand 'Push a plugin to a registry'
	COMPGEN rm SubCommand 'Remove one or more plugins'
	COMPGEN set SubCommand 'Change settings for a plugin'
	COMPGEN upgrade SubCommand 'Upgrade an existing plugin'
}

Register-Completer docker_plugin_create -Option {
	COMPGEN --compress Switch 'Compress the context using gzip'
}

Register-Completer docker_plugin_disable -Option {
	COMPGEN '-f' Switch 'Force the disable of an active plugin'
	COMPGEN --force Switch 'Force the disable of an active plugin'
}

Register-Completer docker_plugin_enable -Option {
	COMPGEN --timeout int 'HTTP client timeout (in seconds)'
}

Register-Completer docker_plugin_inspect -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
}

Register-Completer docker_plugin_install -Option {
	COMPGEN --alias string 'Local name for plugin'
	COMPGEN --disable Switch 'Do not enable the plugin on install'
	COMPGEN --disable-content-trust Switch 'Skip image verification'
	COMPGEN --grant-all-permissions Switch 'Grant all permissions necessary to run the plugin'
}

Register-Completer docker_plugin_ls -Option {
	COMPGEN '-f' filter 'Provide filter values (e.g. "enabled=true")'
	COMPGEN --filter filter 'Provide filter values (e.g. "enabled=true")'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --no-trunc Switch 'Don''t truncate output'
	COMPGEN '-q' Switch 'Only display plugin IDs'
	COMPGEN --quiet Switch 'Only display plugin IDs'
}

Register-Completer docker_plugin_push -Option {
	COMPGEN --disable-content-trust Switch 'Skip image signing'
}

Register-Completer docker_plugin_rm -Option {
	COMPGEN '-f' Switch 'Force the removal of an active plugin'
	COMPGEN --force Switch 'Force the removal of an active plugin'
}

Register-Completer docker_plugin_upgrade -Option {
	COMPGEN --disable-content-trust Switch 'Skip image verification'
	COMPGEN --grant-all-permissions Switch 'Grant all permissions necessary to run the plugin'
	COMPGEN --skip-remote-check Switch 'Do not check if specified remote plugin matches existing plugin image'
}

Register-Completer docker_secret {
	COMPGEN create SubCommand 'Create a secret from a file or STDIN as content'
	COMPGEN inspect SubCommand 'Display detailed information on one or more secrets'
	COMPGEN ls SubCommand 'List secrets'
	COMPGEN rm SubCommand 'Remove one or more secrets'
}

Register-Completer docker_secret_create -Option {
	COMPGEN '-d' string 'Secret driver'
	COMPGEN --driver string 'Secret driver'
	COMPGEN '-l' list 'Secret labels'
	COMPGEN --label list 'Secret labels'
	COMPGEN --template-driver string 'Template driver'
}

Register-Completer docker_secret_inspect -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --pretty Switch 'Print the information in a human friendly format'
}

Register-Completer docker_secret_ls -Option {
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-q' Switch 'Only display IDs'
	COMPGEN --quiet Switch 'Only display IDs'
}

Register-Completer docker_service {
	COMPGEN create SubCommand 'Create a new service'
	COMPGEN inspect SubCommand 'Display detailed information on one or more services'
	COMPGEN logs SubCommand 'Fetch the logs of a service or task'
	COMPGEN ls SubCommand 'List services'
	COMPGEN ps SubCommand 'List the tasks of one or more services'
	COMPGEN rm SubCommand 'Remove one or more services'
	COMPGEN rollback SubCommand 'Revert changes to a service''s configuration'
	COMPGEN scale SubCommand 'Scale one or multiple replicated services'
	COMPGEN update SubCommand 'Update a service'
}

Register-Completer docker_service_create -Option {
	COMPGEN --cap-add list 'Add Linux capabilities'
	COMPGEN --cap-drop list 'Drop Linux capabilities'
	COMPGEN --config config 'Specify configurations to expose to the service'
	COMPGEN --constraint list 'Placement constraints'
	COMPGEN --container-label list 'Container labels'
	COMPGEN --credential-spec credential-spec 'Credential spec for managed service account (Windows only)'
	COMPGEN '-d' Switch 'Exit immediately instead of waiting for the service to converge'
	COMPGEN --detach Switch 'Exit immediately instead of waiting for the service to converge'
	COMPGEN --dns list 'Set custom DNS servers'
	COMPGEN --dns-option list 'Set DNS options'
	COMPGEN --dns-search list 'Set custom DNS search domains'
	COMPGEN --endpoint-mode string 'Endpoint mode (vip or dnsrr)'
	COMPGEN --entrypoint command 'Overwrite the default ENTRYPOINT of the image'
	COMPGEN '-e' list 'Set environment variables'
	COMPGEN --env list 'Set environment variables'
	COMPGEN --env-file list 'Read in a file of environment variables'
	COMPGEN --generic-resource list 'User defined resources'
	COMPGEN --group list 'Set one or more supplementary user groups for the container'
	COMPGEN --health-cmd string 'Command to run to check health'
	COMPGEN --health-interval duration 'Time between running the check (ms|s|m|h)'
	COMPGEN --health-retries int 'Consecutive failures needed to report unhealthy'
	COMPGEN --health-start-interval duration 'Time between running the check during the start period (ms|s|m|h)'
	COMPGEN --health-start-period duration 'Start period for the container to initialize before counting retries towards unstable (ms|s|m|h)'
	COMPGEN --health-timeout duration 'Maximum time to allow one check to run (ms|s|m|h)'
	COMPGEN --host list 'Set one or more custom host-to-IP mappings (host:ip)'
	COMPGEN --hostname string 'Container hostname'
	COMPGEN --init Switch 'Use an init inside each service container to forward signals and reap processes'
	COMPGEN --isolation string 'Service container isolation mode'
	COMPGEN '-l' list 'Service labels'
	COMPGEN --label list 'Service labels'
	COMPGEN --limit-cpu decimal 'Limit CPUs'
	COMPGEN --limit-memory bytes 'Limit Memory'
	COMPGEN --limit-pids int 'Limit maximum number of processes (default 0 = unlimited)'
	COMPGEN --log-driver string 'Logging driver for service'
	COMPGEN --log-opt list 'Logging driver options'
	COMPGEN --max-concurrent uint 'Number of job tasks to run concurrently (default equal to --replicas)'
	COMPGEN --mode string 'Service mode ("replicated", "global", "replicated-job", "global-job")'
	COMPGEN --mount mount 'Attach a filesystem mount to the service'
	COMPGEN --name string 'Service name'
	COMPGEN --network network 'Network attachments'
	COMPGEN --no-healthcheck Switch 'Disable any container-specified HEALTHCHECK'
	COMPGEN --no-resolve-image Switch 'Do not query the registry to resolve image digest and supported platforms'
	COMPGEN --placement-pref pref 'Add a placement preference'
	COMPGEN '-p' port 'Publish a port as a node port'
	COMPGEN --publish port 'Publish a port as a node port'
	COMPGEN '-q' Switch 'Suppress progress output'
	COMPGEN --quiet Switch 'Suppress progress output'
	COMPGEN --read-only Switch 'Mount the container''s root filesystem as read only'
	COMPGEN --replicas uint 'Number of tasks'
	COMPGEN --replicas-max-per-node uint 'Maximum number of tasks per node (default 0 = unlimited)'
	COMPGEN --reserve-cpu decimal 'Reserve CPUs'
	COMPGEN --reserve-memory bytes 'Reserve Memory'
	COMPGEN --restart-condition string 'Restart when condition is met ("none", "on-failure", "any") (default "any")'
	COMPGEN --restart-delay duration 'Delay between restart attempts (ns|us|ms|s|m|h) (default 5s)'
	COMPGEN --restart-max-attempts uint 'Maximum number of restarts before giving up'
	COMPGEN --restart-window duration 'Window used to evaluate the restart policy (ns|us|ms|s|m|h)'
	COMPGEN --rollback-delay duration 'Delay between task rollbacks (ns|us|ms|s|m|h) (default 0s)'
	COMPGEN --rollback-failure-action string 'Action on rollback failure ("pause", "continue") (default "pause")'
	COMPGEN --rollback-max-failure-ratio float 'Failure rate to tolerate during a rollback (default 0)'
	COMPGEN --rollback-monitor duration 'Duration after each task rollback to monitor for failure (ns|us|ms|s|m|h) (default 5s)'
	COMPGEN --rollback-order string 'Rollback order ("start-first", "stop-first") (default "stop-first")'
	COMPGEN --rollback-parallelism uint 'Maximum number of tasks rolled back simultaneously (0 to roll back all at once)'
	COMPGEN --secret secret 'Specify secrets to expose to the service'
	COMPGEN --stop-grace-period duration 'Time to wait before force killing a container (ns|us|ms|s|m|h) (default 10s)'
	COMPGEN --stop-signal string 'Signal to stop the container'
	COMPGEN --sysctl list 'Sysctl options'
	COMPGEN '-t' Switch 'Allocate a pseudo-TTY'
	COMPGEN --tty Switch 'Allocate a pseudo-TTY'
	COMPGEN --ulimit ulimit 'Ulimit options'
	COMPGEN --update-delay duration 'Delay between updates (ns|us|ms|s|m|h) (default 0s)'
	COMPGEN --update-failure-action string 'Action on update failure ("pause", "continue", "rollback") (default "pause")'
	COMPGEN --update-max-failure-ratio float 'Failure rate to tolerate during an update (default 0)'
	COMPGEN --update-monitor duration 'Duration after each task update to monitor for failure (ns|us|ms|s|m|h) (default 5s)'
	COMPGEN --update-order string 'Update order ("start-first", "stop-first") (default "stop-first")'
	COMPGEN --update-parallelism uint 'Maximum number of tasks updated simultaneously (0 to update all at once)'
	COMPGEN '-u' string 'Username or UID (format: <name|uid>[:<group|gid>])'
	COMPGEN --user string 'Username or UID (format: <name|uid>[:<group|gid>])'
	COMPGEN --with-registry-auth Switch 'Send registry authentication details to swarm agents'
	COMPGEN '-w' string 'Working directory inside the container'
	COMPGEN --workdir string 'Working directory inside the container'
}

Register-Completer docker_service_inspect -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --pretty Switch 'Print the information in a human friendly format'
}

Register-Completer docker_service_logs -Option {
	COMPGEN --details Switch 'Show extra details provided to logs'
	COMPGEN '-f' Switch 'Follow log output'
	COMPGEN --follow Switch 'Follow log output'
	COMPGEN --no-resolve Switch 'Do not map IDs to Names in output'
	COMPGEN --no-task-ids Switch 'Do not include task IDs in output'
	COMPGEN --no-trunc Switch 'Do not truncate output'
	COMPGEN --raw Switch 'Do not neatly format logs'
	COMPGEN --since string 'Show logs since timestamp (e.g. "2013-01-02T13:23:37Z") or relative (e.g. "42m" for 42 minutes)'
	COMPGEN '-n' string 'Number of lines to show from the end of the logs'
	COMPGEN --tail string 'Number of lines to show from the end of the logs'
	COMPGEN '-t' Switch 'Show timestamps'
	COMPGEN --timestamps Switch 'Show timestamps'
}

Register-Completer docker_service_ls -Option {
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-q' Switch 'Only display IDs'
	COMPGEN --quiet Switch 'Only display IDs'
}

Register-Completer docker_service_ps -Option {
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Pretty-print tasks using a Go template'
	COMPGEN --no-resolve Switch 'Do not map IDs to Names'
	COMPGEN --no-trunc Switch 'Do not truncate output'
	COMPGEN '-q' Switch 'Only display task IDs'
	COMPGEN --quiet Switch 'Only display task IDs'
}

Register-Completer docker_service_rollback -Option {
	COMPGEN '-d' Switch 'Exit immediately instead of waiting for the service to converge'
	COMPGEN --detach Switch 'Exit immediately instead of waiting for the service to converge'
	COMPGEN '-q' Switch 'Suppress progress output'
	COMPGEN --quiet Switch 'Suppress progress output'
}

Register-Completer docker_service_scale -Option {
	COMPGEN '-d' Switch 'Exit immediately instead of waiting for the service to converge'
	COMPGEN --detach Switch 'Exit immediately instead of waiting for the service to converge'
}

Register-Completer docker_service_update -Option {
	COMPGEN --args command 'Service command args'
	COMPGEN --cap-add list 'Add Linux capabilities'
	COMPGEN --cap-drop list 'Drop Linux capabilities'
	COMPGEN --config-add config 'Add or update a config file on a service'
	COMPGEN --config-rm list 'Remove a configuration file'
	COMPGEN --constraint-add list 'Add or update a placement constraint'
	COMPGEN --constraint-rm list 'Remove a constraint'
	COMPGEN --container-label-add list 'Add or update a container label'
	COMPGEN --container-label-rm list 'Remove a container label by its key'
	COMPGEN --credential-spec credential-spec 'Credential spec for managed service account (Windows only)'
	COMPGEN '-d' Switch 'Exit immediately instead of waiting for the service to converge'
	COMPGEN --detach Switch 'Exit immediately instead of waiting for the service to converge'
	COMPGEN --dns-add list 'Add or update a custom DNS server'
	COMPGEN --dns-option-add list 'Add or update a DNS option'
	COMPGEN --dns-option-rm list 'Remove a DNS option'
	COMPGEN --dns-rm list 'Remove a custom DNS server'
	COMPGEN --dns-search-add list 'Add or update a custom DNS search domain'
	COMPGEN --dns-search-rm list 'Remove a DNS search domain'
	COMPGEN --endpoint-mode string 'Endpoint mode (vip or dnsrr)'
	COMPGEN --entrypoint command 'Overwrite the default ENTRYPOINT of the image'
	COMPGEN --env-add list 'Add or update an environment variable'
	COMPGEN --env-rm list 'Remove an environment variable'
	COMPGEN --force Switch 'Force update even if no changes require it'
	COMPGEN --generic-resource-add list 'Add a Generic resource'
	COMPGEN --generic-resource-rm list 'Remove a Generic resource'
	COMPGEN --group-add list 'Add an additional supplementary user group to the container'
	COMPGEN --group-rm list 'Remove a previously added supplementary user group from the container'
	COMPGEN --health-cmd string 'Command to run to check health'
	COMPGEN --health-interval duration 'Time between running the check (ms|s|m|h)'
	COMPGEN --health-retries int 'Consecutive failures needed to report unhealthy'
	COMPGEN --health-start-interval duration 'Time between running the check during the start period (ms|s|m|h)'
	COMPGEN --health-start-period duration 'Start period for the container to initialize before counting retries towards unstable (ms|s|m|h)'
	COMPGEN --health-timeout duration 'Maximum time to allow one check to run (ms|s|m|h)'
	COMPGEN --host-add list 'Add a custom host-to-IP mapping ("host:ip")'
	COMPGEN --host-rm list 'Remove a custom host-to-IP mapping ("host:ip")'
	COMPGEN --hostname string 'Container hostname'
	COMPGEN --image string 'Service image tag'
	COMPGEN --init Switch 'Use an init inside each service container to forward signals and reap processes'
	COMPGEN --isolation string 'Service container isolation mode'
	COMPGEN --label-add list 'Add or update a service label'
	COMPGEN --label-rm list 'Remove a label by its key'
	COMPGEN --limit-cpu decimal 'Limit CPUs'
	COMPGEN --limit-memory bytes 'Limit Memory'
	COMPGEN --limit-pids int 'Limit maximum number of processes (default 0 = unlimited)'
	COMPGEN --log-driver string 'Logging driver for service'
	COMPGEN --log-opt list 'Logging driver options'
	COMPGEN --max-concurrent uint 'Number of job tasks to run concurrently (default equal to --replicas)'
	COMPGEN --mount-add mount 'Add or update a mount on a service'
	COMPGEN --mount-rm list 'Remove a mount by its target path'
	COMPGEN --network-add network 'Add a network'
	COMPGEN --network-rm list 'Remove a network'
	COMPGEN --no-healthcheck Switch 'Disable any container-specified HEALTHCHECK'
	COMPGEN --no-resolve-image Switch 'Do not query the registry to resolve image digest and supported platforms'
	COMPGEN --placement-pref-add pref 'Add a placement preference'
	COMPGEN --placement-pref-rm pref 'Remove a placement preference'
	COMPGEN --publish-add port 'Add or update a published port'
	COMPGEN --publish-rm port 'Remove a published port by its target port'
	COMPGEN '-q' Switch 'Suppress progress output'
	COMPGEN --quiet Switch 'Suppress progress output'
	COMPGEN --read-only Switch 'Mount the container''s root filesystem as read only'
	COMPGEN --replicas uint 'Number of tasks'
	COMPGEN --replicas-max-per-node uint 'Maximum number of tasks per node (default 0 = unlimited)'
	COMPGEN --reserve-cpu decimal 'Reserve CPUs'
	COMPGEN --reserve-memory bytes 'Reserve Memory'
	COMPGEN --restart-condition string 'Restart when condition is met ("none", "on-failure", "any")'
	COMPGEN --restart-delay duration 'Delay between restart attempts (ns|us|ms|s|m|h)'
	COMPGEN --restart-max-attempts uint 'Maximum number of restarts before giving up'
	COMPGEN --restart-window duration 'Window used to evaluate the restart policy (ns|us|ms|s|m|h)'
	COMPGEN --rollback Switch 'Rollback to previous specification'
	COMPGEN --rollback-delay duration 'Delay between task rollbacks (ns|us|ms|s|m|h)'
	COMPGEN --rollback-failure-action string 'Action on rollback failure ("pause", "continue")'
	COMPGEN --rollback-max-failure-ratio float 'Failure rate to tolerate during a rollback'
	COMPGEN --rollback-monitor duration 'Duration after each task rollback to monitor for failure (ns|us|ms|s|m|h)'
	COMPGEN --rollback-order string 'Rollback order ("start-first", "stop-first")'
	COMPGEN --rollback-parallelism uint 'Maximum number of tasks rolled back simultaneously (0 to roll back all at once)'
	COMPGEN --secret-add secret 'Add or update a secret on a service'
	COMPGEN --secret-rm list 'Remove a secret'
	COMPGEN --stop-grace-period duration 'Time to wait before force killing a container (ns|us|ms|s|m|h)'
	COMPGEN --stop-signal string 'Signal to stop the container'
	COMPGEN --sysctl-add list 'Add or update a Sysctl option'
	COMPGEN --sysctl-rm list 'Remove a Sysctl option'
	COMPGEN '-t' Switch 'Allocate a pseudo-TTY'
	COMPGEN --tty Switch 'Allocate a pseudo-TTY'
	COMPGEN --ulimit-add ulimit 'Add or update a ulimit option'
	COMPGEN --ulimit-rm list 'Remove a ulimit option'
	COMPGEN --update-delay duration 'Delay between updates (ns|us|ms|s|m|h)'
	COMPGEN --update-failure-action string 'Action on update failure ("pause", "continue", "rollback")'
	COMPGEN --update-max-failure-ratio float 'Failure rate to tolerate during an update'
	COMPGEN --update-monitor duration 'Duration after each task update to monitor for failure (ns|us|ms|s|m|h)'
	COMPGEN --update-order string 'Update order ("start-first", "stop-first")'
	COMPGEN --update-parallelism uint 'Maximum number of tasks updated simultaneously (0 to update all at once)'
	COMPGEN '-u' string 'Username or UID (format: <name|uid>[:<group|gid>])'
	COMPGEN --user string 'Username or UID (format: <name|uid>[:<group|gid>])'
	COMPGEN --with-registry-auth Switch 'Send registry authentication details to swarm agents'
	COMPGEN '-w' string 'Working directory inside the container'
	COMPGEN --workdir string 'Working directory inside the container'
}

Register-Completer docker_stack {
	COMPGEN config SubCommand 'Outputs the final config file, after doing merges and interpolations'
	COMPGEN deploy SubCommand 'Deploy a new stack or update an existing stack'
	COMPGEN ls SubCommand 'List stacks'
	COMPGEN ps SubCommand 'List the tasks in the stack'
	COMPGEN rm SubCommand 'Remove one or more stacks'
	COMPGEN services SubCommand 'List the services in the stack'
}

Register-Completer docker_stack_config -Option {
	COMPGEN '-c' strings 'Path to a Compose file, or "-" to read from stdin'
	COMPGEN --compose-file strings 'Path to a Compose file, or "-" to read from stdin'
	COMPGEN --skip-interpolation Switch 'Skip interpolation and output only merged config'
}

Register-Completer docker_stack_deploy -Option {
	COMPGEN '-c' strings 'Path to a Compose file, or "-" to read from stdin'
	COMPGEN --compose-file strings 'Path to a Compose file, or "-" to read from stdin'
	COMPGEN '-d' Switch 'Exit immediately instead of waiting for the stack services to converge'
	COMPGEN --detach Switch 'Exit immediately instead of waiting for the stack services to converge'
	COMPGEN --prune Switch 'Prune services that are no longer referenced'
	COMPGEN '-q' Switch 'Suppress progress output'
	COMPGEN --quiet Switch 'Suppress progress output'
	COMPGEN --resolve-image string 'Query the registry to resolve image digest and supported platforms ("always", "changed", "never")'
	COMPGEN --with-registry-auth Switch 'Send registry authentication details to Swarm agents'
}

Register-Completer docker_stack_ls -Option {
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
}

Register-Completer docker_stack_ps -Option {
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --no-resolve Switch 'Do not map IDs to Names'
	COMPGEN --no-trunc Switch 'Do not truncate output'
	COMPGEN '-q' Switch 'Only display task IDs'
	COMPGEN --quiet Switch 'Only display task IDs'
}

Register-Completer docker_stack_rm -Option {
	COMPGEN '-d' Switch 'Do not wait for stack removal'
	COMPGEN --detach Switch 'Do not wait for stack removal'
}

Register-Completer docker_stack_services -Option {
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-q' Switch 'Only display IDs'
	COMPGEN --quiet Switch 'Only display IDs'
}

Register-Completer docker_swarm {
	COMPGEN ca SubCommand 'Display and rotate the root CA'
	COMPGEN init SubCommand 'Initialize a swarm'
	COMPGEN join SubCommand 'Join a swarm as a node and/or manager'
	COMPGEN join-token SubCommand 'Manage join tokens'
	COMPGEN leave SubCommand 'Leave the swarm'
	COMPGEN unlock SubCommand 'Unlock swarm'
	COMPGEN unlock-key SubCommand 'Manage the unlock key'
	COMPGEN update SubCommand 'Update the swarm'
}

Register-Completer docker_swarm_ca -Option {
	COMPGEN --ca-cert pem-file 'Path to the PEM-formatted root CA certificate to use for the new cluster'
	COMPGEN --ca-key pem-file 'Path to the PEM-formatted root CA key to use for the new cluster'
	COMPGEN --cert-expiry duration 'Validity period for node certificates (ns|us|ms|s|m|h)'
	COMPGEN '-d' Switch 'Exit immediately instead of waiting for the root rotation to converge'
	COMPGEN --detach Switch 'Exit immediately instead of waiting for the root rotation to converge'
	COMPGEN --external-ca external-ca 'Specifications of one or more certificate signing endpoints'
	COMPGEN '-q' Switch 'Suppress progress output'
	COMPGEN --quiet Switch 'Suppress progress output'
	COMPGEN --rotate Switch 'Rotate the swarm CA - if no certificate or key are provided, new ones will be generated'
}

Register-Completer docker_swarm_init -Option {
	COMPGEN --advertise-addr string 'Advertised address (format: "<ip|interface>[:port]")'
	COMPGEN --autolock Switch 'Enable manager autolocking (requiring an unlock key to start a stopped manager)'
	COMPGEN --availability string 'Availability of the node ("active", "pause", "drain")'
	COMPGEN --cert-expiry duration 'Validity period for node certificates (ns|us|ms|s|m|h)'
	COMPGEN --data-path-addr string 'Address or interface to use for data path traffic (format: "<ip|interface>")'
	COMPGEN --data-path-port uint32 'Port number to use for data path traffic (1024 - 49151). If no value is set or is set to 0, the default port (4789) is used.'
	COMPGEN --default-addr-pool ipNetSlice 'default address pool in CIDR format'
	COMPGEN --default-addr-pool-mask-length uint32 'default address pool subnet mask length'
	COMPGEN --dispatcher-heartbeat duration 'Dispatcher heartbeat period (ns|us|ms|s|m|h)'
	COMPGEN --external-ca external-ca 'Specifications of one or more certificate signing endpoints'
	COMPGEN --force-new-cluster Switch 'Force create a new cluster from current state'
	COMPGEN --listen-addr node-addr 'Listen address (format: "<ip|interface>[:port]")'
	COMPGEN --max-snapshots uint 'Number of additional Raft snapshots to retain'
	COMPGEN --snapshot-interval uint 'Number of log entries between Raft snapshots'
	COMPGEN --task-history-limit int 'Task history retention limit'
}

Register-Completer docker_swarm_join -Option {
	COMPGEN --advertise-addr string 'Advertised address (format: "<ip|interface>[:port]")'
	COMPGEN --availability string 'Availability of the node ("active", "pause", "drain")'
	COMPGEN --data-path-addr string 'Address or interface to use for data path traffic (format: "<ip|interface>")'
	COMPGEN --listen-addr node-addr 'Listen address (format: "<ip|interface>[:port]")'
	COMPGEN --token string 'Token for entry into the swarm'
}

Register-Completer docker_swarm_join-token -Option {
	COMPGEN '-q' Switch 'Only display token'
	COMPGEN --quiet Switch 'Only display token'
	COMPGEN --rotate Switch 'Rotate join token'
}

Register-Completer docker_swarm_leave -Option {
	COMPGEN '-f' Switch 'Force this node to leave the swarm, ignoring warnings'
	COMPGEN --force Switch 'Force this node to leave the swarm, ignoring warnings'
}

Register-Completer docker_swarm_unlock-key -Option {
	COMPGEN '-q' Switch 'Only display token'
	COMPGEN --quiet Switch 'Only display token'
	COMPGEN --rotate Switch 'Rotate unlock key'
}

Register-Completer docker_swarm_update -Option {
	COMPGEN --autolock Switch 'Change manager autolocking setting (true|false)'
	COMPGEN --cert-expiry duration 'Validity period for node certificates (ns|us|ms|s|m|h)'
	COMPGEN --dispatcher-heartbeat duration 'Dispatcher heartbeat period (ns|us|ms|s|m|h)'
	COMPGEN --external-ca external-ca 'Specifications of one or more certificate signing endpoints'
	COMPGEN --max-snapshots uint 'Number of additional Raft snapshots to retain'
	COMPGEN --snapshot-interval uint 'Number of log entries between Raft snapshots'
	COMPGEN --task-history-limit int 'Task history retention limit'
}

Register-Completer docker_system {
	COMPGEN df SubCommand 'Show docker disk usage'
	COMPGEN events SubCommand 'Get real time events from the server'
	COMPGEN info SubCommand 'Display system-wide information'
	COMPGEN prune SubCommand 'Remove unused data'
}

Register-Completer docker_system_df -Option {
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-v' Switch 'Show detailed information on space usage'
	COMPGEN --verbose Switch 'Show detailed information on space usage'
}

Register-Completer docker_system_events -Option {
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --since string 'Show all events created since timestamp'
	COMPGEN --until string 'Stream events until this timestamp'
}

Register-Completer docker_system_info -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
}

Register-Completer docker_system_prune -Option {
	COMPGEN '-a' Switch 'Remove all unused images not just dangling ones'
	COMPGEN --all Switch 'Remove all unused images not just dangling ones'
	COMPGEN --filter filter 'Provide filter values (e.g. "label=<key>=<value>")'
	COMPGEN '-f' Switch 'Do not prompt for confirmation'
	COMPGEN --force Switch 'Do not prompt for confirmation'
	COMPGEN --volumes Switch 'Prune anonymous volumes'
}

Register-Completer docker_trust {
	COMPGEN key ManagementCommand 'Manage keys for signing Docker images'
	COMPGEN signer ManagementCommand 'Manage entities who can sign Docker images'
	COMPGEN inspect SubCommand 'Return low-level information about keys and signatures'
	COMPGEN revoke SubCommand 'Remove trust for an image'
	COMPGEN sign SubCommand 'Sign an image'
}

Register-Completer docker_trust_inspect -Option {
	COMPGEN --pretty Switch 'Print the information in a human friendly format'
}

Register-Completer docker_trust_key {
	COMPGEN generate SubCommand 'Generate and load a signing key-pair'
	COMPGEN load SubCommand 'Load a private key file for signing'
}

Register-Completer docker_trust_key_generate -Option {
	COMPGEN --dir string 'Directory to generate key in, defaults to current directory'
}

Register-Completer docker_trust_key_load -Option {
	COMPGEN --name string 'Name for the loaded key'
}

Register-Completer docker_trust_revoke -Option {
	COMPGEN '-y' Switch 'Do not prompt for confirmation'
	COMPGEN --yes Switch 'Do not prompt for confirmation'
}

Register-Completer docker_trust_sign -Option {
	COMPGEN --local Switch 'Sign a locally tagged image'
}

Register-Completer docker_trust_signer {
	COMPGEN add SubCommand 'Add a signer'
	COMPGEN remove SubCommand 'Remove a signer'
}

Register-Completer docker_trust_signer_add -Option {
	COMPGEN --key list 'Path to the signer''s public key file'
}

Register-Completer docker_trust_signer_remove -Option {
	COMPGEN '-f' Switch 'Do not prompt for confirmation before removing the most recent signer'
	COMPGEN --force Switch 'Do not prompt for confirmation before removing the most recent signer'
}

Register-Completer docker_volume {
	COMPGEN create SubCommand 'Create a volume'
	COMPGEN inspect SubCommand 'Display detailed information on one or more volumes'
	COMPGEN ls SubCommand 'List volumes'
	COMPGEN prune SubCommand 'Remove unused local volumes'
	COMPGEN rm SubCommand 'Remove one or more volumes'
	COMPGEN update SubCommand 'Update a volume (cluster volumes only)'
}

Register-Completer docker_volume_create -Option {
	COMPGEN --availability string 'Cluster Volume availability ("active", "pause", "drain")'
	COMPGEN '-d' string 'Specify volume driver name'
	COMPGEN --driver string 'Specify volume driver name'
	COMPGEN --group string 'Cluster Volume group (cluster volumes)'
	COMPGEN --label list 'Set metadata for a volume'
	COMPGEN --limit-bytes bytes 'Minimum size of the Cluster Volume in bytes'
	COMPGEN '-o' map 'Set driver specific options'
	COMPGEN --opt map 'Set driver specific options'
	COMPGEN --required-bytes bytes 'Maximum size of the Cluster Volume in bytes'
	COMPGEN --scope string 'Cluster Volume access scope ("single", "multi")'
	COMPGEN --secret map 'Cluster Volume secrets'
	COMPGEN --sharing string 'Cluster Volume access sharing ("none", "readonly", "onewriter", "all")'
	COMPGEN --topology-preferred list 'A topology that the Cluster Volume would be preferred in'
	COMPGEN --topology-required list 'A topology that the Cluster Volume must be accessible from'
	COMPGEN --type string 'Cluster Volume access type ("mount", "block")'
}

Register-Completer docker_volume_inspect -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
}

Register-Completer docker_volume_ls -Option {
	COMPGEN --cluster Switch 'Display only cluster volumes, and use cluster volume list formatting'
	COMPGEN '-f' filter 'Provide filter values (e.g. "dangling=true")'
	COMPGEN --filter filter 'Provide filter values (e.g. "dangling=true")'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-q' Switch 'Only display volume names'
	COMPGEN --quiet Switch 'Only display volume names'
}

Register-Completer docker_volume_prune -Option {
	COMPGEN '-a' Switch 'Remove all unused volumes, not just anonymous ones'
	COMPGEN --all Switch 'Remove all unused volumes, not just anonymous ones'
	COMPGEN --filter filter 'Provide filter values (e.g. "label=<label>")'
	COMPGEN '-f' Switch 'Do not prompt for confirmation'
	COMPGEN --force Switch 'Do not prompt for confirmation'
}

Register-Completer docker_volume_rm -Option {
	COMPGEN '-f' Switch 'Force the removal of one or more volumes'
	COMPGEN --force Switch 'Force the removal of one or more volumes'
}

Register-Completer docker_volume_update -Option {
	COMPGEN --availability string 'Cluster Volume availability ("active", "pause", "drain")'
}

Register-Completer docker_build -Option {
	COMPGEN --add-host list 'Add a custom host-to-IP mapping ("host:ip")'
	COMPGEN --build-arg list 'Set build-time variables'
	COMPGEN --cache-from strings 'Images to consider as cache sources'
	COMPGEN --cgroup-parent string 'Set the parent cgroup for the "RUN" instructions during build'
	COMPGEN --compress Switch 'Compress the build context using gzip'
	COMPGEN --cpu-period int 'Limit the CPU CFS (Completely Fair Scheduler) period'
	COMPGEN --cpu-quota int 'Limit the CPU CFS (Completely Fair Scheduler) quota'
	COMPGEN '-c' int 'CPU shares (relative weight)'
	COMPGEN --cpu-shares int 'CPU shares (relative weight)'
	COMPGEN --cpuset-cpus string 'CPUs in which to allow execution (0-3, 0,1)'
	COMPGEN --cpuset-mems string 'MEMs in which to allow execution (0-3, 0,1)'
	COMPGEN --disable-content-trust Switch 'Skip image verification'
	COMPGEN '-f' string 'Name of the Dockerfile (Default is "PATH/Dockerfile")'
	COMPGEN --file string 'Name of the Dockerfile (Default is "PATH/Dockerfile")'
	COMPGEN --force-rm Switch 'Always remove intermediate containers'
	COMPGEN --iidfile string 'Write the image ID to the file'
	COMPGEN --isolation string 'Container isolation technology'
	COMPGEN --label list 'Set metadata for an image'
	COMPGEN '-m' bytes 'Memory limit'
	COMPGEN --memory bytes 'Memory limit'
	COMPGEN --memory-swap bytes 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
	COMPGEN --network string 'Set the networking mode for the RUN instructions during build'
	COMPGEN --no-cache Switch 'Do not use cache when building the image'
	COMPGEN --platform string 'Set platform if server is multi-platform capable'
	COMPGEN --pull Switch 'Always attempt to pull a newer version of the image'
	COMPGEN '-q' Switch 'Suppress the build output and print image ID on success'
	COMPGEN --quiet Switch 'Suppress the build output and print image ID on success'
	COMPGEN --rm Switch 'Remove intermediate containers after a successful build'
	COMPGEN --security-opt strings 'Security options'
	COMPGEN --shm-size bytes 'Size of "/dev/shm"'
	COMPGEN --squash Switch 'Squash newly built layers into a single new layer'
	COMPGEN '-t' list 'Name and optionally a tag in the "name:tag" format'
	COMPGEN --tag list 'Name and optionally a tag in the "name:tag" format'
	COMPGEN --target string 'Set the target build stage to build.'
	COMPGEN --ulimit ulimit 'Ulimit options'
}

Register-Completer docker_exec -Option {
	COMPGEN '-d' Switch 'Detached mode: run command in the background'
	COMPGEN --detach Switch 'Detached mode: run command in the background'
	COMPGEN --detach-keys string 'Override the key sequence for detaching a container'
	COMPGEN '-e' list 'Set environment variables'
	COMPGEN --env list 'Set environment variables'
	COMPGEN --env-file list 'Read in a file of environment variables'
	COMPGEN '-i' Switch 'Keep STDIN open even if not attached'
	COMPGEN --interactive Switch 'Keep STDIN open even if not attached'
	COMPGEN --privileged Switch 'Give extended privileges to the command'
	COMPGEN '-t' Switch 'Allocate a pseudo-TTY'
	COMPGEN --tty Switch 'Allocate a pseudo-TTY'
	COMPGEN '-u' string 'Username or UID (format: "<name|uid>[:<group|gid>]")'
	COMPGEN --user string 'Username or UID (format: "<name|uid>[:<group|gid>]")'
	COMPGEN '-w' string 'Working directory inside the container'
	COMPGEN --workdir string 'Working directory inside the container'
}

Register-Completer docker_images -Option {
	COMPGEN '-a' Switch 'Show all images (default hides intermediate images)'
	COMPGEN --all Switch 'Show all images (default hides intermediate images)'
	COMPGEN --digests Switch 'Show digests'
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --no-trunc Switch 'Don''t truncate output'
	COMPGEN '-q' Switch 'Only show image IDs'
	COMPGEN --quiet Switch 'Only show image IDs'
}

Register-Completer docker_info -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
}

Register-Completer docker_login -Option {
	COMPGEN '-p' string 'Password'
	COMPGEN --password string 'Password'
	COMPGEN --password-stdin Switch 'Take the password from stdin'
	COMPGEN '-u' string 'Username'
	COMPGEN --username string 'Username'
}

Register-Completer docker_ps -Option {
	COMPGEN '-a' Switch 'Show all containers (default shows just running)'
	COMPGEN --all Switch 'Show all containers (default shows just running)'
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-n' int 'Show n last created containers (includes all states)'
	COMPGEN --last int 'Show n last created containers (includes all states)'
	COMPGEN '-l' Switch 'Show the latest created container (includes all states)'
	COMPGEN --latest Switch 'Show the latest created container (includes all states)'
	COMPGEN --no-trunc Switch 'Don''t truncate output'
	COMPGEN '-q' Switch 'Only display container IDs'
	COMPGEN --quiet Switch 'Only display container IDs'
	COMPGEN '-s' Switch 'Display total file sizes'
	COMPGEN --size Switch 'Display total file sizes'
}

Register-Completer docker_pull -Option {
	COMPGEN '-a' Switch 'Download all tagged images in the repository'
	COMPGEN --all-tags Switch 'Download all tagged images in the repository'
	COMPGEN --disable-content-trust Switch 'Skip image verification'
	COMPGEN --platform string 'Set platform if server is multi-platform capable'
	COMPGEN '-q' Switch 'Suppress verbose output'
	COMPGEN --quiet Switch 'Suppress verbose output'
}

Register-Completer docker_push -Option {
	COMPGEN '-a' Switch 'Push all tags of an image to the repository'
	COMPGEN --all-tags Switch 'Push all tags of an image to the repository'
	COMPGEN --disable-content-trust Switch 'Skip image signing'
	COMPGEN '-q' Switch 'Suppress verbose output'
	COMPGEN --quiet Switch 'Suppress verbose output'
}

Register-Completer docker_run -Option {
	COMPGEN --add-host list 'Add a custom host-to-IP mapping (host:ip)'
	COMPGEN --annotation map 'Add an annotation to the container (passed through to the OCI runtime)'
	COMPGEN '-a' list 'Attach to STDIN, STDOUT or STDERR'
	COMPGEN --attach list 'Attach to STDIN, STDOUT or STDERR'
	COMPGEN --blkio-weight uint16 'Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)'
	COMPGEN --blkio-weight-device list 'Block IO weight (relative device weight)'
	COMPGEN --cap-add list 'Add Linux capabilities'
	COMPGEN --cap-drop list 'Drop Linux capabilities'
	COMPGEN --cgroup-parent string 'Optional parent cgroup for the container'
	COMPGEN --cgroupns string 'Cgroup namespace to use (host|private)
''host'':    Run the container in the Docker host''s cgroup namespace
''private'': Run the container in its own private cgroup namespace
'''':        Use the cgroup namespace as configured by the
           default-cgroupns-mode option on the daemon (default)'
	COMPGEN --cidfile string 'Write the container ID to the file'
	COMPGEN --cpu-count int 'CPU count (Windows only)'
	COMPGEN --cpu-percent int 'CPU percent (Windows only)'
	COMPGEN --cpu-period int 'Limit CPU CFS (Completely Fair Scheduler) period'
	COMPGEN --cpu-quota int 'Limit CPU CFS (Completely Fair Scheduler) quota'
	COMPGEN --cpu-rt-period int 'Limit CPU real-time period in microseconds'
	COMPGEN --cpu-rt-runtime int 'Limit CPU real-time runtime in microseconds'
	COMPGEN '-c' int 'CPU shares (relative weight)'
	COMPGEN --cpu-shares int 'CPU shares (relative weight)'
	COMPGEN --cpus decimal 'Number of CPUs'
	COMPGEN --cpuset-cpus string 'CPUs in which to allow execution (0-3, 0,1)'
	COMPGEN --cpuset-mems string 'MEMs in which to allow execution (0-3, 0,1)'
	COMPGEN '-d' Switch 'Run container in background and print container ID'
	COMPGEN --detach Switch 'Run container in background and print container ID'
	COMPGEN --detach-keys string 'Override the key sequence for detaching a container'
	COMPGEN --device list 'Add a host device to the container'
	COMPGEN --device-cgroup-rule list 'Add a rule to the cgroup allowed devices list'
	COMPGEN --device-read-bps list 'Limit read rate (bytes per second) from a device'
	COMPGEN --device-read-iops list 'Limit read rate (IO per second) from a device'
	COMPGEN --device-write-bps list 'Limit write rate (bytes per second) to a device'
	COMPGEN --device-write-iops list 'Limit write rate (IO per second) to a device'
	COMPGEN --disable-content-trust Switch 'Skip image verification'
	COMPGEN --dns list 'Set custom DNS servers'
	COMPGEN --dns-option list 'Set DNS options'
	COMPGEN --dns-search list 'Set custom DNS search domains'
	COMPGEN --domainname string 'Container NIS domain name'
	COMPGEN --entrypoint string 'Overwrite the default ENTRYPOINT of the image'
	COMPGEN '-e' list 'Set environment variables'
	COMPGEN --env list 'Set environment variables'
	COMPGEN --env-file list 'Read in a file of environment variables'
	COMPGEN --expose list 'Expose a port or a range of ports'
	COMPGEN --gpus gpu-request 'GPU devices to add to the container (''all'' to pass all GPUs)'
	COMPGEN --group-add list 'Add additional groups to join'
	COMPGEN --health-cmd string 'Command to run to check health'
	COMPGEN --health-interval duration 'Time between running the check (ms|s|m|h) (default 0s)'
	COMPGEN --health-retries int 'Consecutive failures needed to report unhealthy'
	COMPGEN --health-start-interval duration 'Time between running the check during the start period (ms|s|m|h) (default 0s)'
	COMPGEN --health-start-period duration 'Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)'
	COMPGEN --health-timeout duration 'Maximum time to allow one check to run (ms|s|m|h) (default 0s)'
	COMPGEN --help Switch 'Print usage'
	COMPGEN '-h' string 'Container host name'
	COMPGEN --hostname string 'Container host name'
	COMPGEN --init Switch 'Run an init inside the container that forwards signals and reaps processes'
	COMPGEN '-i' Switch 'Keep STDIN open even if not attached'
	COMPGEN --interactive Switch 'Keep STDIN open even if not attached'
	COMPGEN --io-maxbandwidth bytes 'Maximum IO bandwidth limit for the system drive (Windows only)'
	COMPGEN --io-maxiops uint 'Maximum IOps limit for the system drive (Windows only)'
	COMPGEN --ip string 'IPv4 address (e.g., 172.30.100.104)'
	COMPGEN --ip6 string 'IPv6 address (e.g., 2001:db8::33)'
	COMPGEN --ipc string 'IPC mode to use'
	COMPGEN --isolation string 'Container isolation technology'
	COMPGEN --kernel-memory bytes 'Kernel memory limit'
	COMPGEN '-l' list 'Set meta data on a container'
	COMPGEN --label list 'Set meta data on a container'
	COMPGEN --label-file list 'Read in a line delimited file of labels'
	COMPGEN --link list 'Add link to another container'
	COMPGEN --link-local-ip list 'Container IPv4/IPv6 link-local addresses'
	COMPGEN --log-driver string 'Logging driver for the container'
	COMPGEN --log-opt list 'Log driver options'
	COMPGEN --mac-address string 'Container MAC address (e.g., 92:d0:c6:0a:29:33)'
	COMPGEN '-m' bytes 'Memory limit'
	COMPGEN --memory bytes 'Memory limit'
	COMPGEN --memory-reservation bytes 'Memory soft limit'
	COMPGEN --memory-swap bytes 'Swap limit equal to memory plus swap: ''-1'' to enable unlimited swap'
	COMPGEN --memory-swappiness int 'Tune container memory swappiness (0 to 100)'
	COMPGEN --mount mount 'Attach a filesystem mount to the container'
	COMPGEN --name string 'Assign a name to the container'
	COMPGEN --network network 'Connect a container to a network'
	COMPGEN --network-alias list 'Add network-scoped alias for the container'
	COMPGEN --no-healthcheck Switch 'Disable any container-specified HEALTHCHECK'
	COMPGEN --oom-kill-disable Switch 'Disable OOM Killer'
	COMPGEN --oom-score-adj int 'Tune host''s OOM preferences (-1000 to 1000)'
	COMPGEN --pid string 'PID namespace to use'
	COMPGEN --pids-limit int 'Tune container pids limit (set -1 for unlimited)'
	COMPGEN --platform string 'Set platform if server is multi-platform capable'
	COMPGEN --privileged Switch 'Give extended privileges to this container'
	COMPGEN '-p' list 'Publish a container''s port(s) to the host'
	COMPGEN --publish list 'Publish a container''s port(s) to the host'
	COMPGEN '-P' Switch 'Publish all exposed ports to random ports'
	COMPGEN --publish-all Switch 'Publish all exposed ports to random ports'
	COMPGEN --pull string 'Pull image before running ("always", "missing", "never")'
	COMPGEN '-q' Switch 'Suppress the pull output'
	COMPGEN --quiet Switch 'Suppress the pull output'
	COMPGEN --read-only Switch 'Mount the container''s root filesystem as read only'
	COMPGEN --restart string 'Restart policy to apply when a container exits'
	COMPGEN --rm Switch 'Automatically remove the container when it exits'
	COMPGEN --runtime string 'Runtime to use for this container'
	COMPGEN --security-opt list 'Security Options'
	COMPGEN --shm-size bytes 'Size of /dev/shm'
	COMPGEN --sig-proxy Switch 'Proxy received signals to the process'
	COMPGEN --stop-signal string 'Signal to stop the container'
	COMPGEN --stop-timeout int 'Timeout (in seconds) to stop a container'
	COMPGEN --storage-opt list 'Storage driver options for the container'
	COMPGEN --sysctl map 'Sysctl options'
	COMPGEN --tmpfs list 'Mount a tmpfs directory'
	COMPGEN '-t' Switch 'Allocate a pseudo-TTY'
	COMPGEN --tty Switch 'Allocate a pseudo-TTY'
	COMPGEN --ulimit ulimit 'Ulimit options'
	COMPGEN '-u' string 'Username or UID (format: <name|uid>[:<group|gid>])'
	COMPGEN --user string 'Username or UID (format: <name|uid>[:<group|gid>])'
	COMPGEN --userns string 'User namespace to use'
	COMPGEN --uts string 'UTS namespace to use'
	COMPGEN '-v' list 'Bind mount a volume'
	COMPGEN --volume list 'Bind mount a volume'
	COMPGEN --volume-driver string 'Optional volume driver for the container'
	COMPGEN --volumes-from list 'Mount volumes from the specified container(s)'
	COMPGEN '-w' string 'Working directory inside the container'
	COMPGEN --workdir string 'Working directory inside the container'
}

Register-Completer docker_search -Option {
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Pretty-print search using a Go template'
	COMPGEN --limit int 'Max number of search results'
	COMPGEN --no-trunc Switch 'Don''t truncate output'
}

Register-Completer docker_version -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
}

if ($env:DOCKER_HIDE_LEGACY_COMMANDS) {
	return
}

Register-Completer docker_attach -Option {
	COMPGEN --detach-keys string 'Override the key sequence for detaching a container'
	COMPGEN --no-stdin Switch 'Do not attach STDIN'
	COMPGEN --sig-proxy Switch 'Proxy all received signals to the process'
}

Register-Completer docker_commit -Option {
	COMPGEN '-a' string 'Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")'
	COMPGEN --author string 'Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")'
	COMPGEN '-c' list 'Apply Dockerfile instruction to the created image'
	COMPGEN --change list 'Apply Dockerfile instruction to the created image'
	COMPGEN '-m' string 'Commit message'
	COMPGEN --message string 'Commit message'
	COMPGEN '-p' Switch 'Pause container during commit'
	COMPGEN --pause Switch 'Pause container during commit'
}

Register-Completer docker_cp -Option {
	COMPGEN '-a' Switch 'Archive mode (copy all uid/gid information)'
	COMPGEN --archive Switch 'Archive mode (copy all uid/gid information)'
	COMPGEN '-L' Switch 'Always follow symbol link in SRC_PATH'
	COMPGEN --follow-link Switch 'Always follow symbol link in SRC_PATH'
	COMPGEN '-q' Switch 'Suppress progress output during copy. Progress output is automatically suppressed if no terminal is attached'
	COMPGEN --quiet Switch 'Suppress progress output during copy. Progress output is automatically suppressed if no terminal is attached'
}

Register-Completer docker_create -Option {
	COMPGEN --add-host list 'Add a custom host-to-IP mapping (host:ip)'
	COMPGEN --annotation map 'Add an annotation to the container (passed through to the OCI runtime)'
	COMPGEN '-a' list 'Attach to STDIN, STDOUT or STDERR'
	COMPGEN --attach list 'Attach to STDIN, STDOUT or STDERR'
	COMPGEN --blkio-weight uint16 'Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)'
	COMPGEN --blkio-weight-device list 'Block IO weight (relative device weight)'
	COMPGEN --cap-add list 'Add Linux capabilities'
	COMPGEN --cap-drop list 'Drop Linux capabilities'
	COMPGEN --cgroup-parent string 'Optional parent cgroup for the container'
	COMPGEN --cgroupns string 'Cgroup namespace to use (host|private)
''host'':    Run the container in the Docker host''s cgroup namespace
''private'': Run the container in its own private cgroup namespace
'''':        Use the cgroup namespace as configured by the
           default-cgroupns-mode option on the daemon (default)'
	COMPGEN --cidfile string 'Write the container ID to the file'
	COMPGEN --cpu-count int 'CPU count (Windows only)'
	COMPGEN --cpu-percent int 'CPU percent (Windows only)'
	COMPGEN --cpu-period int 'Limit CPU CFS (Completely Fair Scheduler) period'
	COMPGEN --cpu-quota int 'Limit CPU CFS (Completely Fair Scheduler) quota'
	COMPGEN --cpu-rt-period int 'Limit CPU real-time period in microseconds'
	COMPGEN --cpu-rt-runtime int 'Limit CPU real-time runtime in microseconds'
	COMPGEN '-c' int 'CPU shares (relative weight)'
	COMPGEN --cpu-shares int 'CPU shares (relative weight)'
	COMPGEN --cpus decimal 'Number of CPUs'
	COMPGEN --cpuset-cpus string 'CPUs in which to allow execution (0-3, 0,1)'
	COMPGEN --cpuset-mems string 'MEMs in which to allow execution (0-3, 0,1)'
	COMPGEN --device list 'Add a host device to the container'
	COMPGEN --device-cgroup-rule list 'Add a rule to the cgroup allowed devices list'
	COMPGEN --device-read-bps list 'Limit read rate (bytes per second) from a device'
	COMPGEN --device-read-iops list 'Limit read rate (IO per second) from a device'
	COMPGEN --device-write-bps list 'Limit write rate (bytes per second) to a device'
	COMPGEN --device-write-iops list 'Limit write rate (IO per second) to a device'
	COMPGEN --disable-content-trust Switch 'Skip image verification'
	COMPGEN --dns list 'Set custom DNS servers'
	COMPGEN --dns-option list 'Set DNS options'
	COMPGEN --dns-search list 'Set custom DNS search domains'
	COMPGEN --domainname string 'Container NIS domain name'
	COMPGEN --entrypoint string 'Overwrite the default ENTRYPOINT of the image'
	COMPGEN '-e' list 'Set environment variables'
	COMPGEN --env list 'Set environment variables'
	COMPGEN --env-file list 'Read in a file of environment variables'
	COMPGEN --expose list 'Expose a port or a range of ports'
	COMPGEN --gpus gpu-request 'GPU devices to add to the container (''all'' to pass all GPUs)'
	COMPGEN --group-add list 'Add additional groups to join'
	COMPGEN --health-cmd string 'Command to run to check health'
	COMPGEN --health-interval duration 'Time between running the check (ms|s|m|h) (default 0s)'
	COMPGEN --health-retries int 'Consecutive failures needed to report unhealthy'
	COMPGEN --health-start-interval duration 'Time between running the check during the start period (ms|s|m|h) (default 0s)'
	COMPGEN --health-start-period duration 'Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)'
	COMPGEN --health-timeout duration 'Maximum time to allow one check to run (ms|s|m|h) (default 0s)'
	COMPGEN --help Switch 'Print usage'
	COMPGEN '-h' string 'Container host name'
	COMPGEN --hostname string 'Container host name'
	COMPGEN --init Switch 'Run an init inside the container that forwards signals and reaps processes'
	COMPGEN '-i' Switch 'Keep STDIN open even if not attached'
	COMPGEN --interactive Switch 'Keep STDIN open even if not attached'
	COMPGEN --io-maxbandwidth bytes 'Maximum IO bandwidth limit for the system drive (Windows only)'
	COMPGEN --io-maxiops uint 'Maximum IOps limit for the system drive (Windows only)'
	COMPGEN --ip string 'IPv4 address (e.g., 172.30.100.104)'
	COMPGEN --ip6 string 'IPv6 address (e.g., 2001:db8::33)'
	COMPGEN --ipc string 'IPC mode to use'
	COMPGEN --isolation string 'Container isolation technology'
	COMPGEN --kernel-memory bytes 'Kernel memory limit'
	COMPGEN '-l' list 'Set meta data on a container'
	COMPGEN --label list 'Set meta data on a container'
	COMPGEN --label-file list 'Read in a line delimited file of labels'
	COMPGEN --link list 'Add link to another container'
	COMPGEN --link-local-ip list 'Container IPv4/IPv6 link-local addresses'
	COMPGEN --log-driver string 'Logging driver for the container'
	COMPGEN --log-opt list 'Log driver options'
	COMPGEN --mac-address string 'Container MAC address (e.g., 92:d0:c6:0a:29:33)'
	COMPGEN '-m' bytes 'Memory limit'
	COMPGEN --memory bytes 'Memory limit'
	COMPGEN --memory-reservation bytes 'Memory soft limit'
	COMPGEN --memory-swap bytes 'Swap limit equal to memory plus swap: ''-1'' to enable unlimited swap'
	COMPGEN --memory-swappiness int 'Tune container memory swappiness (0 to 100)'
	COMPGEN --mount mount 'Attach a filesystem mount to the container'
	COMPGEN --name string 'Assign a name to the container'
	COMPGEN --network network 'Connect a container to a network'
	COMPGEN --network-alias list 'Add network-scoped alias for the container'
	COMPGEN --no-healthcheck Switch 'Disable any container-specified HEALTHCHECK'
	COMPGEN --oom-kill-disable Switch 'Disable OOM Killer'
	COMPGEN --oom-score-adj int 'Tune host''s OOM preferences (-1000 to 1000)'
	COMPGEN --pid string 'PID namespace to use'
	COMPGEN --pids-limit int 'Tune container pids limit (set -1 for unlimited)'
	COMPGEN --platform string 'Set platform if server is multi-platform capable'
	COMPGEN --privileged Switch 'Give extended privileges to this container'
	COMPGEN '-p' list 'Publish a container''s port(s) to the host'
	COMPGEN --publish list 'Publish a container''s port(s) to the host'
	COMPGEN '-P' Switch 'Publish all exposed ports to random ports'
	COMPGEN --publish-all Switch 'Publish all exposed ports to random ports'
	COMPGEN --pull string 'Pull image before creating ("always", "missing", "never")'
	COMPGEN '-q' Switch 'Suppress the pull output'
	COMPGEN --quiet Switch 'Suppress the pull output'
	COMPGEN --read-only Switch 'Mount the container''s root filesystem as read only'
	COMPGEN --restart string 'Restart policy to apply when a container exits'
	COMPGEN --rm Switch 'Automatically remove the container when it exits'
	COMPGEN --runtime string 'Runtime to use for this container'
	COMPGEN --security-opt list 'Security Options'
	COMPGEN --shm-size bytes 'Size of /dev/shm'
	COMPGEN --stop-signal string 'Signal to stop the container'
	COMPGEN --stop-timeout int 'Timeout (in seconds) to stop a container'
	COMPGEN --storage-opt list 'Storage driver options for the container'
	COMPGEN --sysctl map 'Sysctl options'
	COMPGEN --tmpfs list 'Mount a tmpfs directory'
	COMPGEN '-t' Switch 'Allocate a pseudo-TTY'
	COMPGEN --tty Switch 'Allocate a pseudo-TTY'
	COMPGEN --ulimit ulimit 'Ulimit options'
	COMPGEN '-u' string 'Username or UID (format: <name|uid>[:<group|gid>])'
	COMPGEN --user string 'Username or UID (format: <name|uid>[:<group|gid>])'
	COMPGEN --userns string 'User namespace to use'
	COMPGEN --uts string 'UTS namespace to use'
	COMPGEN '-v' list 'Bind mount a volume'
	COMPGEN --volume list 'Bind mount a volume'
	COMPGEN --volume-driver string 'Optional volume driver for the container'
	COMPGEN --volumes-from list 'Mount volumes from the specified container(s)'
	COMPGEN '-w' string 'Working directory inside the container'
	COMPGEN --workdir string 'Working directory inside the container'
}

Register-Completer docker_events -Option {
	COMPGEN '-f' filter 'Filter output based on conditions provided'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --since string 'Show all events created since timestamp'
	COMPGEN --until string 'Stream events until this timestamp'
}

Register-Completer docker_export -Option {
	COMPGEN '-o' string 'Write to a file, instead of STDOUT'
	COMPGEN --output string 'Write to a file, instead of STDOUT'
}

Register-Completer docker_history -Option {
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-H' Switch 'Print sizes and dates in human readable format'
	COMPGEN --human Switch 'Print sizes and dates in human readable format'
	COMPGEN --no-trunc Switch 'Don''t truncate output'
	COMPGEN '-q' Switch 'Only show image IDs'
	COMPGEN --quiet Switch 'Only show image IDs'
}

Register-Completer docker_import -Option {
	COMPGEN '-c' list 'Apply Dockerfile instruction to the created image'
	COMPGEN --change list 'Apply Dockerfile instruction to the created image'
	COMPGEN '-m' string 'Set commit message for imported image'
	COMPGEN --message string 'Set commit message for imported image'
	COMPGEN --platform string 'Set platform if server is multi-platform capable'
}

Register-Completer docker_inspect -Option {
	COMPGEN '-f' string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --format string 'Format output using a custom template:
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN '-s' Switch 'Display total file sizes if the type is container'
	COMPGEN --size Switch 'Display total file sizes if the type is container'
	COMPGEN --type string 'Return JSON for specified type'
}

Register-Completer docker_kill -Option {
	COMPGEN '-s' string 'Signal to send to the container'
	COMPGEN --signal string 'Signal to send to the container'
}

Register-Completer docker_load -Option {
	COMPGEN '-i' string 'Read from tar archive file, instead of STDIN'
	COMPGEN --input string 'Read from tar archive file, instead of STDIN'
	COMPGEN '-q' Switch 'Suppress the load output'
	COMPGEN --quiet Switch 'Suppress the load output'
}

Register-Completer docker_logs -Option {
	COMPGEN --details Switch 'Show extra details provided to logs'
	COMPGEN '-f' Switch 'Follow log output'
	COMPGEN --follow Switch 'Follow log output'
	COMPGEN --since string 'Show logs since timestamp (e.g. "2013-01-02T13:23:37Z") or relative (e.g. "42m" for 42 minutes)'
	COMPGEN '-n' string 'Number of lines to show from the end of the logs'
	COMPGEN --tail string 'Number of lines to show from the end of the logs'
	COMPGEN '-t' Switch 'Show timestamps'
	COMPGEN --timestamps Switch 'Show timestamps'
	COMPGEN --until string 'Show logs before a timestamp (e.g. "2013-01-02T13:23:37Z") or relative (e.g. "42m" for 42 minutes)'
}

Register-Completer docker_restart -Option {
	COMPGEN '-s' string 'Signal to send to the container'
	COMPGEN --signal string 'Signal to send to the container'
	COMPGEN '-t' int 'Seconds to wait before killing the container'
	COMPGEN --time int 'Seconds to wait before killing the container'
}

Register-Completer docker_rm -Option {
	COMPGEN '-f' Switch 'Force the removal of a running container (uses SIGKILL)'
	COMPGEN --force Switch 'Force the removal of a running container (uses SIGKILL)'
	COMPGEN '-l' Switch 'Remove the specified link'
	COMPGEN --link Switch 'Remove the specified link'
	COMPGEN '-v' Switch 'Remove anonymous volumes associated with the container'
	COMPGEN --volumes Switch 'Remove anonymous volumes associated with the container'
}

Register-Completer docker_rmi -Option {
	COMPGEN '-f' Switch 'Force removal of the image'
	COMPGEN --force Switch 'Force removal of the image'
	COMPGEN --no-prune Switch 'Do not delete untagged parents'
}

Register-Completer docker_save -Option {
	COMPGEN '-o' string 'Write to a file, instead of STDOUT'
	COMPGEN --output string 'Write to a file, instead of STDOUT'
}

Register-Completer docker_start -Option {
	COMPGEN '-a' Switch 'Attach STDOUT/STDERR and forward signals'
	COMPGEN --attach Switch 'Attach STDOUT/STDERR and forward signals'
	COMPGEN --checkpoint string 'Restore from this checkpoint'
	COMPGEN --checkpoint-dir string 'Use a custom checkpoint storage directory'
	COMPGEN --detach-keys string 'Override the key sequence for detaching a container'
	COMPGEN '-i' Switch 'Attach container''s STDIN'
	COMPGEN --interactive Switch 'Attach container''s STDIN'
}

Register-Completer docker_stats -Option {
	COMPGEN '-a' Switch 'Show all containers (default shows just running)'
	COMPGEN --all Switch 'Show all containers (default shows just running)'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --no-stream Switch 'Disable streaming stats and only pull the first result'
	COMPGEN --no-trunc Switch 'Do not truncate output'
}

Register-Completer docker_stop -Option {
	COMPGEN '-s' string 'Signal to send to the container'
	COMPGEN --signal string 'Signal to send to the container'
	COMPGEN '-t' int 'Seconds to wait before killing the container'
	COMPGEN --time int 'Seconds to wait before killing the container'
}

Register-Completer docker_update -Option {
	COMPGEN --blkio-weight uint16 'Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)'
	COMPGEN --cpu-period int 'Limit CPU CFS (Completely Fair Scheduler) period'
	COMPGEN --cpu-quota int 'Limit CPU CFS (Completely Fair Scheduler) quota'
	COMPGEN --cpu-rt-period int 'Limit the CPU real-time period in microseconds'
	COMPGEN --cpu-rt-runtime int 'Limit the CPU real-time runtime in microseconds'
	COMPGEN '-c' int 'CPU shares (relative weight)'
	COMPGEN --cpu-shares int 'CPU shares (relative weight)'
	COMPGEN --cpus decimal 'Number of CPUs'
	COMPGEN --cpuset-cpus string 'CPUs in which to allow execution (0-3, 0,1)'
	COMPGEN --cpuset-mems string 'MEMs in which to allow execution (0-3, 0,1)'
	COMPGEN '-m' bytes 'Memory limit'
	COMPGEN --memory bytes 'Memory limit'
	COMPGEN --memory-reservation bytes 'Memory soft limit'
	COMPGEN --memory-swap bytes 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
	COMPGEN --pids-limit int 'Tune container pids limit (set -1 for unlimited)'
	COMPGEN --restart string 'Restart policy to apply when a container exits'
}
