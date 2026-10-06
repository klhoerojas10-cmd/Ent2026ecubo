<#
.SYNOPSIS
    Descarga todas las fuentes referenciadas en un archivo CSS desde bancasinhorarios.com.ec

.EXAMPLE
    .\Download-Fonts.ps1
#>

param(
    [string]$CssFilePath = ".\fonts.css",
    [string]$BaseUrl     = "https://www.bancasinhorarios.com.ec/BOLI-ebanking/",
    [string]$OutputPath  = ".\fonts-descargadas"
)

# Verificar archivo CSS
if (-not (Test-Path $CssFilePath)) {
    Write-Error "No se encontró el archivo CSS: $CssFilePath"
    exit 1
}

# Asegurar que la URL base termine con /
if (-not $BaseUrl.EndsWith("/")) { $BaseUrl += "/" }

# Ignorar certificados SSL inválidos (útil si el sitio tiene problemas de cert)
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }

# Leer CSS
$cssContent = Get-Content -Path $CssFilePath -Raw

# Regex para capturar url(...) con extensiones de fuente
$fontUrlRegex = 'url\(\s*[''"]?([^''")]+\.(?:eot|woff2|woff|ttf|svg))(?:\?[^''")]*)?[''"]?\s*\)'
$matches = [regex]::Matches($cssContent, $fontUrlRegex, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

$fontPaths = $matches | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique

if ($fontPaths.Count -eq 0) {
    Write-Warning "No se encontraron fuentes en el archivo CSS."
    exit 0
}

Write-Host "Se encontraron $($fontPaths.Count) fuentes únicas." -ForegroundColor Cyan

if (-not (Test-Path $OutputPath)) {
    New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
}

$descargadas = 0
$fallidas    = 0

foreach ($fontPath in $fontPaths) {
    $cleanPath = $fontPath -replace '\?.*$', ''
    $fullUrl   = "$BaseUrl$cleanPath"
    $localFile = Join-Path $OutputPath $cleanPath
    $localDir  = Split-Path $localFile -Parent

    if (-not (Test-Path $localDir)) {
        New-Item -ItemType Directory -Path $localDir -Force | Out-Null
    }

    try {
        Write-Host "Descargando: $fullUrl" -ForegroundColor Yellow
        Invoke-WebRequest -Uri $fullUrl -OutFile $localFile -UseBasicParsing -ErrorAction Stop
        Write-Host "  -> OK: $localFile" -ForegroundColor Green
        $descargadas++
    }
    catch {
        Write-Warning "  -> Error: $fullUrl => $($_.Exception.Message)"
        $fallidas++
    }
}

Write-Host ""
Write-Host "========== RESUMEN ==========" -ForegroundColor Cyan
Write-Host "Descargadas: $descargadas" -ForegroundColor Green
Write-Host "Fallidas:    $fallidas"    -ForegroundColor $(if ($fallidas -gt 0) { "Red" } else { "Green" })
Write-Host "Salida:      $OutputPath"  -ForegroundColor Cyan