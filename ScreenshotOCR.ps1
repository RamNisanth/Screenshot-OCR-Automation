$ScreenshotDirectory = "C:\Users\username\Pictures\Screenshots" 

Add-Content -Path "C:\Scripts\ScreenshotDetector.log" -Value "$(Get-Date): Script executed" -Encoding UTF8


function Monitor-ScreenshotDirectory {
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = $ScreenshotDirectory
    $watcher.Filter = "*.png"
    $watcher.IncludeSubdirectories = $false
    $watcher.EnableRaisingEvents = $true
    # Define the event handler for when a new file is created
    $onCreated = Register-ObjectEvent -InputObject $watcher -EventName "Created" -Action {
        # Get the path of the newly created file
        $path = $Event.SourceEventArgs.FullPath
        # Process the screenshot using Tesseract OCR
        Process-Screenshot $path
    }
}

# Define a function to process the screenshot using Tesseract OCR

function Process-Screenshot {
    param (
        [string] $ImagePath
    )
    # Run Tesseract OCR on the image
    $ExtractedText = & "C:\Program Files\Tesseract-OCR\tesseract.exe" $ImagePath stdout

    # Copy the extracted text to the clipboard
    $ExtractedText | Set-Clipboard
}

# Start monitoring the screenshot directory
Monitor-ScreenshotDirectory
# Keep the script running
while ($true) {
    Start-Sleep -Seconds 2  # Adjust the interval as needed
    Add-Content -Path "C:\Scripts\ScreenshotDetector.log" -Value "$(Get-Date): Script executed" -Encoding UTF8

}
