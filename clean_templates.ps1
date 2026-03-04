$htmlFiles = Get-ChildItem -Path "c:\Users\youss\Desktop\wevsite" -Recurse -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Replace href="[[...]]" with href="#"
    $newContent = [regex]::Replace($content, 'href="\[\[[^\]]+\]\]"', 'href="#"')
    
    # Replace pure text instances of [[...]] with empty string or a generic text
    $newContent = [regex]::Replace($newContent, '>\[\[CATEGORY_SLUG\]\]<', '><')
    $newContent = [regex]::Replace($newContent, '\[\[ARTICLE_FILENAME\]\]', 'article')
    $newContent = [regex]::Replace($newContent, '/\[\[BEST_PICKS_URL\]\]', '#')
    
    if ($content -ne $newContent) {
        [System.IO.File]::WriteAllText($file.FullName, $newContent, [System.Text.Encoding]::UTF8)
        Write-Host "Cleaned templates in $($file.Name)"
    }
}

Write-Host "Template cleanup complete."
