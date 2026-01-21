# Get all logo names
$allLogos = fastfetch --list-logos

# Common OS/distro keywords to filter out
$osKeywords = @(
    "windows", "linux", "ubuntu", "debian", "arch", "fedora", "centos", 
    "mint", "manjaro", "opensuse", "gentoo", "kali", "parrot", "alpine",
    "void", "slackware", "redhat", "rocky", "alma", "oracle", "freebsd",
    "openbsd", "netbsd", "macos", "android", "chrome", "endeavour", "garuda",
    "pop", "zorin", "elementary", "solus", "nixos", "guix", "artix", "devuan",
    "mx", "peppermint", "bodhi", "antergos", "deepin", "kylin", "raspbian",
    "armbian", "suse", "mageia", "pclinux", "sabayon", "calcalc", "scientific",
    "spring", "clear", "photon", "coreos", "flatcar", "rancher", "talos",
    "exodia", "retro", "aoscos"
)

# Filter out OS logos
$filteredLogos = $allLogos | Where-Object {
    $logo = $_.ToLower()
    $isOS = $false
    foreach ($keyword in $osKeywords) {
        if ($logo -match $keyword) {
            $isOS = $true
            break
        }
    }
    -not $isOS
}

# Save filtered logo names
$filteredLogos | Out-File -FilePath "logo-names.txt" -Encoding UTF8

Write-Host "Filtered logo names saved to logo-names.txt"
Write-Host "Total logos: $($allLogos.Count)"
Write-Host "Non-OS logos: $($filteredLogos.Count)"
Write-Host ""
Write-Host "Now printing filtered logos to logos.txt..."

# Clear the output file if it exists
if (Test-Path "logos.txt") {
    Remove-Item "logos.txt"
}

# Print each filtered logo to file
$count = 0
foreach ($logoLine in $filteredLogos) {
    $logoName = $logoLine.Trim()
    if ($logoName -ne "") {
        # Split by space and take only the first part (the actual logo name)
        $actualLogoName = ($logoName -split '\s+')[0]
        
        try {
            $count++
            Write-Host "Processing $count/$($filteredLogos.Count): $actualLogoName"
            fastfetch --logo $actualLogoName 2>&1 | Out-File -FilePath "logos.txt" -Append -Encoding UTF8
            "`n`n" | Out-File -FilePath "logos.txt" -Append -Encoding UTF8
        } catch {
            Write-Host "Skipping $actualLogoName - error occurred"
        }
    }
}

Write-Host "Done! Logos saved to logos.txt"
