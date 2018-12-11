<#
.SYNOPSIS
Script to get local admin password for a PC. Must be run with elevated permissions.

.DESCRIPTION
08/02/2018 get-LapsPasswords.psl

.PARAMETER computerNameAccepts 
Pass the name of the PC to Local Administrator Password

.EXAMPLE
get-LapsPasswords.psl <HostName>

.NOTES
Needs to be to with elevated permissions,  Administrator data can be collected from Active Directory.

.LINK
Needs to be updated at some point.
#>

param(
    [string]$GetHost
)

[void](Read-Host "Press Enter to continue…....")

if ($getHost) {
    $HostnameName = $GetHost
    
}
else {
    $HostnameName = Read-Host "Enter PC Name"
}

if ($HostnameName) {
    Get-ADComputer -Identity $HostnameName -Properties *  , ms-Mcs-AdmPwd, ms-Mcs-AdmPwdExpirationTime | Select-Object cn , ms-Mcs-AdmPwd , @{n = 'ms-Mcs-AdmPwdExpirationTime'; e = {[DateTime]::FromFileTime($_.'ms-Mcs-AdmPwdExpirationTime')}}
}
else { 
    write-host "You must enter a Hostname"  -ForegroundColor Red -BackgroundColor White
}