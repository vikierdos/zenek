$ErrorActionPreference = 'Stop'

$tracks = @(
    @{ File = 'espresso'; Term = 'Sabrina Carpenter Espresso'; Artist = 'Sabrina Carpenter'; Track = 'Espresso' },
    @{ File = 'birds_of_a_feather'; Term = 'Billie Eilish Birds of a Feather'; Artist = 'Billie Eilish'; Track = 'BIRDS OF A FEATHER' },
    @{ File = 'good_luck_babe'; Term = 'Chappell Roan Good Luck Babe'; Artist = 'Chappell Roan'; Track = 'Good Luck, Babe!' },
    @{ File = 'beautiful_things'; Term = 'Benson Boone Beautiful Things'; Artist = 'Benson Boone'; Track = 'Beautiful Things' },
    @{ File = 'too_sweet'; Term = 'Hozier Too Sweet'; Artist = 'Hozier'; Track = 'Too Sweet' },
    @{ File = 'i_had_some_help'; Term = 'Post Malone I Had Some Help'; Artist = 'Post Malone'; Track = 'I Had Some Help (Feat. Morgan Wallen)' },
    @{ File = 'fortnight'; Term = 'Taylor Swift Fortnight'; Artist = 'Taylor Swift'; Track = 'Fortnight (feat. Post Malone)' },
    @{ File = 'lose_control'; Term = 'Teddy Swims Lose Control'; Artist = 'Teddy Swims'; Track = 'Lose Control' },
    @{ File = 'a_bar_song'; Term = 'Shaboozey A Bar Song Tipsy'; Artist = 'Shaboozey'; Track = 'A Bar Song (Tipsy)' },
    @{ File = 'please_please_please'; Term = 'Sabrina Carpenter Please Please Please'; Artist = 'Sabrina Carpenter'; Track = 'Please Please Please' }
)

Add-Type -AssemblyName System.Drawing
$coverDirectory = Join-Path $PSScriptRoot '..\\public\\kepek'

foreach ($item in $tracks) {
    $query = [uri]::EscapeDataString($item.Term)
    $response = Invoke-RestMethod -Uri "https://itunes.apple.com/search?term=$query&entity=song&country=us&limit=25"
    $match = $response.results | Where-Object { $_.artistName -eq $item.Artist -and $_.trackName -eq $item.Track } | Select-Object -First 1
    if (-not $match) { throw "No exact match found for $($item.Artist) - $($item.Track)" }

    $imageUrl = $match.artworkUrl100 -replace '100x100bb', '600x600bb'
    $temporaryJpeg = Join-Path $env:TEMP "$($item.File).jpg"
    $pngFile = Join-Path $coverDirectory "$($item.File).png"
    Invoke-WebRequest -Uri $imageUrl -OutFile $temporaryJpeg
    $image = [System.Drawing.Image]::FromFile($temporaryJpeg)
    try { $image.Save($pngFile, [System.Drawing.Imaging.ImageFormat]::Png) }
    finally { $image.Dispose(); Remove-Item -LiteralPath $temporaryJpeg }
    Write-Output "$($item.File).png"
}
