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

didFinishLaunchingWithOptions add "[[LaunchAdManager shareManager] showAdWithTimeInterval:2.0 imageUrl:@"http://www.lcdushi.com/uploads/allimg/150912/20260451a-0.jpg"];"