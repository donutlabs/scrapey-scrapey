# Base URL for the website
$baseURL = "https://yourwordpresswebsite.com"

# REST API endpoint for media library
$mediaAPI = "$baseURL/wp-json/wp/v2/media?per_page=100&page="

# Directory to save the images
$saveDir = "C:\images"

# Create the directory if it doesn't exist
if (!(Test-Path -Path $saveDir)) {
    New-Item -ItemType Directory -Path $saveDir
}

$page = 1
$morePages = $true

while ($morePages) {
    # Get the media items from the REST API
    $response = Invoke-WebRequest -Uri ($mediaAPI + $page) -UseBasicParsing
    $mediaItems = $response.Content | ConvertFrom-Json

    if ($mediaItems.Count -eq 0) {
        $morePages = $false
    }
    else {
        foreach ($item in $mediaItems) {
            $imgURL = $item.source_url
            $fileName = Split-Path -Leaf $imgURL
            $filePath = Join-Path -Path $saveDir -ChildPath $fileName
            
            # Download the image
            Invoke-WebRequest -Uri $imgURL -OutFile $filePath
            
            Write-Output "Downloaded: $filePath"
        }
        
        $page++
    }
}
