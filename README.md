# To Do List

This project is my first Flutter App and it is for study purpose, in this app is possible to add or remove tasks from a list in memory.


<div align="center">
<br>

| Adding item | Removing item
| :---: | :---: |
|![adding_items_screenshot](./readme_images/adding_item.png) | ![removing_items_screenshot](readme_images/removing_item.png) |


|     STACKS    |
|      :---:    | 
| ![Dart](https://img.shields.io/badge/-Dart-0175C2?style=flat-square&logo=dart&logoColor=white) ![Flutter](https://img.shields.io/badge/-Flutter-02569B?style=flat-square&logo=flutter&logoColor=white) | 


| PROJECT STATUS   |                      Developer                   |
|        :---:     |                         :---:                    |  
| 	In progress    |   [Kyara Araújo](https://github.com/kyaraaraujo) | 


<br>

</div>

---

## Content

[Details](#details) &nbsp;&nbsp; | &nbsp;&nbsp; 
[Learnings](#learnings) &nbsp;&nbsp; | &nbsp;&nbsp; 
[How to run](#how-to-run) &nbsp;&nbsp; | &nbsp;&nbsp; 
[To Learn and To Do](#to-learn-and-to-do) &nbsp;&nbsp; | &nbsp;&nbsp; 
[References](#references) &nbsp;&nbsp; 

<br>

## Details:

In this app is possible to add or remove tasks from a list in memory, is possible to scroll up and down and by a long press is going to show a dialog to confirm de exclusion of that task.

**Added Features:**
- Won't allow adding to list if text input is:
  - empty: doesn't have value `''`
  - blank: has only white spaces `'     '`
- Remove from list when the item is long pressed
  - A popup(`AlertDialog`) will show up asking to confirm or not.

## Learnings
- Basically eveything on Flutter is a `Widget`, some properties also expects to receive a widget.
- `Row` and `Column` can have children (more rows and/or columns), a row can have a column as child and vice-versa.
  - The `Expanded` property in a `Row`/`Column` will expand its size in the screen: horizontal for `Row` and vertical for `Column`. It's suggested to use it to avoid some erros like hasSize, `Expanded` can be used in the father or child widget.
- Property → padding: EdgeInsets.all(24) → *.all means all directions.*
  - Enpsulating a widget with `Padding` will afect all its children.
    ```Dart
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // ...
        )
      )
    ```
- TextField → for text input
    - It has a property called TextEditingController, when a widget has a property that contains the word controller it means we can have access to many other functions like .value, .text, .clear, etc. We can “control” that field.
- setState() { } → is a function that will show the changes inside { } in the screen.


## **How to run**
- [Install Flutter](https://flutter.dev/) if you don't have it.
- Have an IDE: Visual Studio Code (VSCode), Android Studio, or Xcode
  - Visual Studio Code extensions: 
    - [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
    - [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code)
- Have a smartphone emulator (for Android's emulator can be created in Android Studio or VSCode)
- Run the app (F5 for VSCode, Run App button for Android Studio)

<br>

### To Learn and To Do

[x] Change color of the App Bar

[ ] Add a help Button

[ ] Separate Dialog from home_page. Tried some ways but couldn't pass the index argument to delete the item, will keep searching if there's a way.

[ ] Unit Tests



## References
- [To do list by Jacob Moura](https://www.youtube.com/watch?v=Hq7JFYQEQjw&list=PLlBnICoI-g-fuy5jZiCufhFip1BlBswI7&index=26)

- [Deleting the item from list by Deivid](https://www.youtube.com/watch?v=PlB25Z3ma8E&list=PLRpTFz5_57cvo0CHf-AnojOvpznz8YO7S&index=9)

- [showDialog to confirm exclusion](https://api.flutter.dev/flutter/material/AlertDialog-class.html)

  
<br>

---
⬆ [Back to top](#to-do-list)

<br>
