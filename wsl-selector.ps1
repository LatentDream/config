# Function to draw the menu
function Draw-Menu {
    param (
        [int]$SelectedIndex
    )
    
    $host.UI.RawUI.CursorPosition = @{X=0; Y=0}
    $width = $host.UI.RawUI.WindowSize.Width
    $height = $host.UI.RawUI.WindowSize.Height
    
    # Clear the screen
    Clear-Host
    
    # Cool ASCII art title
    $title = @"
    _,--._.-,
   /\_r-,\_ )
.-.) _;='_/ (.;
 \ \'     \/S )
  L.'-. _.'|-'
 <_`-'\'_.'/
   `'-._( \
    ___   \\,      ___
    \ .'-. \\   .-'_. /
     '._' '.\\/.-'_.'
        '--``\('--'
              \\
              `\\,
                \|
"@

    # Calculate vertical positioning
    $options = @("Ubuntu - Perso", "Debian - Work")
    $titleLines = ($title -split "`n").Count
    $totalContentHeight = $titleLines + 3 + $options.Count * 2  # Title + spacing + options
    $topPadding = [math]::Max(0, ($height - $totalContentHeight) / 2)
    
    # Draw top padding
    Write-Host ("`n" * $topPadding)
    
    # Draw title
    $titleLines = $title -split "`n"
    foreach ($line in $titleLines) {
        $linePadding = " " * (($width - $line.TrimStart().Length) / 2)
        Write-Host "$linePadding$($line.TrimStart())" -ForegroundColor Cyan
    }
    Write-Host "`n"
    
    # Draw option
    $maxLength = ($options | Measure-Object -Property Length -Maximum).Maximum
    for ($i = 0; $i -lt $options.Count; $i++) {
        $option = $options[$i]
        $paddingLength = [math]::Floor(($width - $maxLength - 4) / 2)  # -4 to account for "> " and "  "
        $leftPadding = " " * $paddingLength
        $rightPadding = " " * ($width - $paddingLength - $maxLength - 4)
        
        if ($i -eq $SelectedIndex) {
            Write-Host $leftPadding -NoNewline
            Write-Host ">" -NoNewline -ForegroundColor Cyan
            Write-Host " $option".PadRight($maxLength + 1) -NoNewline -ForegroundColor Cyan
            Write-Host $rightPadding
        } else {
            Write-Host "$leftPadding  $($option.PadRight($maxLength))$rightPadding" -ForegroundColor DarkGray
        }
        Write-Host ""
    }
    
    # Draw instructions at the bottom
    $instructions = "Use arrow keys or hjkl to navigate, Enter to select, q to quit"
    $instructionsPadding = " " * (($width - $instructions.Length) / 2)
    $bottomPadding = $height - $host.UI.RawUI.CursorPosition.Y - 2
    if ($bottomPadding -gt 0) {
        Write-Host ("`n" * $bottomPadding)
    }
    Write-Host "$instructionsPadding$instructions" -ForegroundColor DarkGray
}

# Main script
$SelectedIndex = 0
$running = $true

while ($running) {
    Draw-Menu -SelectedIndex $SelectedIndex
    
    $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    
    switch ($key.VirtualKeyCode) {
        38 { $SelectedIndex = [Math]::Max(0, $SelectedIndex - 1) } # Up arrow
        40 { $SelectedIndex = [Math]::Min(1, $SelectedIndex + 1) } # Down arrow
        72 { $SelectedIndex = [Math]::Max(0, $SelectedIndex - 1) } # h
        74 { $SelectedIndex = [Math]::Min(1, $SelectedIndex + 1) } # j
        75 { $SelectedIndex = [Math]::Max(0, $SelectedIndex - 1) } # k
        76 { $SelectedIndex = [Math]::Min(1, $SelectedIndex + 1) } # l
        81 { $running = $false } # q to quit
        13 { # Enter
            switch ($SelectedIndex) {
                0 { wsl -d Ubuntu -- bash -c "cd ~ && clear && bash" }
                1 { wsl -d Debian -- bash -c "cd ~ && clear && bash" }
            }
            $running = $false
        }
    }
}

# Clear the console after selection or quitting
Clear-Host
