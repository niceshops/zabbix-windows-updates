# Zabbix - Windows Update Monitoring

* Items
  * windows.update[installed] - Get list of installed Updates
  * windows.update[lastSearch] - Unix timestamp of last Update-Search
  * windows.update[last] - Unix timestamp of last Update
  * windows.update[pending] - Check if there are pending Updates (Admin Privileges needed - not recommended)

* Triggers
  * Needs Updates - Notify if last Update was installed earlier than N days ago


## Install

1. Import the YAML Template into your Zabbix Server
2. Add the Userparameter
3. Add the Script

## Test

```bash
PS C:\Program Files\Zabbix\script> .\windows_updates.ps1 last
1707896495

PS C:\Program Files\Zabbix\script> .\windows_updates.ps1 lastDate
2024-02-14 07:41:35
```
