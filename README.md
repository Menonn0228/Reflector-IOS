# Reflector - iOS
The following README will contain all necessary information for new developers and additional resources to guide development.

## Application Description
The Reflector mobile application allows users to view articles posted on [ The Reflector ](https://www.reflector-online.com/) official website. This project uses **RSS Feeds** from the website to scrape and present data. The RSS feeds are derived from BloxCMS and documentation can for [ here ](https://help.bloxcms.com/knowledge-base/applications/editorial/assets/tasks/article_504ccd62-2bfd-11e5-8804-131eebdc4425.html) on how to use it.

## Overall Project Goal for Developers
Develop a quality-focused app that focuses on simplicity and stability while maintaining a strong code base with detailed documentation within the project. With this goal in mind, we can ensure that future developers will have an easy time jumping in given the simplicity, proper design architecture, and detailed documentation.

## Primary Application Features
- [ ] User is greeted with the latest articles from the [ Reflector News tab ] and can tap on an article to view the full content of the tapped article.
- [ ] User can select a category to filter for articles in the tapped category. Categories may include Sports, News, Entertainment, etc. (The tabs that are shown on the [ Reflector Website ](https://www.reflector-online.com)

*Note: Features are subject to change. Features are based on order of importance.*
- - - -
## Technical Application Specifications

### Build Information
	* **Language:** Swift 5.1
	* **User Interface Framework:** SwiftUI
	* **Supported Devices:** iOS 13.0 or newer.

### Primary Design Architecture
**MVVM** — For those not familiar with this architecture, this is called Model View ViewModel. Basically, you have your Model (Data), a View (The interface), and a ViewModel for each view. The ViewModel classes will only contain the data from a model  that needs to be presented in that view. This separation allows for the Views to avoid interacting with the model data. The ViewModels should tell the View what to display. Research MVVM in SwiftUI for more information.

### Dependencies Used
	* [ Alamofire V.5.1](https://github.com/Alamofire/Alamofire)

*Note: All dependencies are managed using Swift Package Manager. For future developers, do your absolute best to only use SPM if you have to add dependencies.*


#college/reflector