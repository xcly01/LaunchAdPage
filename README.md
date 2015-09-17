# LaunchAdPage
/*
this project is example when App Launch load Ad to show user
*/

Altogether it'll take two steps

step 1:

LaunchAd file add to your project

step 2:

AppDelegate import  "LaunchAdManager.h"  

step 3:

didFinishLaunchingWithOptions add "[[LaunchAdManager shareManager] showAdWithTimeInterval:2.0 imageUrl:@"loadAdImageUrl"];"