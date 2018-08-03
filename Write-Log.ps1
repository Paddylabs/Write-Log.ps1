function Write-Log {
    <#
        .SYNOPSIS
            Allows basic logging for PS Scripts
        .EXAMPLE
            Write-Log -Message "Message here" -Severity informational
    #>

    [CmdletBinding()]
    param(
        # Severity of the information you wish to log
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('Information', 'Warning', 'Error')]
        [String]$Severity = 'Information',

        # The information you wish to log
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [String]$Message

    )

    $LogFile = Join-Path $PSScriptRoot "LogFile.csv"

    [pscustomobject]@{
        Time     = (Get-Date -Format g)
        Severity = $Severity
        Message  = $Message

    } | Export-Csv $LogFile -Append -NoTypeInformation
    
}
