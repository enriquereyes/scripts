#Get all items
Get-ChildItem -Path $directory -Recurse |
#Get only files
Where-Object { !$_.PSIsContainer } |
#Group by extension
Group-Object Extension |
#Get data
Select-Object @{n="Extension";e={$_.Name -replace '^\.'}}, @{n="Size (MB)";e={[math]::Round((($_.Group | Measure-Object Length -Sum).Sum / 1MB), 2)}}, Count
