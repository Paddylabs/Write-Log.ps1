Function Write-Log {
    [CmdletBinding()]
    param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [String]$Message,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('Information','Warning','Error')]
        [String]$Severity = 'Information'
    
    )

    [pscustomobject]@{
        Time = (Get-Date -Format g)
        Message = $Message
        Severity = $Severity

    
    
    } | Export-Csv -Path ".\LogFile.csv" -Append -NoTypeInformation
}
