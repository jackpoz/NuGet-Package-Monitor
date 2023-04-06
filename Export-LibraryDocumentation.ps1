function Export-LibraryDocumentation {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        $libraryPath,
        $outputFolder
    )

    begin {
    }

    process {
        $libraryName = [System.IO.Path]::GetFileNameWithoutExtension($libraryPath)
        & "$($PWD.Path)\Tools\mddox\mddox.exe" $libraryPath --output "$outputFolder\$libraryName.md"
    }

    end {
    }
}
