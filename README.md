# Mobiquity test
First checkout the project and start the **Mob_test** file. There are no third party dependencies so this means no CocoaPods and similar which means it’s pretty simple and not a headache. In case you want to build on a real device, add your bundle ID project settings. 

You also have a sample video of how it all looks.

Based on the project request, the following has been done:

# Requirements
All the basic requirements have been implemented, so:
* Swift was used with SwiftUI so modern approach can be seen (I avoided UIKit intentionally although I would make much nicer UI with it)
* User is able to search images with specific search terms
* Application implements lazy loading and gets new data when bottom is reached
* Application provides history of past search terms

# Bonus stuff
* Details view is implemented with an image expansion
* Some sample tests have been done

# Remaining and potential improvements
* Swift Lint can be introduced to improve the code quality
* Better UI can also be achieved with more focus on the UX than UI and using UIKit 

# Architecture:
* MMVM is used as an app design pattern since it complements Apple's native, out of the box, MVC for UIKit and its new MVVM in SwiftUI.
* Unit tests are made for view models. They are just examples and many more tests can be done. The test structure mimics the app files structure. Also each class should have its corresponding test class. For example "SearchDetailModel.swift" has "SearchDetailModelTests.swift" and so on...
* Repository pattern was introduced which was used for storing the data in UserDefaults. It can be replaced with Core Data, Realm, SQL…
* Repository pattern was used for networking as well

# File organization: 
* App - App related data 
* Models
* Views
* ViewModels
* Lib - all custom made libraries with the main one being the repository module  
* Resources - images and other stuff

# Special Note
I wasted some time and had a problem with the FLICKR API concretely the JSON parsing, concretely “Error Domain=NSCocoaErrorDomain Code=3840“. I found out what was the problem and it is because the returned data is not valid JSON. It's valid JavaScript, though. The returned data is wrapped inside a default callback function called jsonFlickrApi.

Solution was for the request URL to end with &format=json&nojsoncallback=1'.

I am mentioning this in order for someone else not to waste his time on this :).






