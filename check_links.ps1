$htmlFiles = Get-ChildItem -Path "c:\Users\youss\Desktop\wevsite" -Recurse -Filter "*.html"
$baseDir = "c:\Users\youss\Desktop\wevsite"

$brokenLinks = @()

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $hrefMatches = [regex]::Matches($content, 'href="([^"#]+)(#[^"]+)?"')
    
    foreach ($match in $hrefMatches) {
        $link = $match.Groups[1].Value
        
        # Ignore external links and empty links
        if ($link.StartsWith("http") -or $link.StartsWith("www") -or $link -eq "" -or $link.StartsWith("mailto:") -or $link.StartsWith("tel:")) {
            continue
        }
        
        $fileDir = Split-Path $file.FullName -Parent
        
        # Handle root-relative links (rare in simple static sites, but just in case)
        if ($link.StartsWith("/")) {
            $targetPath = Join-Path $baseDir $link.TrimStart("/")
        }
        else {
            $targetPath = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($fileDir, $link))
        }

        if (-not (Test-Path $targetPath)) {
            $brokenLinks += [PSCustomObject]@{
                SourceFile = $file.FullName
                BrokenLink = $link
            }
        }
    }
}

if ($brokenLinks.Count -gt 0) {
    Write-Host "Found broken links!"
    $brokenLinks | Group-Object BrokenLink | Select-Object Name, Count | Format-Table -AutoSize
}
else {
    Write-Host "No broken local file links found."
}
