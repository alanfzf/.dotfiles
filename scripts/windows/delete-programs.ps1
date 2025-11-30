$MsCrap = @(
  "Clipchamp.Clipchamp"
  "Microsoft.BingFinance"
  "Microsoft.BingNews"
  "Microsoft.BingSports"
  "Microsoft.BingWeather"
  "Microsoft.GamingApp"
  "Microsoft.GetHelp"
  "Microsoft.MicrosoftOfficeHub"
  "Microsoft.MicrosoftSolitaireCollection"
  "Microsoft.MicrosoftStickyNotes"
  "Microsoft.People"
  "Microsoft.PowerAutomateDesktop"
  "Microsoft.Todos"
  "Microsoft.WindowsAlarms"
  "Microsoft.WindowsFeedbackHub"
  "Microsoft.WindowsMaps"
  "Microsoft.WindowsNotepad"
  "Microsoft.WindowsSoundRecorder"
  "Microsoft.ZuneMusic"
  "Microsoft.ZuneVideo"
  "MicrosoftCorporationII.QuickAssist"
  "MicrosoftTeams"
  "getstarted"
  "microsoft.windowscommunicationsapps"
)

foreach ($package in $MsCrap){
  Get-AppxPackage -AllUsers "*$package*" | Remove-AppxPackage
  Get-AppxProvisionedPackage -Online | Where-Object { $_.PackageName -Like "*$package*"} | ForEach-Object {
    Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName
  }
}
