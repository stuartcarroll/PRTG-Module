
function Format-PrtgXMLResponse
{
	Param(
        [Parameter(Mandatory=$true)]
        [string]$Return, # "result" or "error"
        [string]$Channel,
		[string]$Value,
		[string]$Unit,
		[string]$CustomUnit,
		[string]$SpeedSize,
        [string]$SpeedTime,
        [string]$Mode,
        [string]$Float,
        [string]$DecimalMode,
        [string]$Warning,
        [string]$ShowChart,
        [string]$ShowTable,
        [string]$LimitMaxError,
        [string]$LimitMaxWarning,
        [string]$LimitMinError,
        [string]$LimitMinWarning,
        [string]$LimitErrorMsg,
        [string]$LimitWarningMsg,
        [string]$LimitMode,
        [string]$NotifyChanged,
        [string]$Text
		)

$ReturnXML = @()

if ($Return -eq "Result"){
    $ReturnXML += "<Result>"

    $Command = $MyInvocation.InvocationName
    $Parameters = (Get-Command -Name $Command).Parameters

    foreach ($Parameter in $Parameters.Keys){
        $ParamVal = (Get-Variable $Parameter -ErrorAction SilentlyContinue).Value
        if($ParamVal -and $ParamVal -ne "Result"){
            $ReturnXML += "<"+$Parameter+">"+$ParamVal+"</"+$Parameter+">"
            }
}

    $ReturnXML += "</Result>"
    }
elseif ($Return -eq "Error"){
    $ReturnXML += "<error>2</error>" 
    $ReturnXML += "<text>"+$Text+"</text>"
    }    
else{
    write-host "Set Result parameter to either 'Result' OR 'Error'"
    }

$ReturnXML

}