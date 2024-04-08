# Docker Compose version v2.26.1
Register-Completer docker_compose {
	COMPGEN alpha SubCommand 'Experimental commands'
	COMPGEN attach SubCommand 'Attach local standard input, output, and error streams to a service''s running container'
	COMPGEN build SubCommand 'Build or rebuild services'
	COMPGEN config SubCommand 'Parse, resolve and render compose file in canonical format'
	COMPGEN cp SubCommand 'Copy files/folders between a service container and the local filesystem'
	COMPGEN create SubCommand 'Creates containers for a service'
	COMPGEN down SubCommand 'Stop and remove containers, networks'
	COMPGEN events SubCommand 'Receive real time events from containers'
	COMPGEN exec SubCommand 'Execute a command in a running container'
	COMPGEN images SubCommand 'List images used by the created containers'
	COMPGEN kill SubCommand 'Force stop service containers'
	COMPGEN logs SubCommand 'View output from containers'
	COMPGEN ls SubCommand 'List running compose projects'
	COMPGEN pause SubCommand 'Pause services'
	COMPGEN port SubCommand 'Print the public port for a port binding'
	COMPGEN ps SubCommand 'List containers'
	COMPGEN pull SubCommand 'Pull service images'
	COMPGEN push SubCommand 'Push service images'
	COMPGEN restart SubCommand 'Restart service containers'
	COMPGEN rm SubCommand 'Removes stopped service containers'
	COMPGEN run SubCommand 'Run a one-off command on a service'
	COMPGEN scale SubCommand 'Scale services '
	COMPGEN start SubCommand 'Start services'
	COMPGEN stats SubCommand 'Display a live stream of container(s) resource usage statistics'
	COMPGEN stop SubCommand 'Stop services'
	COMPGEN top SubCommand 'Display the running processes'
	COMPGEN unpause SubCommand 'Unpause services'
	COMPGEN up SubCommand 'Create and start containers'
	COMPGEN version SubCommand 'Show the Docker Compose version information'
	COMPGEN wait SubCommand 'Block until the first service container stops'
	COMPGEN watch SubCommand 'Watch build context for service and rebuild/refresh containers when files are updated'
}

Register-Completer docker_compose -Option {
	COMPGEN --ansi string 'Control when to print ANSI control characters ("never"|"always"|"auto")'
	COMPGEN --compatibility Switch 'Run compose in backward compatibility mode'
	COMPGEN --dry-run Switch 'Execute command in dry run mode'
	COMPGEN --env-file stringArray 'Specify an alternate environment file'
	COMPGEN '-f' stringArray 'Compose configuration files'
	COMPGEN --file stringArray 'Compose configuration files'
	COMPGEN --no-ansi Switch 'Do not print ANSI control characters (DEPRECATED)'
	COMPGEN --parallel int 'Control max parallelism, -1 for unlimited'
	COMPGEN --profile stringArray 'Specify a profile to enable'
	COMPGEN --progress string 'Set type of progress output (auto, tty, plain, quiet)'
	COMPGEN --project-directory string 'Specify an alternate working directory
(default: the path of the, first specified, Compose file)'
	COMPGEN '-p' string 'Project name'
	COMPGEN --project-name string 'Project name'
	COMPGEN --verbose Switch 'Show more output'
	COMPGEN '-v' Switch 'Show the Docker Compose version information'
	COMPGEN --version Switch 'Show the Docker Compose version information'
	COMPGEN --workdir string 'DEPRECATED! USE --project-directory INSTEAD.
Specify an alternate working directory
(default: the path of the, first specified, Compose file)'
}

Register-Completer docker_compose_attach -Option {
	COMPGEN --detach-keys string 'Override the key sequence for detaching from a container.'
	COMPGEN --dry-run Switch 'Execute command in dry run mode'
	COMPGEN --index int 'index of the container if service has multiple replicas.'
	COMPGEN --no-stdin Switch 'Do not attach STDIN'
	COMPGEN --sig-proxy Switch 'Proxy all received signals to the process'
}

Register-Completer docker_compose_build -Option {
	COMPGEN --build-arg stringArray 'Set build-time variables for services'
	COMPGEN --builder string 'Set builder to use'
	COMPGEN --dry-run Switch 'Execute command in dry run mode'
	COMPGEN '-m' bytes 'Set memory limit for the build container. Not supported by BuildKit.'
	COMPGEN --memory bytes 'Set memory limit for the build container. Not supported by BuildKit.'
	COMPGEN --no-cache Switch 'Do not use cache when building the image'
	COMPGEN --progress string 'Set type of ui output (auto, tty, plain, quiet)'
	COMPGEN --pull Switch 'Always attempt to pull a newer version of the image'
	COMPGEN --push Switch 'Push service images'
	COMPGEN '-q' Switch 'Don''t print anything to STDOUT'
	COMPGEN --quiet Switch 'Don''t print anything to STDOUT'
	COMPGEN --ssh string 'Set SSH authentications used when building service images. (use ''default'' for using your default SSH Agent)'
	COMPGEN --with-dependencies Switch 'Also build dependencies (transitively)'
}

Register-Completer docker_compose_config -Option {
	COMPGEN --dry-run Switch 'Execute command in dry run mode'
	COMPGEN --format string 'Format the output. Values: [yaml | json]'
	COMPGEN --hash string 'Print the service config hash, one per line.'
	COMPGEN --images Switch 'Print the image names, one per line.'
	COMPGEN --no-consistency Switch 'Don''t check model consistency - warning: may produce invalid Compose output'
	COMPGEN --no-interpolate Switch 'Don''t interpolate environment variables'
	COMPGEN --no-normalize Switch 'Don''t normalize compose model'
	COMPGEN --no-path-resolution Switch 'Don''t resolve file paths'
	COMPGEN '-o' string 'Save to file (default to stdout)'
	COMPGEN --output string 'Save to file (default to stdout)'
	COMPGEN --profiles Switch 'Print the profile names, one per line.'
	COMPGEN '-q' Switch 'Only validate the configuration, don''t print anything'
	COMPGEN --quiet Switch 'Only validate the configuration, don''t print anything'
	COMPGEN --resolve-image-digests Switch 'Pin image tags to digests'
	COMPGEN --services Switch 'Print the service names, one per line.'
	COMPGEN --variables Switch 'Print model variables and default values.'
	COMPGEN --volumes Switch 'Print the volume names, one per line.'
}

Register-Completer docker_compose_cp -Option {
	COMPGEN --all Switch 'Copy to all the containers of the service'
	COMPGEN '-a' Switch 'Archive mode (copy all uid/gid information)'
	COMPGEN --archive Switch 'Archive mode (copy all uid/gid information)'
	COMPGEN '-L' Switch 'Always follow symbol link in SRC_PATH'
	COMPGEN --follow-link Switch 'Always follow symbol link in SRC_PATH'
	COMPGEN --index int 'Index of the container if service has multiple replicas'
}

Register-Completer docker_compose_create -Option {
	COMPGEN --build Switch 'Build images before starting containers'
	COMPGEN --force-recreate Switch 'Recreate containers even if their configuration and image haven''t changed'
	COMPGEN --no-build Switch 'Don''t build an image, even if it''s policy'
	COMPGEN --no-recreate Switch 'If containers already exist, don''t recreate them. Incompatible with --force-recreate.'
	COMPGEN --pull string 'Pull image before running ("always"|"missing"|"never"|"build")'
	COMPGEN --quiet-pull Switch 'Pull without printing progress information'
	COMPGEN --remove-orphans Switch 'Remove containers for services not defined in the Compose file'
	COMPGEN --scale stringArray 'Scale SERVICE to NUM instances. Overrides the `scale` setting in the Compose file if present.'
}

Register-Completer docker_compose_down -Option {
	COMPGEN --remove-orphans Switch 'Remove containers for services not defined in the Compose file'
	COMPGEN --rmi string 'Remove images used by services. "local" remove only images that don''t have a custom tag ("local"|"all")'
	COMPGEN '-t' int 'Specify a shutdown timeout in seconds'
	COMPGEN --timeout int 'Specify a shutdown timeout in seconds'
	COMPGEN '-v' Switch 'Remove named volumes declared in the "volumes" section of the Compose file and anonymous volumes attached to containers'
	COMPGEN --volumes Switch 'Remove named volumes declared in the "volumes" section of the Compose file and anonymous volumes attached to containers'
}

Register-Completer docker_compose_events -Option {
	COMPGEN --json Switch 'Output events as a stream of json objects'
}

Register-Completer docker_compose_exec -Option {
	COMPGEN '-d' Switch 'Detached mode: Run command in the background'
	COMPGEN --detach Switch 'Detached mode: Run command in the background'
	COMPGEN '-e' stringArray 'Set environment variables'
	COMPGEN --env stringArray 'Set environment variables'
	COMPGEN --index int 'Index of the container if service has multiple replicas'
	COMPGEN '-i' Switch 'Keep STDIN open even if not attached'
	COMPGEN --interactive Switch 'Keep STDIN open even if not attached'
	COMPGEN '-T' Switch 'Disable pseudo-TTY allocation. By default `docker compose exec` allocates a TTY.'
	COMPGEN --no-TTY Switch 'Disable pseudo-TTY allocation. By default `docker compose exec` allocates a TTY.'
	COMPGEN --privileged Switch 'Give extended privileges to the process'
	COMPGEN '-t' Switch 'Allocate a pseudo-TTY'
	COMPGEN --tty Switch 'Allocate a pseudo-TTY'
	COMPGEN '-u' string 'Run the command as this user'
	COMPGEN --user string 'Run the command as this user'
	COMPGEN '-w' string 'Path to workdir directory for this command'
	COMPGEN --workdir string 'Path to workdir directory for this command'
}

Register-Completer docker_compose_images -Option {
	COMPGEN --format string 'Format the output. Values: [table | json]'
	COMPGEN '-q' Switch 'Only display IDs'
	COMPGEN --quiet Switch 'Only display IDs'
}

Register-Completer docker_compose_kill -Option {
	COMPGEN --remove-orphans Switch 'Remove containers for services not defined in the Compose file'
	COMPGEN '-s' string 'SIGNAL to send to the container'
	COMPGEN --signal string 'SIGNAL to send to the container'
}

Register-Completer docker_compose_logs -Option {
	COMPGEN --dry-run Switch 'Execute command in dry run mode'
	COMPGEN '-f' Switch 'Follow log output'
	COMPGEN --follow Switch 'Follow log output'
	COMPGEN --index int 'index of the container if service has multiple replicas'
	COMPGEN --no-color Switch 'Produce monochrome output'
	COMPGEN --no-log-prefix Switch 'Don''t print prefix in logs'
	COMPGEN --since string 'Show logs since timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)'
	COMPGEN '-n' string 'Number of lines to show from the end of the logs for each container'
	COMPGEN --tail string 'Number of lines to show from the end of the logs for each container'
	COMPGEN '-t' Switch 'Show timestamps'
	COMPGEN --timestamps Switch 'Show timestamps'
	COMPGEN --until string 'Show logs before a timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)'
}

Register-Completer docker_compose_ls -Option {
	COMPGEN '-a' Switch 'Show all stopped Compose projects'
	COMPGEN --all Switch 'Show all stopped Compose projects'
	COMPGEN --filter filter 'Filter output based on conditions provided'
	COMPGEN --format string 'Format the output. Values: [table | json]'
	COMPGEN '-q' Switch 'Only display IDs'
	COMPGEN --quiet Switch 'Only display IDs'
}

Register-Completer docker_compose_port -Option {
	COMPGEN --index int 'Index of the container if service has multiple replicas'
	COMPGEN --protocol string 'tcp or udp'
}

Register-Completer docker_compose_ps -Option {
	COMPGEN '-a' Switch 'Show all stopped containers (including those created by the run command)'
	COMPGEN --all Switch 'Show all stopped containers (including those created by the run command)'
	COMPGEN --dry-run Switch 'Execute command in dry run mode'
	COMPGEN --filter string 'Filter services by a property (supported filters: status)'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --no-trunc Switch 'Don''t truncate output'
	COMPGEN --orphans Switch 'Include orphaned services (not declared by project)'
	COMPGEN '-q' Switch 'Only display IDs'
	COMPGEN --quiet Switch 'Only display IDs'
	COMPGEN --services Switch 'Display services'
	COMPGEN --status stringArray 'Filter services by status. Values: [paused | restarting | removing | running | dead | created | exited]'
}

Register-Completer docker_compose_pull -Option {
	COMPGEN --dry-run Switch 'Execute command in dry run mode'
	COMPGEN --ignore-buildable Switch 'Ignore images that can be built'
	COMPGEN --ignore-pull-failures Switch 'Pull what it can and ignores images with pull failures'
	COMPGEN --include-deps Switch 'Also pull services declared as dependencies'
	COMPGEN --policy string 'Apply pull policy ("missing"|"always")'
	COMPGEN '-q' Switch 'Pull without printing progress information'
	COMPGEN --quiet Switch 'Pull without printing progress information'
}

Register-Completer docker_compose_push -Option {
	COMPGEN --ignore-push-failures Switch 'Push what it can and ignores images with push failures'
	COMPGEN --include-deps Switch 'Also push images of services declared as dependencies'
	COMPGEN '-q' Switch 'Push without printing progress information'
	COMPGEN --quiet Switch 'Push without printing progress information'
}

Register-Completer docker_compose_restart -Option {
	COMPGEN --no-deps Switch 'Don''t restart dependent services'
	COMPGEN '-t' int 'Specify a shutdown timeout in seconds'
	COMPGEN --timeout int 'Specify a shutdown timeout in seconds'
}

Register-Completer docker_compose_rm -Option {
	COMPGEN '-a' Switch 'Deprecated - no effect'
	COMPGEN --all Switch 'Deprecated - no effect'
	COMPGEN '-f' Switch 'Don''t ask to confirm removal'
	COMPGEN --force Switch 'Don''t ask to confirm removal'
	COMPGEN '-s' Switch 'Stop the containers, if required, before removing'
	COMPGEN --stop Switch 'Stop the containers, if required, before removing'
	COMPGEN '-v' Switch 'Remove any anonymous volumes attached to containers'
	COMPGEN --volumes Switch 'Remove any anonymous volumes attached to containers'
}

Register-Completer docker_compose_run -Option {
	COMPGEN --build Switch 'Build image before starting container'
	COMPGEN --cap-add list 'Add Linux capabilities'
	COMPGEN --cap-drop list 'Drop Linux capabilities'
	COMPGEN '-d' Switch 'Run container in background and print container ID'
	COMPGEN --detach Switch 'Run container in background and print container ID'
	COMPGEN --entrypoint string 'Override the entrypoint of the image'
	COMPGEN '-e' stringArray 'Set environment variables'
	COMPGEN --env stringArray 'Set environment variables'
	COMPGEN '-i' Switch 'Keep STDIN open even if not attached'
	COMPGEN --interactive Switch 'Keep STDIN open even if not attached'
	COMPGEN '-l' stringArray 'Add or override a label'
	COMPGEN --label stringArray 'Add or override a label'
	COMPGEN --name string 'Assign a name to the container'
	COMPGEN '-T' Switch 'Disable pseudo-TTY allocation (default: auto-detected)'
	COMPGEN --no-TTY Switch 'Disable pseudo-TTY allocation (default: auto-detected)'
	COMPGEN --no-deps Switch 'Don''t start linked services'
	COMPGEN '-p' stringArray 'Publish a container''s port(s) to the host'
	COMPGEN --publish stringArray 'Publish a container''s port(s) to the host'
	COMPGEN --quiet-pull Switch 'Pull without printing progress information'
	COMPGEN --remove-orphans Switch 'Remove containers for services not defined in the Compose file'
	COMPGEN --rm Switch 'Automatically remove the container when it exits'
	COMPGEN '-P' Switch 'Run command with all service''s ports enabled and mapped to the host'
	COMPGEN --service-ports Switch 'Run command with all service''s ports enabled and mapped to the host'
	COMPGEN '-t' Switch 'Allocate a pseudo-TTY'
	COMPGEN --tty Switch 'Allocate a pseudo-TTY'
	COMPGEN --use-aliases Switch 'Use the service''s network useAliases in the network(s) the container connects to'
	COMPGEN '-u' string 'Run as specified username or uid'
	COMPGEN --user string 'Run as specified username or uid'
	COMPGEN '-v' stringArray 'Bind mount a volume'
	COMPGEN --volume stringArray 'Bind mount a volume'
	COMPGEN '-w' string 'Working directory inside the container'
	COMPGEN --workdir string 'Working directory inside the container'
}

Register-Completer docker_compose_scale -Option {
	COMPGEN --dry-run Switch 'Execute command in dry run mode'
	COMPGEN --no-deps Switch 'Don''t start linked services'
}

Register-Completer docker_compose_stats -Option {
	COMPGEN '-a' Switch 'Show all containers (default shows just running)'
	COMPGEN --all Switch 'Show all containers (default shows just running)'
	COMPGEN --dry-run Switch 'Execute command in dry run mode'
	COMPGEN --format string 'Format output using a custom template:
''table'':            Print output in table format with column headers (default)
''table TEMPLATE'':   Print output in table format using the given Go template
''json'':             Print in JSON format
''TEMPLATE'':         Print output using the given Go template.
Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates'
	COMPGEN --no-stream Switch 'Disable streaming stats and only pull the first result'
	COMPGEN --no-trunc Switch 'Do not truncate output'
}

Register-Completer docker_compose_stop -Option {
	COMPGEN '-t' int 'Specify a shutdown timeout in seconds'
	COMPGEN --timeout int 'Specify a shutdown timeout in seconds'
}

Register-Completer docker_compose_up -Option {
	COMPGEN --abort-on-container-exit Switch 'Stops all containers if any container was stopped. Incompatible with -d'
	COMPGEN --always-recreate-deps Switch 'Recreate dependent containers. Incompatible with --no-recreate.'
	COMPGEN --attach stringArray 'Restrict attaching to the specified services. Incompatible with --attach-dependencies.'
	COMPGEN --attach-dependencies Switch 'Automatically attach to log output of dependent services'
	COMPGEN --build Switch 'Build images before starting containers'
	COMPGEN '-d' Switch 'Detached mode: Run containers in the background'
	COMPGEN --detach Switch 'Detached mode: Run containers in the background'
	COMPGEN --exit-code-from string 'Return the exit code of the selected service container. Implies --abort-on-container-exit'
	COMPGEN --force-recreate Switch 'Recreate containers even if their configuration and image haven''t changed'
	COMPGEN --menu Switch 'Enable interactive shortcuts when running attached (Experimental). Incompatible with --detach.'
	COMPGEN --no-attach stringArray 'Do not attach (stream logs) to the specified services'
	COMPGEN --no-build Switch 'Don''t build an image, even if it''s policy'
	COMPGEN --no-color Switch 'Produce monochrome output'
	COMPGEN --no-deps Switch 'Don''t start linked services'
	COMPGEN --no-log-prefix Switch 'Don''t print prefix in logs'
	COMPGEN --no-recreate Switch 'If containers already exist, don''t recreate them. Incompatible with --force-recreate.'
	COMPGEN --no-start Switch 'Don''t start the services after creating them'
	COMPGEN --pull string 'Pull image before running ("always"|"missing"|"never")'
	COMPGEN --quiet-pull Switch 'Pull without printing progress information'
	COMPGEN --remove-orphans Switch 'Remove containers for services not defined in the Compose file'
	COMPGEN '-V' Switch 'Recreate anonymous volumes instead of retrieving data from the previous containers'
	COMPGEN --renew-anon-volumes Switch 'Recreate anonymous volumes instead of retrieving data from the previous containers'
	COMPGEN --scale stringArray 'Scale SERVICE to NUM instances. Overrides the `scale` setting in the Compose file if present.'
	COMPGEN '-t' int 'Use this timeout in seconds for container shutdown when attached or when containers are already running'
	COMPGEN --timeout int 'Use this timeout in seconds for container shutdown when attached or when containers are already running'
	COMPGEN --timestamps Switch 'Show timestamps'
	COMPGEN --wait Switch 'Wait for services to be running|healthy. Implies detached mode.'
	COMPGEN --wait-timeout int 'Maximum duration to wait for the project to be running|healthy'
	COMPGEN '-w' Switch 'Watch source code and rebuild/refresh containers when files are updated.'
	COMPGEN --watch Switch 'Watch source code and rebuild/refresh containers when files are updated.'
}

Register-Completer docker_compose_version -Option {
	COMPGEN '-f' string 'Format the output. Values: [pretty | json]. (Default: pretty)'
	COMPGEN --format string 'Format the output. Values: [pretty | json]. (Default: pretty)'
	COMPGEN --short Switch 'Shows only Compose''s version number'
}

Register-Completer docker_compose_wait -Option {
	COMPGEN --down-project Switch 'Drops project when the first container stops'
}

Register-Completer docker_compose_watch -Option {
	COMPGEN --dry-run Switch 'Execute command in dry run mode'
	COMPGEN --no-up Switch 'Do not build & start services before watching'
	COMPGEN --quiet Switch 'hide build output'
}
