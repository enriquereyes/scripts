$asg = "", "", ""
$exp = "", "", ""

for ($i = 0; $i -le $exp.Length; $i++)
{
    $f = $asg[$i]
    $path = "I:\$f"
    if (test-path -Path $path)
    {
        get-childitem $path -recurse | where {$_.name -eq $exp[$i]} | % {
             Write-Host $_.FullName
        }   
    }
    else
    {
        $path = "I:\"
        get-childitem $path -recurse | where {$_.name -eq $exp[$i]} | % {
             Write-Host $_.FullName
        } 
    }
}
