# Définir les chemins des images pour différentes plages horaires
$petitMatinImagePath = "C:\Users\le\chemin\a\votre\image.jpg"
$matinImagePath = "C:\Users\le\chemin\a\votre\image.jpg"
$petitJourImagePath = "C:\Users\le\chemin\a\votre\image.jpg"
$jourImagePath = "C:\Users\le\chemin\a\votre\image.jpg"
$petitSoirImagePath = "C:\Users\le\chemin\a\votre\image.jpg"
$soirImagePath = "C:\Users\le\chemin\a\votre\image.jpg"
$petitNuitImagePath = "C:\Users\le\chemin\a\votre\image.jpg"
$nuitImagePath = "C:\Users\le\chemin\a\votre\image.jpg"

# Obtenir l'heure actuelle
$heure = (Get-Date).Hour

# Définir le chemin de l'image en fonction de l'heure
if ($heure -ge 5 -and $heure -lt 7) {
    $imagePath = $petitMatinImagePath
}
elseif ($heure -ge 7 -and $heure -lt 8) {
    $imagePath = $matinImagePath
}
elseif ($heure -ge 8 -and $heure -lt 11) {
    $imagePath = $petitJourImagePath
}
elseif ($heure -ge 11 -and $heure -lt 16) {
    $imagePath = $jourImagePath
}
elseif ($heure -ge 16 -and $heure -lt 18) {
    $imagePath = $petitSoirImagePath
}
elseif ($heure -ge 18 -and $heure -lt 20) {
    $imagePath = $soirImagePath
}
elseif ($heure -ge 20 -and $heure -lt 22) {
    $imagePath = $petitNuitImagePath
}
else {
    $imagePath = $nuitImagePath
}

# Ajouter le type pour l'API Windows
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

# Définir le fond d'écran en utilisant l'API Windows
$SPI_SETDESKWALLPAPER = 0x0014
$UpdateIniFile = 0x01
$SendChange = 0x02

[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 10, $imagePath, $UpdateIniFile -bor $SendChange)