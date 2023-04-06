. "$($PWD.Path)\Get-NugetPackage.ps1"
. "$($PWD.Path)\Export-NugetPackageContent.ps1"
. "$($PWD.Path)\Export-LibraryDocumentation.ps1"
function Invoke-NugetPackageDocumentationGenerator {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        $packageName,
        [Parameter(Mandatory=$true)]
        $dotnetVersions
    )

    begin {
    }

    process {
        Get-NugetPackage $packageName "$($PWD.Path)\NuGet Packages"
        Export-NugetPackageContent "$($PWD.Path)\NuGet Packages\$packageName.nupkg" "$($PWD.Path)\Libraries" $dotnetVersions
        Get-ChildItem "$($PWD.Path)\Libraries" | Export-LibraryDocumentation -outputFolder "$($PWD.Path)\Documentation"
    }

    end {
    }
}
