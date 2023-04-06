function Export-LibraryDocumentation {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        $libraryPath,
        [Parameter(Mandatory=$true)]
        $outputFolder
    )

    begin {
        New-Item -ItemType Directory "$outputFolder" -ErrorAction:SilentlyContinue | Out-Null
    }

    process {
        $libraryName = [System.IO.Path]::GetFileNameWithoutExtension($libraryPath)
        & "$($PWD.Path)\Tools\mddox\mddox.exe" $libraryPath --output "$outputFolder\$libraryName.md"
    }

    end {
    }
}
