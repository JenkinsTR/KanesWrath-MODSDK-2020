$xml1 = [xml](Get-Content "$PSScriptRoot\map.xml")
# find the node you want to extract
$node = $xml1.AssetDeclaration.GameMap.MapMetaData

$xml2 = New-Object System.Xml.XmlDocument
$newNode = $xml2.ImportNode($node, $true)
$xml2.AppendChild($newNode)
$xml2.Save("$PSScriptRoot\MapMetaData.xml")