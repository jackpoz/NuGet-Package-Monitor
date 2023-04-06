function Get-NugetPackage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        $packageName,
        [Parameter(Mandatory=$true)]
        $outputFolder,
        [Parameter(Mandatory=$false)]
        $packageVersion
    )

    begin {
        New-Item -ItemType Directory "$outputFolder" -ErrorAction:SilentlyContinue | Out-Null
    }

    process {
        if (![string]::IsNullOrEmpty($packageVersion))
        {
            $packageVersion = "/" + $packageVersion
        }

        Invoke-WebRequest "https://www.nuget.org/api/v2/package/$($packageName)$packageVersion" -OutFile "$outputFolder\$($packageName).nupkg"
    }

    end {
    }
}
