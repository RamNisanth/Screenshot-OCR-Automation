# Screenshot-OCR-Automation

As the name suggests, the project is an automation of feeding a newly coming screenshot into a particular folder to an image processing machine learning model called Tesseract. 

Initially, I took an already trained OCR(Optical Character Recognition) model called Tesseract and then used this **tesseract.exe** file to extract the text that is in the image file and then copied this extracted text into the clipboard. 

Automation: I have written a PowerShell script(**ScreenshotOCR.ps1**) that will continuously(for every 2 seconds) monitor the gallery folder for new coming screenshots(upon an event) and as soon as a new screenshot comes, it will feed the new screenshot to the tesseract.exe file.

Event: the automation script will become active as soon as we activate a batch file(**StartScreenshotOCR.bat**).

I have made a shortcut for the batch file from the desktop and I can activate the script by double-clicking on the shortcut.
