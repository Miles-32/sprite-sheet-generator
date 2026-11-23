param(
    [string]$FramesRoot = ".\frames",
    [string]$OutRoot    = ".\sheets",
    [string]$Cell       = "512x512"
)

New-Item -ItemType Directory -Force -Path $OutRoot | Out-Null #this will create the output directory if it doesn't exist

Get-ChildItem $FramesRoot -Directory | ForEach-Object {
    $animationName = $_.Name
    $files = Get-ChildItem $_.FullName -Filter *.png | Sort-Object Name | ForEach-Object { $_.FullName }

    #breaks early if no files are found
    if ($files.Count -eq 0) {
        Write-Host "No PNG files found in $animationName directory. Skipping."
        return
    }

    #stitches the frames into one horizontal sprite sheet, keeping transparency, and saves it to the output directory of the same name 
    magick montage -background none -tile "$($files.Count)x1" -geometry "$($Cell)+0+0" @files "$OutRoot\$animationName.png"

    Write-Host "$animationName : $($files.Count) frames" #tells user how many frames were processed for each animation
}

Read-Host "Done. Press Enter to close" #shows user the output of script before closing the window