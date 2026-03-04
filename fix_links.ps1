$baseDir = "c:\Users\youss\Desktop\wevsite"

# 1. Update Homepage Anchors
$indexPath = Join-Path $baseDir "index.html"
$indexContent = Get-Content $indexPath -Raw -Encoding UTF8

$indexContent = $indexContent -replace 'href="#section-kitchen"', 'href="kitchen.html"'
$indexContent = $indexContent -replace 'href="#section-home"', 'href="home-outdoor.html"'
$indexContent = $indexContent -replace 'href="#section-garden"', 'href="gardening.html"'
$indexContent = $indexContent -replace 'href="#section-pets"', 'href="pets.html"'

[System.IO.File]::WriteAllText($indexPath, $indexContent, [System.Text.Encoding]::UTF8)
Write-Host "Updated index.html anchors."

# 2. Get the template file to use as a base
$templatePath = Join-Path $baseDir "kitchen\food-prep-gadgets.html"
$templateContent = ""

if (Test-Path $templatePath) {
    $templateContent = Get-Content $templatePath -Raw -Encoding UTF8
    
    $placeholderContent = @"
<!-- MAIN CONTENT TITLE -->
    <header class="page-header">
      <h1 class="page-title">Coming Soon</h1>
      <p class="page-subtitle">We are currently writing the reviews for this category. Check back soon!</p>
    </header>

    <!-- PRODUCT REVIEWS LISTING -->
"@
    
    $templateContent = [regex]::Replace($templateContent, '(?si)<!-- \S+ MAIN CONTENT TITLE \S+ -->(.*?)<!-- \S+ PRODUCT REVIEWS LISTING \S+ -->', $placeholderContent)
    $templateContent = [regex]::Replace($templateContent, '(?si)<article class="review-card">.*?</article>', "")
}
else {
    Write-Host "Could not find template path $templatePath to copy from!"
    exit
}

# 3. Create missing HTML files from broken links
$htmlFiles = Get-ChildItem -Path $baseDir -Recurse -Filter "*.html"
$createdFiles = @{}

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $matches = [regex]::Matches($content, 'href="([^"#]+)(#[^"]+)?"')
    
    foreach ($match in $matches) {
        $link = $match.Groups[1].Value
        
        if (-not $link.EndsWith(".html") -or $link.StartsWith("http") -or $link.StartsWith("www") -or $link.StartsWith("/")) {
            continue
        }
        
        $fileDir = Split-Path $file.FullName -Parent
        $targetPath = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($fileDir, $link))
        
        if (-not (Test-Path $targetPath)) {
            if (-not $createdFiles.ContainsKey($targetPath)) {
                $targetDir = Split-Path $targetPath -Parent
                if (-not (Test-Path $targetDir)) {
                    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
                }
                
                $fileName = [System.IO.Path]::GetFileNameWithoutExtension($targetPath)
                $titleText = (Get-Culture).TextInfo.ToTitleCase($fileName -replace "-", " ")
                
                $newFileContent = [regex]::Replace($templateContent, '(?i)<title>.*?</title>', "<title>Best $titleText - Best Home Gear Reviews</title>")
                $newFileContent = [regex]::Replace($newFileContent, '(?i)<h1 class="page-title">.*?</h1>', "<h1 class=`"page-title`">Best $titleText</h1>")
                
                [System.IO.File]::WriteAllText($targetPath, $newFileContent, [System.Text.Encoding]::UTF8)
                $createdFiles[$targetPath] = $true
                Write-Host "Created placeholder: $targetPath"
            }
        }
    }
}

Write-Host "Created $($createdFiles.Count) placeholder pages."
