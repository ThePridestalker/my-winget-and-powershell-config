# starship - ☄🌌️ The minimal, blazing-fast, and infinitely customizable prompt for any shell!
Invoke-Expression (&starship init powershell)

# zoxide - A smarter cd command. Supports all major shells.
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# fnm - 🚀 Fast and simple Node.js version manager, built in Rust
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

# A PowerShell wrapper around the fuzzy finder fzf
# ALT + C => fuzzy search folders
# CONTROL + R => fuzzy search history
# CONTROL + T => fuzzy search everything
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Change cat for bat
Remove-Item -Path Alias:\cat -ErrorAction SilentlyContinue
Set-Alias -Name cat -Value bat.exe

# Change ls for eza and also adds ll command
Remove-Item -Path Alias:\ls -ErrorAction SilentlyContinue
function ls { eza -F --icons $args }
function ll { eza -F -l -a -h -O --icons --git --git-repos-no-status --time-style='+%d/%m/%Y %H:%M' $args }

# Adding some fzf and fzf with ripgrep
function ff { fzf --preview 'bat --color=always {}' --preview-window '~3' }

function frg {
	param(
        [Parameter(Mandatory=$true)]
        [string]$SearchString
    )
	Invoke-PsFzfRipgrep -SearchString $SearchString
}
