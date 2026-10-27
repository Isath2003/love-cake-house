Add-Type -AssemblyName System.Drawing

$srcPath = "C:\Users\Ameen Izath\.gemini\antigravity-ide\brain\7b192c43-8565-40c9-8776-a72a093f884a\.user_uploaded\media_1792993468531.jpg"
$img = [System.Drawing.Bitmap]::FromFile($srcPath)
Write-Host "Real dimensions: $($img.Width) x $($img.Height)"

function Extract-Crop($cropX, $cropY, $cropW, $cropH, $outFile) {
    if ($cropX + $cropW -gt $img.Width) { $cropW = $img.Width - $cropX }
    if ($cropY + $cropH -gt $img.Height) { $cropH = $img.Height - $cropY }
    
    $rect = New-Object System.Drawing.Rectangle(0, 0, $cropW, $cropH)
    $srcRect = New-Object System.Drawing.Rectangle($cropX, $cropY, $cropW, $cropH)
    
    $bmp = New-Object System.Drawing.Bitmap($cropW, $cropH)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.DrawImage($img, $rect, $srcRect, [System.Drawing.GraphicsUnit]::Pixel)
    $bmp.Save($outFile, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $g.Dispose()
    $bmp.Dispose()
    Write-Host "Saved $outFile : $cropW x $cropH"
}

# 1. Hero Strawberry Cream Cake:
# Looking at the 1024x682 image:
# Hero cake starts at x: 540, y: 95, width: 370, height: 250 (just above the feature banner at y: 350)
Extract-Crop 540 95 365 245 "c:\Users\Ameen Izath\love_cake_house\assets\images\ref_hero_cake.jpg"

# 2. Four cakes from Our Popular Cakes
# The 4 cards are at the bottom:
# Let's inspect where they sit:
# Row starts around y: 490 to 610
Extract-Crop 101 490 190 118 "c:\Users\Ameen Izath\love_cake_house\assets\images\ref_cake_chocolate.jpg"
Extract-Crop 313 490 190 118 "c:\Users\Ameen Izath\love_cake_house\assets\images\ref_cake_vanilla.jpg"
Extract-Crop 522 490 190 118 "c:\Users\Ameen Izath\love_cake_house\assets\images\ref_cake_redvelvet.jpg"
Extract-Crop 731 490 190 118 "c:\Users\Ameen Izath\love_cake_house\assets\images\ref_cake_custom.jpg"

$img.Dispose()
