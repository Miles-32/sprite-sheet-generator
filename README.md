# Sprite Sheet Builder

A PowerShell script that turns folders of animation frames into horizontal sprite sheets using ImageMagick.

For each sub-folder in `frames`, it stitches the PNGs (in filename order) into one row and saves the sheet under the folder's name. It also prints the frame count for each animation.

```
frames/                     sheets/
├── idle/                   ├── idle.png
│   ├── idle_0000.png       └── walk.png
│   └── ...
└── walk/
    └── ...
```

## Usage

1. Install [ImageMagick 7](https://imagemagick.org/script/download.php#windows)
2. Put your frames in a `frames` folder, with one sub-folder per animation.
3. Save `build_sheets.ps1` next to the `frames` folder.
4. Open a terminal in that folder and run:

```powershell
powershell -ExecutionPolicy Bypass -File build_sheets.ps1
```

Sheets are saved to a `sheets` folder, which is created if it doesn't exist. Re-running overwrites old sheets.

### Do I need to edit anything?

No. The defaults work with the layout above. Use parameters only if your folders are named differently or your frames aren't 512x512:

| Parameter | Default | Meaning |
|---|---|---|
| `-FramesRoot` | `.\frames` | Folder containing one sub-folder per animation |
| `-OutRoot` | `.\sheets` | Where the sheets are saved |
| `-Cell` | `512x512` | Size of one frame in pixels |
