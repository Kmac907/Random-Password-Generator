function get-randomStrongPassword {
    [CmdletBinding()]
    [OutputType([string])]
    param(
        [Parameter(Mandatory=$false)][int]$Length = 21
    )
    
    $password = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | Sort-Object {Get-Random})[0..$Length] -join ''
    
    # Save the password to a text file on the user's desktop
    $desktopPath = [Environment]::GetFolderPath('Desktop')
    $filePath = Join-Path -Path $desktopPath -ChildPath 'random_password.txt'
    $password | Out-File -FilePath $filePath -Encoding utf8
    
    # Output the password
    Write-Output $password
}

# Call the function to generate a random strong password and save it to the text file
get-randomStrongPassword
