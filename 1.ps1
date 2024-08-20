# Maximum allowed file name length
$maxLength = 5

# Get the list of files being committed
$files = git diff --cached --name-only

foreach ($file in $files) {
    $filename = [System.IO.Path]::GetFileName($file)
    $length = $filename.Length

    if ($length -gt $maxLength) {
        Write-Host "Error: The file '$filename' has $length characters, which exceeds the maximum allowed length of $maxLength characters."
        exit 1
    }
}

# If all files are okay, exit successfully
exit 0
