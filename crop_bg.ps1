Add-Type -AssemblyName System.Drawing

$srcPath = "C:\Users\Ameen Izath\.gemini\antigravity-ide\brain\7b192c43-8565-40c9-8776-a72a093f884a\.user_uploaded\media_1792993468531.jpg"
$img = [System.Drawing.Bitmap]::FromFile($srcPath)

function Extract-Crop($cropX, $cropY, $cropW, $cropH, $outFile) {
    $rect = New-Object System.Drawing.Rectangle(0, 0, $cropW, $cropH)
    $srcRect = New-Object System.Drawing.Rectangle($cropX, $cropY, $cropW, $cropH)
    $bmp = New-Object System.Drawing.Bitmap($cropW, $cropH)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.DrawImage($img, $rect, $srcRect, [System.Drawing.GraphicsUnit]::Pixel)
    $bmp.Save($outFile, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $g.Dispose()
    $bmp.Dispose()
    Write-Host "Saved $outFile"
}

# The hero section is from y: 64 to 341.
# Let's extract the entire hero background from x: 0 to 1024, y: 64 to 341 (height 277)
Extract-Crop 0 64 1024 277 "c:\Users\Ameen Izath\love_cake_house\assets\images\ref_hero_bg.jpg"

$img.Dispose()
