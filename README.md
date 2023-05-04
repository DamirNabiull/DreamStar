# DreamStar

# 1.0.1 - [APK](https://github.com/DamirNabiull/DreamStar/blob/main/app-release.apk)

## Description
Kids to do list.

Applications for teaching children financial literacy, self-organization, and goal setting. The bottom line is that the child creates a dream. The parent assigns a price to this dream in local currency. The parent also creates tasks for which the child receives currency. This currency can be accumulated and later spent on buying dreams.

## Functionality
1) One feature on the main screen is almost completed 
    - parent can approve tasks and track progress (Parent side)
    - child can complete tasks and submit tasks for verification (Child side)

2) One more screen exists except main screen
    - welcome screen
    - parent can create tasks (seperate screen on Parent side)

3) Application is already reasonable in some way
    - application can be used like ToDo list app

4) Missing network situation is handled
    - when the Internet connection is lost, a screen with a loading indicator appears
    - when the Internet connection appears, the application continues to work in normal mode
    - you can create a task without an Internet connection, it will be cached, and when the Internet appears, it will send to the database

5) Github actions:
    - formatting
    - lint
    - testing
    - build for android

## Code
1) Any networking - Firebase
2) UI files separated from logic files (use Riverpod)

## Advanced
1) Builds successfully for iOS
2) Three screens with some reasonable content
3) Two EditText for text input (task creation screen)
4) Custom theme is applied in Material App
5) Localization
6) Custom app icon
7) Builds successfully for Web
8) Unhandled exceptions handling with Crashlytics
9) Used Riverpod

# Screenshots
<p>
  <img src="./screens/1.png" width="300" />
  <img src="./screens/2.png" width="300" /> 
  <img src="./screens/3.png" width="300" /> 
  <img src="./screens/4.png" width="300" />
  <img src="./screens/5.png" width="300" />
  <img src="./screens/6.png" width="300" />
  <img src="./screens/7.png" width="300" /> 
  <img src="./screens/8.png" width="300" /> 
  <img src="./screens/9.png" width="300" />
  <img src="./screens/10.png" width="300" />
  <img src="./screens/11.png" width="300" />
  <img src="./screens/12.png" width="300" /> 
  <img src="./screens/13.png" width="300" /> 
  <img src="./screens/14.png" width="300" />
  <img src="./screens/15.png" width="300" />
  <img src="./screens/16.png" width="300" />
  <img src="./screens/17.png" width="300" /> 
  <img src="./screens/18.png" width="300" /> 
  <img src="./screens/19.png" width="300" />
  <img src="./screens/20.png" width="300" />
  <img src="./screens/21.png" width="300" />
  <img src="./screens/22.png" width="300" />
  <img src="./screens/23.png" width="400" />
  <img src="./screens/24.png" width="400" />
  <img src="./screens/25.png" width="400" />
  <img src="./screens/26.png" width="400" />
  <img src="./screens/27.png" width="400" />
  <img src="./screens/28.png" width="400" />
  <img src="./screens/29.png" width="400" />
  <img src="./screens/30.png" width="400" />
</p>
