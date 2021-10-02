Param(
	[string[]]$CustomScriptPath
)

function Select-CompletionResult {
	Param(
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[NativeCommandCompletionResult[]]$CompletionResult,
		[switch]$OptionWithArg,
		[switch]$LegacyOrTopLevelCommand,
		[switch]$SubCommand,
		[switch]$ManagementCommand
	)

	Process {
		if ($OptionWithArg) {
			$CompletionResult = $CompletionResult | Where-Object { $_.CompletionText -Like '-*' -and $_.TextType -NE 'Switch' }
		}
		if ($LegacyOrTopLevelCommand) {
			$CompletionResult = $CompletionResult | Where-Object { $_.TextType -eq 'LegacyCommand' -or $_.TextType -eq 'TopLevelCommand' }
		}
		if ($SubCommand) {
			$CompletionResult = $CompletionResult | Where-Object TextType -EQ SubCommand
		}
		if ($ManagementCommand) {
			$CompletionResult = $CompletionResult | Where-Object TextType -EQ ManagementCommand
		}
		$CompletionResult
	}
}

function Invoke-CompletionCustomScript {
	Param(
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[string[]]$Path
	)

	Process {
		foreach ($p in $Path) {
			. $p
		}
	}
}

function Get-ComposeCommandText {
	param (
		$CommandAst
	)

	$counter = 0
	$commandTexts = New-Object System.Collections.ArrayList

	foreach ($ce in $CommandAst.CommandElements) {
		$commandTexts.Add($ce.Extent.Text) > $null
		$counter++
		if ($ce.Extent.Text -eq 'compose') {
			break
		}
	}
	# At this point, $commandTexts = @('docker', [OPTIONS])

	$optionsWithArg = @(
		'-f', '--file'
		'--profile'
		'--project-directory'
		'-p', '--project-name'
	)

	$addNext = $false
	for (; $counter -lt $CommandAst.CommandElements.Count; $counter++) {
		$text = $CommandAst.CommandElements[$counter].Extent.Text

		if ($addNext) {
			# option's argument (e.g. `file.yaml` of `-f file.yaml`)
			$commandTexts.Add($text) > $null
			$addNext = $false
		} elseif ($text -in $optionsWithArg) {
			$commandTexts.Add($text) > $null
			$addNext = $true
		}
	}
	# At this point, $commandTexts = @('docker', [OPTIONS], 'compose', [OPTIONS])

	return $commandTexts
}

Invoke-CompletionCustomScript @(
	"$PSScriptRoot\completers.ps1"
	"$PSScriptRoot\completers4arguments.ps1"
	"$PSScriptRoot\Compose\completers.ps1"
	"$PSScriptRoot\Compose\completers4arguments.ps1"
)
if ($CustomScriptPath) {
	Invoke-CompletionCustomScript $CustomScriptPath
}

$argumentCompleter = {
	Param([string]$wordToComplete, $commandAst, $cursorPosition)

	$completerName = 'docker'
	$optionWithArg = $null
	$managementCommand = $null
	$subCommand = $null
	$legacyOrTopLevelCommand = $null
	$indexOfFirstArg = -1
	$counter = 1

	for (; $counter -lt $commandAst.CommandElements.Count; $counter++) {
		$ce = $commandAst.CommandElements[$counter]
		if ($cursorPosition -lt $ce.Extent.EndColumnNumber) {
			break
		}

		if ($optionWithArg) {
			# The argument of $optionWithArg is completed by this $ce
			$optionWithArg = $null
			continue
		}

		$text = $ce.Extent.Text
		if ($text.StartsWith('-')) {
			if ($text -in (Invoke-Completer $completerName -Option -ArgumentList $wordToComplete, $commandAst, $cursorPosition |
						Select-CompletionResult -OptionWithArg).CompletionText) {
				$optionWithArg = $text
			}
		} elseif (!$managementCommand -and !$legacyOrTopLevelCommand) {
			if ($text -in (Invoke-Completer $completerName -Completer -ArgumentList $wordToComplete, $commandAst, $cursorPosition |
						Select-CompletionResult -LegacyOrTopLevelCommand).CompletionText) {
				$legacyOrTopLevelCommand = $text
				$completerName += "_$legacyOrTopLevelCommand"
			} else {
				$managementCommand = $text
				$completerName += "_$managementCommand"
			}
		} elseif ($managementCommand -and !$subCommand) {
			$results = Invoke-Completer $completerName -Completer -ArgumentList $wordToComplete, $commandAst, $cursorPosition
			if ($text -in ($results | Select-CompletionResult -SubCommand).CompletionText) {
				$subCommand = $text
				$completerName += "_$subCommand"
			} elseif ($text -in ($results | Select-CompletionResult -ManagementCommand).CompletionText) {
				$managementCommand = $text
				$completerName += "_$managementCommand"
			}
		} elseif ($indexOfFirstArg -lt 0) {
			$indexOfFirstArg = $counter
		}
	}

	if ($optionWithArg) {
		$completerName += "_$optionWithArg"
	}

	# At this point, $completerName is any of the following:
	# 'docker'
	# 'docker_optionWithArg'
	# 'docker_legacyOrTopLevelCommand'
	# 'docker_legacyOrTopLevelCommand_optionWithArg'
	# 'docker_managementCommand'
	# 'docker_managementCommand_subCommand'
	# 'docker_managementCommand_subCommand_optionWithArg'
	# These managementCommand can be followed by managementCommand (`trust` command)

	if ($wordToComplete) {
		$ceElements = $commandAst.CommandElements[$counter].Elements
		if ($ceElements) {
			# comma-separated args (e.g. `--mount type=bind,src=/c/Users/matt9ucci,dst=/root`)
			foreach ($cee in $ceElements) {
				if (($wordToComplete -eq $cee.Value) -and ($cursorPosition -ge $cee.Extent.StartOffset)) {
					$wordToCompleteSubstring = $wordToComplete.Substring(0, $cursorPosition - $cee.Extent.StartOffset)
				}
			}
			$wordToComplete = $wordToCompleteSubstring
		} else {
			$wordToCompleteSubstring = $wordToComplete.Substring(0, $cursorPosition - $commandAst.CommandElements[$counter].Extent.StartOffset)
		}
	}

	if ($wordToComplete.StartsWith('-')) {
		$completionResult = Invoke-Completer $completerName -Option -ArgumentList $wordToComplete, $commandAst, $cursorPosition
	} else {
		$completionResult = Invoke-Completer $completerName -Completer -ArgumentList $wordToComplete, $commandAst, $cursorPosition, $indexOfFirstArg
	}

	$completionResult | Where-Object CompletionText -Like "$wordToCompleteSubstring*"
}

Register-NativeCommandArgumentCompleter docker $argumentCompleter
