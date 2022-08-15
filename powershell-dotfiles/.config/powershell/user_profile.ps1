# Prompt
#  install oh-my-posh from official docs
# Install-Module posh-git -Scope CurrentUser -Force -AllowClobber
Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\jbw.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# Terminal Icons
# Install-Module Terminal-Icons -Repository PSGallery -Force -AllowClobber
Import-Module -Name Terminal-Icons

# PSReadLine
# Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History

# Fuzzy finder
#  1. Install-Module -Name PSFzf -Scope CurrentUser -Force
#  2. scoop install fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
# Set-Alias -Name vim -Value nvim
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias ll ls

# Git
Set-Alias g git
function gst { & git status -sb $args }
function glog { & git log --graph --oneline --decorate $args }
function gco { & git checkout $args }
function grt { & git reset --hard $args }
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
