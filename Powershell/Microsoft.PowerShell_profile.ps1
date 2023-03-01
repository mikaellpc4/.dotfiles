oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\catppuccin_frappe.omp.json" | Invoke-Expression
Import-Module posh-git
Import-Module Terminal-Icons
Import-Module syntax-highlighting

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

$p = "D:/Projetos"
$nvim = "$env:LOCALAPPDATA/nvim"
$hyper = "$env:APPDATA/Hyper/.hyper.js"
cls
