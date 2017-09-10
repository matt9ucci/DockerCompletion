class NativeCommandCompletionResult : System.Management.Automation.CompletionResult {
	[string]$TextType

	NativeCommandCompletionResult(
		[string]$CompletionText,
		[string]$ListItemText,
		[System.Management.Automation.CompletionResultType]$ResultType,
		[string]$ToolTip,
		[string]$TextType) :
	base($CompletionText, $ListItemText, $ResultType, $ToolTip) {

		$this.TextType = $TextType
	}
}

$nativeCommandCompleters = @{}

function New-CompletionResult {
	Param(
		[Parameter(Mandatory = $true)]
		[string]$CompletionText,
		[string]$TextType,
		[string]$ToolTip = $CompletionText,
		[string]$ListItemText = $CompletionText,
		[System.Management.Automation.CompletionResultType]$ResultType
	)

	if (!$ResultType) {
		if ($CompletionText.StartsWith('-')) {
			$ResultType = [System.Management.Automation.CompletionResultType]::ParameterName
		} elseif ($TextType -like '*Command') {
			$ResultType = [System.Management.Automation.CompletionResultType]::Command
		} else {
			$ResultType = [System.Management.Automation.CompletionResultType]::Text
		}
	}

	New-Object NativeCommandCompletionResult $CompletionText, $ListItemText, $ResultType, $ToolTip, $TextType
}

Set-Alias -Name COMPGEN -Value New-CompletionResult

function Register-Completer {
	Param(
		[Parameter(Mandatory = $true)]
		[string]$Name,
		$Completer,
		[Alias('Option')]
		$Parameter
	)

	if (!$nativeCommandCompleters.ContainsKey($Name)) {
		$nativeCommandCompleters[$Name] = @{}
	}

	if ($Completer) {
		$nativeCommandCompleters[$Name].completer = $Completer
	}
	if ($Parameter) {
		$nativeCommandCompleters[$Name].parameter = $Parameter
	}
}

function Get-Completer {
	Param(
		[Parameter(Mandatory = $true)]
		[string]$Name,
		[Alias('Option')]
		[switch]$Parameter
	)

	if ($Parameter) {
		$nativeCommandCompleters[$Name].parameter
	} else {
		$nativeCommandCompleters[$Name].completer
	}
}

function Invoke-Completer {
	Param(
		[Parameter(Mandatory = $true, Position = 0)]
		[string]$Name,
		[Parameter(Mandatory = $true, ParameterSetName = 'Completer')]
		[switch]$Completer,
		[Parameter(Mandatory = $true, ParameterSetName = 'Parameter')]
		[Alias('Option')]
		[switch]$Parameter,
		[Object[]]$ArgumentList
	)

	$cmpltr = switch ($PSCmdlet.ParameterSetName) {
		Completer { $nativeCommandCompleters[$Name].completer }
		Parameter { $nativeCommandCompleters[$Name].parameter }
	}

	if ($cmpltr -is [scriptblock]) {
		$cmpltr = Invoke-Command -ScriptBlock $cmpltr -ArgumentList $ArgumentList
	}

	foreach ($c in $cmpltr) {
		if ($c -is [NativeCommandCompletionResult]) {
			$c
		} else {
			New-CompletionResult -CompletionText $c -TextType Text -ResultType ([System.Management.Automation.CompletionResultType]::Text)
		}
	}
}

function Register-NativeCommandArgumentCompleter {
	Param(
		[Parameter(Mandatory = $true)]
		[string]$CommandName,
		[Parameter(Mandatory = $true)]
		[scriptblock]$ScriptBlock
	)

	$CommandName, (Get-Alias -Definition $CommandName -ErrorAction SilentlyContinue).Name | ForEach-Object {
		if ($_) {
			Register-ArgumentCompleter -CommandName $_ -ScriptBlock $ScriptBlock -Native
		}
	}
}
