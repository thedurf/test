$names = Get-content "servers_active.txt"

foreach ($name in $names){
  if (Test-Connection -ComputerName $name -Count 1 -ErrorAction SilentlyContinue){
    Write-Host "$name,up" -ForegroundColor Green;
  }
  else{
    Write-Host "$name,down" -ForegroundColor Red;
  }
}