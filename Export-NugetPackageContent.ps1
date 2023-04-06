function Export-NugetPackageContent {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        $packagePath,
        [Parameter(Mandatory=$true)]
        $outputFolder,
        [Parameter(Mandatory=$true)]
        $dotnetVersions
    )

    begin {
        New-Item -ItemType Directory "$outputFolder" -ErrorAction:SilentlyContinue | Out-Null
    }

    process {
        Remove-Item "$outputFolder\tmp" -ErrorAction:SilentlyContinue -Recurse
        Expand-Archive $packagePath "$outputFolder\tmp"
        foreach($version in $dotnetVersions)
        {
            if (Test-Path "$outputFolder\tmp\lib\$version")
            {
                Copy-Item "$outputFolder\tmp\lib\$version\*" "$outputFolder"
                Remove-Item "$outputFolder\tmp" -ErrorAction:SilentlyContinue -Recurse
                return
            }
        }

        throw "No matching version found"
    }

    end {
    }
}
