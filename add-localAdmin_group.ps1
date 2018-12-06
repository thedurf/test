<#

#>

#Collect parameters to use
param(
    [string]$getGroupName, [string]$getOuPath
)

#Validate inputs
if ($getGroupName){
		if ($getGroupName -like '*-Admin') {
		   $SetGroupName = $getGroupName
		} else {
			write-host "Ensure Group name is in correct format  <pcname>-Admin" -Foregroundcolor Red
		}

 } else {
    $SetGroupName = read-host "Enter name of Machine Group to add i.e. pcname>-Admin"
 }
 
if ($getOuPath){
    $SetOuPath = $getOuPath
 } else {
   # $SetOu = read-host "A new password is required" -AsSecureString
   $SetOuPath = "OU=Test Loan Laptop,OU=London,OU=EU,OU=KMG,DC=kobaltmusic,DC=com"
 }
 
 # Make the changes
 try {
 write-host     $SetGroupName " - In ther try phase" $SetOuPath 
	# write-host "Updating password for user: " $Username -foregroundcolor green
	# Invoke-Command -ComputerName rb-sv-w16-dc3 -ScriptBlock { net user $args[0] $args[1]  } -ArgumentList $Username, $SetPassword
	write-host	New-ADGroup -Name $SetGroupName -Path $SetOuPath -Description 'Local Admin Group' -GroupCategory Security -GroupScope DomainLocal -WhatIf
	start-sleep 5
	
	}
catch {
    write-host There are no users with this name $Username. try again -foregroundcolor red
}