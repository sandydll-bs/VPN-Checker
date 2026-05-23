Write-Host -ForegroundColor Magenta "VPN Checker | DS: @imsandy.dll"
Write-Host ""

$vpn = Get-NetIPInterface | Select-Object InterfaceAlias, ConnectionState

foreach ($i in $vpn) {
    $name = $i.InterfaceAlias.PadRight(40)
    if ($i.InterfaceAlias -like "*VPN*") {
        Write-Host "$name [VPN]" -ForegroundColor Red
    }
    elseif ($i.ConnectionState -eq "Connected") {
        Write-Host "$name [CONNESSA]" -ForegroundColor Green
    }
    else {
        Write-Host "$name [DISCONNESSA]" -ForegroundColor Gray
    }
}

$requestJournal = Read-Host "Vuoi vedere se e' stata chiusa una VPN recentemente? (y/n)"

if ($requestJournal -eq "y") {
    Get-WinEvent -FilterHashtable @{
        LogName = "System"
        Id      = 4207
    } -MaxEvents 20 |
    Select-Object TimeCreated, Id
}
else {
    Write-Host -ForegroundColor Magenta "Uscita dallo script..."
}
