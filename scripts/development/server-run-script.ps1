<#
The purpose of this script is to update and run Enigmatica 4 servers. 
The server needs to be hooked up to the E4 github repository, and use the ATM server start script.
This script should be placed in the root of the modpack instance.
#>

param(
    [PSObject]
    $ClientMods = @("BetterAdvancements", "CosmeticArmorReworked", "EnchantmentDescriptions", "EquipmentTooltips", "FpsReducer", "inventorysorter", "Neat", "overloadedarmorbar", "swingthroughgrass", "theoneprobe", "ToastControl", "toughnessbar", "Xaeros_Minimap", "XaerosWorldMap")
)

git pull

$ModFolder = "$PSScriptRoot\mods"
$AllTheMods = Get-ChildItem $ModFolder -Name -Filter  "*.jar"
$clientMods = $clientMods.toLower()


foreach ($mod in $AllTheMods) {
    $mod = $mod.toLower()
    foreach ($clientMod in $ClientMods) {
        if ($mod.StartsWith($clientMod)) {
            Remove-Item "$modfolder\$mod" -Force
        }
    }
}

     
Start-Process server-start.bat