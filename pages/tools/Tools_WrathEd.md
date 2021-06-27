---
title: WrathEd
tags: [tools]
keywords: 
last_updated: June 16, 2021
summary: "WrathEd (Wrath Editor) "
sidebar: KWSDK_sidebar
permalink: Tools_WrathEd.html
folder: Tools
---

Creating a Mod with WrathEd was made to be as close as possible to the Tiberium Wars SDKs made by EA.

## Requirements

### .NET Framework 4
The .NET Framework 4.0 is required to run WrathEd.

.NET 4.0 support ended for all operating systems on Jan 12 2016.

For the latest, and final version of .NET (4.8), download [from Microsoft here](http://go.microsoft.com/fwlink/?LinkId=2085155).

## Download

For the latest version of WrathEd, you can [download it from Github here](https://github.com/Qibbi/WrathEd2012/releases).

![WrathEd on Github](images/wrathed_gh.png)

Download the `Debug.7z` archive and extract it using 7zip or WinRAR.

## Usage

WrathEd was designed to be used in both GUI mode, and in command-line mode.

At the time of writing, WrathEd supports 4 different Command & Conquer games:
 - Command & Conquer 3: Tiberium Wars
 - Command & Conquer 3: Kane's Wrath
 - Command & Conquer: Red Alert 3
 - Command & Conquer 4: Tiberium Twilight

### GUI

There are 3 different options when using the GUI version of WrathEd:
 - Opening a `manifest` file
 - Opening a `BIG` file
 - Opening a `SkuDef` file

### Command Line

WrathEd can be used in a similar way to Tiberium Wars SDK's `BinaryAssetBuilder` tool. It supports similar command line parameters and functions.

Command Line parameters:
<table>
<colgroup>
<col width="30%" />
<col width="70%" />
</colgroup>
<thead>
<tr class="header">
<th>Parameter</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td markdown="span">`-gameDefinition`</td>
<td markdown="span">Game Definition.</td>
</tr>
<tr>
<td markdown="span">`-bigView`</td>
<td markdown="span">BIG View</td>
</tr>
<tr>
<td markdown="span">`-compile`</td>
<td markdown="span">Compile</td>
</tr>
<tr>
<td markdown="span">`-root`</td>
<td markdown="span">Root</td>
</tr>
<tr>
<td markdown="span">`-art`</td>
<td markdown="span">Art</td>
</tr>
<tr>
<td markdown="span">`-audio`</td>
<td markdown="span">Audio</td>
</tr>
<tr>
<td markdown="span">`-data`</td>
<td markdown="span">Data</td>
</tr>
<tr>
<td markdown="span">`-basePatchStream`</td>
<td markdown="span">Base Patch Stream</td>
</tr>
<tr>
<td markdown="span">`-bps`</td>
<td markdown="span">See above</td>
</tr>
<tr>
<td markdown="span">`-map`</td>
<td markdown="span">Map</td>
</tr>
<tr>
<td markdown="span">`-terrain`</td>
<td markdown="span">Terrain</td>
</tr>
<tr>
<td markdown="span">`-out`</td>
<td markdown="span">Output</td>
</tr>
<tr>
<td markdown="span">`-version`</td>
<td markdown="span">Version</td>
</tr>
<tr>
<td markdown="span">`-lowLOD`</td>
<td markdown="span">Low LOD (Level of detail)</td>
</tr>
<tr>
<td markdown="span">`-mediumLOD`</td>
<td markdown="span">Medium LOD (Level of detail)</td>
</tr>
</tbody>
</table>

#### Some examples of WrathEd CLI usage:

Compile a map with WrathEd:
```bat
wrathed.exe -gameDefinition:"Kane's Wrath" -compile:"Documents\Command & Conquer 3 Kane's Wrath\Maps\MY_COOL_MAP\map.xml" -map -terrain:"Game Files\Art\Terrain" -art:"Art" -audio:"Audio" -data:"Data" -out:"MyMod\Maps\MY_COOL_MAP" -version:""
```

### Extracting Game data using WrathEd

WrathEd can be used to extract `BIG` archives used in most Command & Conquer series games.

File > Open Big... > Navigate to the `BIG` file you would like to extract > then use Export (menu) > Export All... and choose an empty folder to extract all of the `BIG` contents.

### Advanced extraction of all BIG files within a game

See [BIG Editors](Tools_BIG_Editors.html) page for more advanced `BIG` extraction options.

{% include links.html %}