$check = $args[0]

if ($check -eq "pending") {
	$UpdateSession = New-Object -ComObject Microsoft.Update.Session
	$UpdateSearcher = $UpdateSession.CreateupdateSearcher()
	$UpdateSearcher.Search('IsHidden=0 and IsInstalled=0').Updates | Select-Object -expandproperty Title
} elseif ($check -eq "lastDate") {
	write-output ((New-Object -ComObject Microsoft.Update.AutoUpdate).Results | Select-object -expandproperty LastInstallationSuccessDate).ToString("yyyy-MM-dd HH:mm:ss")
} elseif ($check -eq "last") {
	$InstallTime = (New-Object -ComObject Microsoft.Update.AutoUpdate).Results | Select-object -expandproperty LastInstallationSuccessDate
	write-output ([System.Math]::Truncate((Get-Date -Date $InstallTime -UFormat %s)))
} elseif ($check -eq "lastSearchDate") {
	write-output ((New-Object -ComObject Microsoft.Update.AutoUpdate).Results | Select-object -expandproperty LastSearchSuccessDate).ToString("yyyy-MM-dd HH:mm:ss")
} elseif ($check -eq "lastSearch") {
	$SearchTime = (New-Object -ComObject Microsoft.Update.AutoUpdate).Results | Select-object -expandproperty LastSearchSuccessDate
	write-output ([System.Math]::Truncate((Get-Date -Date $SearchTime -UFormat %s)))
} elseif ($check -eq "installed") {
	get-hotfix | Sort-Object -Descending -Property InstalledOn -ErrorAction SilentlyContinue | Select-object -Property InstalledOn,InstalledBy,Description,HotFixID
} else {
	echo "UNSUPPORTED CHECK"
	exit 1
}
