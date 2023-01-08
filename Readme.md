<h1 align="center">:zap: Windows P2P File Sharing :zap:</h1>

- - -

### :large_blue_diamond: **PowerShell**
Note: Done By Reading The Documentation And Learning The Command Line Not A Random Guide On The Internet
##

### :small_orange_diamond:**Change System Name**(restart)
```shell
Rename-Computer -NewName "Sys Name" -restart
```

##

### :small_orange_diamond:**Set Network Profile To Private**
```shell
Set-NetConnectionProfile -InterfaceAlias Ethernet -NetworkCategory "Private"
```

##

### :small_orange_diamond:**Set Network IPs**
```shell
Netsh interface ip set address “Ethernet” static "IP Adress" "Net Mask" "Gateway Adress"
```
```shell
Netsh interface ip add dns “Ethernet” "IP Adress"
```

##

### :small_orange_diamond:**Enable Network Discovery On Private Network & Disable on Public**
```shell
Get-NetFirewallProfile -Name Private | Get-NetFirewallRule | ? DisplayGroup -like 'Network Discovery' | Enable-NetFirewallRule
```
```shell
Get-NetFirewallProfile -Name Public | Get-NetFirewallRule | ? DisplayGroup -like 'Network Discovery' | Disable-NetFirewallRule
```
##

### :small_orange_diamond:**Enable File Sharing On Private Network & Disable on Public**
```shell
Get-NetFirewallRule | ? DisplayGroup  -like 'File and Printer Sharing' | ? Profile -like 'Private, Public' | Set-NetFirewallRule -Profile Private
```
```shell
Get-NetFirewallProfile -Name Private | Get-NetFirewallRule | ? DisplayGroup -like 'File and Printer Sharing' | Enable-NetFirewallRule
```
#Qual a diferenca entre File sharing over smbdirect and not
```shell
Get-NetFirewallProfile -Name Public | Get-NetFirewallRule | ? DisplayGroup -like 'File and Printer Sharing' | Disable-NetFirewallRule
```
##

### :small_orange_diamond:**Enable SMBv1?**
```shell
Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
```

##

### :small_orange_diamond:**Create  User**
```shell
net user "User Name" "PassWrd" /add
```

##

### :small_orange_diamond:**Create  User Folder & Set Perms**
```shell
New-Item "Folder path" -ItemType Directory
New-SMBShare –Name “Shared” –Path “C:\Shared” –ContinuouslyAvailable ...

New-SMBShare -Name testy5 -path C:\Users\testy5 -FullAccess P2P1 , P2P3
#This gives the right perms in advenced folder share but not in the normal network share tab
```

- - -

### :large_blue_diamond: **GUI**

##

### :small_orange_diamond:**Set Network To Private**

**Settings -> Network & Internet -> Ethernet -> Network -> Private**

![](gifs/Network_to_Private.gif)

##

### :small_orange_diamond:**Set Network IPs**
**Windows Key + R -> ncpa.cpl & Enter -> Right Click The Network Adapter & Go To Properties -> Properties -> Double Click 'Internet Protocol Version 4(TCP/IPV4)' -> Use The Following IP Adress**

![](gifs/W+R_ncpa.cpl.gif)
![](gifs/Ethernet_Properties.gif)

![](gifs/IPV4_Properties.gif)
![](gifs/IPV4_Properties_2.gif)

##

### :small_orange_diamond:Enable Network Discovery
**File Explorer -> Network -> Click Yellow Prompt -> Turn On Network Discovery And File Sharing**

![](gifs/TurnOn_NetworkShare.gif)

##

*Change Sys Name

*Stop remote auth to specific users

---
