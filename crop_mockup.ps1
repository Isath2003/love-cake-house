Add-Type -AssemblyName System.Drawing

$srcPath = "C:\Users\Ameen Izath\.gemini\antigravity-ide\brain\7b192c43-8565-40c9-8776-a72a093f884a\.user_uploaded\media_1792994725374.jpg"
$img = [System.Drawing.Bitmap]::FromFile($srcPath)

function Crop-Box($cropX, $cropY, $cropW, $cropH, $outFile) {
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

# The shop interior image:
# x from 552, y from 130, w ~ 158, h ~ 128
Crop-Box 552 130 156 126 "c:\Users\Ameen Izath\love_cake_house\assets\images\shop_interior.jpg"

$img.Dispose()
