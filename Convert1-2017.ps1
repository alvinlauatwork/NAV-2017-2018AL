del "NAV2017\Modified\*"
del "NAV2017\New\*"
del "NAV2017\Original\*"
Export-NAVApplicationObject -DatabaseServer "WIN10-DEV\NAVDEMO" -DatabaseName "Demo Database NAV (10-0)" -Filter 'Type=Page;Id=5050' NAV2017\Original\All.txt | Split-NAVApplicationObjectFile -Destination NAV2017\Original\
Export-NAVApplicationObject -DatabaseServer "WIN10-DEV\NAVDEMO" -DatabaseName "NAV_Snooker_based_10_0_22286" -Filter 'Id=1..49999;Version List=@*Snooker*' NAV2017\Modified\All.txt | Split-NAVApplicationObjectFile -Destination NAV2017\Modified\
# snooker menu id is 1050, should be in the new folder
del "NAV2017\Modified\Men*.txt"
Export-NAVApplicationObject -DatabaseServer "WIN10-DEV\NAVDEMO" -DatabaseName "NAV_Snooker_based_10_0_22286" -Filter 'Id=50000..;Version List=@*Snooker*' NAV2017\New\All.txt | Split-NAVApplicationObjectFile -Destination NAV2017\New\
del "NAV2017\New\All.txt"
Export-NAVApplicationObject -DatabaseServer "WIN10-DEV\NAVDEMO" -DatabaseName "NAV_Snooker_based_10_0_22286" -Filter 'Type=MenuSuite;id=1050..;Version List=@*Snooker*' NAV2017\New\All.txt | Split-NAVApplicationObjectFile -Destination NAV2017\New\
del "NAV2017\Modified\All.txt"
del "NAV2017\New\All.txt"
del "NAV2017\Original\All.txt"