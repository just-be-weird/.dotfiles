# Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Paradox
$omp_config = Join-Path $PSScriptRoot ".\jbw.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# Terminal Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fuzzy finder
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias ll ls

# Git
Set-Alias g git
function gst { & git status -sb $args }
function glog { & git log --graph --oneline --decorate $args }
function gpl { & git pull $args }
function gbr { & git branch $args }
function gf { & git fetch $args }

function Get-GitPush { & git push $args }
New-Alias -Name gps -Value Get-GitPush -Force -Option AllScope

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# set PowerShell to UTF-8
# [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding