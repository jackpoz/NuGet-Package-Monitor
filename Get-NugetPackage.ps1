function Get-NugetPackage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        $packageName,
        [Parameter(Mandatory=$true)]
        $outputFolder
    )

    begin {
        New-Item -ItemType Directory "$outputFolder" -ErrorAction:SilentlyContinue | Out-Null
    }

    process {
        Invoke-WebRequest "https://www.nuget.org/api/v2/package/$($packageName)" -OutFile "$outputFolder\$($packageName).nupkg"
    }

    end {
    }
}
