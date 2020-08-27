#  Developer Guide to the ReflectorIOS
Author: Nikhil Menon
Created: Sometime around April 2020
_______________________________________________________________________________________

## Rule of Thumb for Documenting Code

1. __ALWAYS__ Document methods in your classes, and document what classes do.
2. If you make spaghetti code that magically works and you don't know why, COMMENT that it works for some reason so that nobody messes with it.
3. Avoid [magic numbers.](https://en.wikipedia.org/wiki/Magic_number_%28programming%29) 
4. When using code from other sites or Youtube videos, Always comment the link so that othes developers can learn what you did. This may also help with plagarism.
5. **Refer to the Swift Style Guide so your code doesn't look bad. Pull Requests will be declined if the style guide has not been met.**
[Swift Style Guide](https://github.com/raywenderlich/swift-style-guide)

_______________________________________________________________________________________

## When Creating New Files

**SwiftUI View** files go into the **Views Folder.** You may sort the Views in the Views folders into subdirectories for each kind of screen if it helps.

**Primary Swift Classes or Structs** that you make should all go into the **Models folder.**

**ViewModels** are separate from models, and should be placed in the ViewModels Folder.

Anything that *helps* you get your job done like a custom Formatter class or a Network Manager class can all go into the **Helpers folder**. These are different from the stuff
in the models folder because the classes and structs in the models folder represent actual data.

If you add extensions to a framework class, create a new file with the file name [ClassBeingExtended]+[ExtensionKind].swift and add it to the **Extensions Folder**

_______________________________________________________________________________________

## Rules for Our Github Repo

1. Whenever you start work on a feature, ALWAYS created a new branch from the Develop/Master Branch and name the new branch `feature/[feature_name_here]`

2. NEVER do a full merge into the Develop or Master branch. When you finish work on your feature, do a __Pull Request__  into Develop/Master. This makes sure that someone checks your work
    before doing a merge and prevents any chaos with bugs that might have gone through and broke the main branches that we depend on.
    
3. I recommend using a GUI to manage your Github branches. [Gitkraken](https://www.gitkraken.com/b) is a popular open source software, but if you use MacOS, you can get [Git Tower](https://www.git-tower.com/) for free as a student.


_______________________________________________________________________________________

## MVVM Architecture
This project is built off of an MVVM architecture. This means that you will see three types of files/classes.

You will see **Model** Files located in the Models folder. This will contain data or objects that represent data.
This includes objects that represent an article or maybe User data that we keep in memory.

A **ViewModel** object is a type of object that uses Models to fill in ViewModel properties. These properties are then passed into a **View**.
The ViewModel essenpially represents ONLY what needs to be displayed in a view. The ViewModel should also be able to interact with the model data and viewmodel data.

A **View** is literally what it sounds like. It's the actual interface that the user sees. In an MVVM architecture, the View objects and structs **Should Never** interact with the model data.
For example, if the user taps on a button, the button tap should make the view ask the ViewModel to change the viewModel data. In return, whenever the ViewModel data is changed, the View itself should change accordingly
to represent the ViewModel.

_______________________________________________________________________________________

## Code Wiki
Get quick information on important custom classes, extentions, etc. that may help you develop the project.

### RSSService

This class uses SwiftUI's built-in URLSessions framework  to make network requests to fetch RSS Feeds.
When fetching articles from an RSS feed, this class does the nitty gritty stuff for you.
When you are wanting to actually *fetch* the data, all you have to do is call the methods within the class.

RSSService is a **Singleton object**. This means only one instance needs to be created and it can then be accesses anywhere
in the project. **Do not** create a new instance of RSSService. Just call  its `shared` property in order to use its methods.

Ex: 
Don't to this `let service = RSSService; service.fetchNews()`
Do this: `RSSService.shared.fetchNews()`

**For more detailed information on how to use specific methods in this class, refer to the in-line documentation within the RSSService.swift file.**

More information on Singleton [here](https://cocoacasts.com/what-is-a-singleton-and-how-to-create-one-in-swift/).

### RSSService + Combine Framework

RSSService now uses the Combine framework. To get familiar with Combine and what it does, I recommend watching the related [Apple Developer videos](https://developer.apple.com/wwdc19/722)
