# Split all PDF files in current directory into JPG files inside diretories using ImageMagick convert command
# 01_1.pdf would split into .\01\01_1-xxxx.jpg
# Requires ImageMagick to be installed on the system

ls | %{
    $filename = $_.Name.Split("_")
    $id = $filename[0]
    if(-not(Test-Path $id))
    {
        mkdir $id
    }
    $img = $_.Name.Replace(".pdf", "") 
    convert $_ $id\$img-%04d.jpg
}
