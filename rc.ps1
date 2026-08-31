function p { C:\Users\danie\danielxhogan\ffmpeg\bin\ffprobe.exe -hide_banner $args[0] }
function fp { C:\Users\danie\danielxhogan\ffmpeg\bin\ffprobe.exe -hide_banner -show_format -show_streams $args[0] }
function m { C:\Users\danie\danielxhogan\mpv\mpv.exe --profile=watch $args[0] }
function mi { C:\Users\danie\danielxhogan\mpv\mpv.exe --profile=inspect $args[0] }
function mo { C:\Users\danie\danielxhogan\mpv\mpv.exe --profile=inspect-playlist $args[0] }
function mq { C:\Users\danie\danielxhogan\mpv\mpv.exe --profile=inspect-quality $args[0] }
function mf { C:\Users\danie\danielxhogan\mpv\mpv.exe --profile=inspect-fs $args[0] }
function e { code $args[0] }
function pkg-config { C:\Users\danie\danielxhogan\vcpkg\installed\x64-windows\tools\pkgconf\pkgconf.exe $args[0] $args[1] $args[2] }
function vcpkg { C:\Users\danie\danielxhogan\vcpkg\vcpkg.exe $args[0] $args[1] }

$env:VCPKG_ROOT = "C:\Users\danie\danielxhogan\vcpkg"
$env:PKG_CONFIG_PATH = "$env:VCPKG_ROOT\installed\x64-windows\lib\pkgconfig"

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
