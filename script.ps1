function Show-Menu {
    param (
        [string]$Title = 'Windows 10 P2P'
    )
    Clear-Host
    Write-Host ""
    Write-Host "================ $Title ================"
    Write-Host ""

    Write-Host "1: Press '1' to change computer name (restart)"
    Write-Host "2: Press '2' to configure static ip and dns"
    Write-Host "3: Press '3' to enable File Sharing & Net. Discovery"
    Write-Host "3: Press '3' to create user"
    Write-Host "4: Press '4' to create share"
    Write-Host "Q: Press 'Q' to quit."

    Write-Host ""
}

do {

  Show-Menu
  $selection = Read-Host "Choose"
  switch ($selection)
  {
  '1' {
    Write-Host ""
    $sysname = Read-Host "Rename Computer to"
    Rename-Computer -NewName "$sysname" -restart
  } '2' {
    do {
      Clear-Host
      Write-Host ""
      Write-Host "================ IP configuration ================"
      Write-Host ""
      $localIpAddress=((ipconfig | findstr [0-9].\.)[0]).Split()[-1]
      $sysip = Read-Host "System IP ($localIpAddress)"
      $symask = Read-Host "System mask (255.255.255.0)"
      $sysgateway = Read-Host "System gateway"
      $sysdns = Read-Host "System dns"
      Write-Host ""
      Write-Host "=========================="
      Write-Host "IP      - $sysip"
      Write-Host "=========================="
      Write-Host "Mask    - $symask"
      Write-Host "=========================="
      Write-Host "Gateway - $sysgateway"
      Write-Host "=========================="
      Write-Host "DNS     - $sysdns"
      Write-Host "=========================="
      Write-Host "Alt DNS - 1.1.1.1"
      Write-Host "=========================="
      Write-Host ""
      $confirm1 = Read-Host "Confirm y/n"
    } until ($confirm1 -eq 'y')
    Netsh interface ip set address “Ethernet” static "$sysip" "$symask" "$sysgateway"
    Netsh interface ip add dns “Ethernet” "$sysdns"
    Netsh interface ip add dns “Ethernet” 1.1.1.1 index=2
  } '3' {

  }

  }

} until ($selection -eq 'q')
