
# Flutter basics notes 
* Mobile UI Framework for creating native application for iOS and Android
* Single code-base (dart)


## Flutter Architecture

* UI as Code: Build a Widget Tree - EVERYTHING is a widget
* Embrace Platform Differences - can render different interfaces for different platforms
* One Codebase
* Flutter does not use platform primitives
  * Flutter's RaisedButton() translates into **Custom implementation**("Flutter directly controls every pixel which is drawn"), instead of **iOS's UIButton** and **Android's widget.Button**


## main()
* special required top-level function, where app execution starts
* serves as entry point to the app


## Data Type 
* Number
  * int - integer
  * double - 64
* String
* Boolean - True and False
* Collections
  * List (arrays)
  * Map
  * Set

### Variables
* var keyword
```
var name = "name";
```

* dynamic keyword
```
dynamic name = "name";
```

* String name = "name"; 

### List
```
List<String> list_of_words = ["Dart", "Flutter"];
```
  
  
## Widgets
* Every **element** in Flutter is a **widget**
* Every widget is a class - similar to creating **objects** from a class in other programming languages

* Two types of widgets
  * **Stateful**
    * dynamic elements (that changes its state while app is running)
    * e.g. checkboxes, textfield, radio, etc
  * **Stateless**
    * static eleemnts (elements that do not change its state while app is running)
    * e.g. icon, backgroundcolor, text 

### Basic widgets
* **Scaffold**: provides layout to implement the widgets
* **Text**: create a run of styled text within your application
* **Row, Column**: create flexible layouts in both the horizontal (Row) and vertical (Column) directions
* **Buttons**: for receiving user's input (touch/tap) to call a function
* **AlertDialog**: used to prompt user for data (string, bool) input 
* **Custom widgets**: create own -> readability, efficiency, maintainability


## Material Design 
* Material is a **Design System** created by Google
* Material Design is built into Flutter but you also find Apple-styled **(Cupertino)** widgets 


## Flutter vs React Native vs Ionic
* **Flutter:** (Developed by Google) 
  * Dart + Flutter
  * Compiled Native Apps
  * Does not compile to iOS / Android UI Components
  * Cross-platform (mobile aps, web apps, desktop apps)
* **React Native:** (Developed by Facebook)
  * JavaScript / React.js
  * Partly compiled (UI Components) Native Apps
  * Does compile to iOS / Android UI Components 
  * Mostly mobile apps (+ React Native Web)
* **Ionic:** (Developed by Ionic) 
  * JavaScript (any or no framework)
  * WebView-hosted Web Apps
  * Does NOT compile to iOS / Android UI Components, can customise however you like (like Web Apps)
  * Cross-platform (mobile apps, web apps, desktop apps) 


