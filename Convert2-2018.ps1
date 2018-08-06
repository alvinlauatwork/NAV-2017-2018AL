del NAV2017\Delta\*
del NAV2018\Converted\*
Compare-NAVApplicationObject -OriginalPath "NAV2017\Original\*" -ModifiedPath "NAV2017\Modified\*" -DeltaPath "NAV2017\Delta" -ExportToNewSyntax
&"C:\Program Files (x86)\Microsoft Dynamics NAV\110\RoleTailored Client\Txt2Al.exe" --source="NAV2017\Delta" --target="NAV2018\Converted"
&"C:\Program Files (x86)\Microsoft Dynamics NAV\110\RoleTailored Client\Txt2Al.exe" --source="NAV2017\New" --target="NAV2018\Converted"
