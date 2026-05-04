$mdPath = "C:\Users\Marcos\.gemini\antigravity\brain\49587be9-f550-4b7d-88b7-63b55d81454f\artifacts\ETEC_Revisao_Intensiva_2026_COMPLETA.md"
$htmlPath = "c:\projetos-marcos\ETEC_Revisao_2026\index.html"

$md = Get-Content $mdPath -Raw -Encoding UTF8
# Escape for JS string
$md = $md.Replace('\', '\\')
$md = $md.Replace('`', '\`')
$md = $md.Replace('$', '\$')
$md = $md -replace "`r`n", "\n"
$md = $md -replace "`n", "\n"

$html = Get-Content $htmlPath -Raw -Encoding UTF8
$html = $html.Replace('MARKDOWN_PLACEHOLDER', $md)
Set-Content $htmlPath $html -Encoding UTF8

Write-Host "OK - Markdown injetado no HTML. Arquivo: $htmlPath"
