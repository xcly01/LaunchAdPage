# LaunchAdPage
/*
this project is example when App Launch load Ad to show user
*/

Altogether it'll take three steps

step 1:

LaunchAd file add to your project

step 2:

AppDelegate import  "LaunchAdManager.h"  

step 3:

didFinishLaunchingWithOptions add "[[LaunchAdManager shareManager] showAdWithTimeInterval:showTime imageUrl:@"loadAdImageUrl"];"