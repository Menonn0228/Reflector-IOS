#  Developer Guide to the ReflectorIOS


## MVVM Architecture
This project is built off of an MVVM architecture. This means that you will see three types of files/classes.

You will see **Model** Files located in the Models folder. This will contain data or objects that represent data.
This includes objects that represent an article or maybe User data that we keep in memory.

A **ViewModel** object is a type of object that uses Models to fill in ViewModel properties. These properties are then passed into a **View**.
The ViewModel essenpially represents ONLY what needs to be displayed in a view. The ViewModel should also be able to interact with the model data and viewmodel data.

A **View** is literally what it sounds like. It's the actual interface that the user sees. In an MVVM architecture, the View objects and structs **Should Never** interact with the model data.
For example, if the user taps on a button, the button tap should make the view ask the ViewModel to change the viewModel data. In return, whenever the ViewModel data is changed, the View itself should change accordingly
to represent the ViewModel.


## RSSNetworkManager
This class uses the  [Alamofire](https://github.com/Alamofire/Alamofire) dependency to make network requests to fetch RSS Feeds.
When creating networking requests, this class is where you create those methods to do the knitty gritty stuff. That way, when you are wanting to actually *fetch* the data, all you have to do is call the methodts within the class.

## Rule of Thumb for Documenting Code

1. __ALWAYS__ Document methods in your classes, and document what classes do.
2. If you make spaghetti code that magically works and you don't know why, COMMENT that it works for some reason so that nobody messes with it.
3. When using code from other sites or Youtube videos, Always comment the link so that othes developers can learn what you did. This may also help with plagarism.







