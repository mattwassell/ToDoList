#  MattWassellToDoListTests

For Mobile iOS Test Engineer technical test.
Three tests in XCUITest for the create task, edit task and delete task functionality on the ToDoList app for iPhone and iPad(iOS 13+).
 
## Main features

- ToDoListBDDTests.swift - create task, edit task and delete task - run tests from here
- ToDoListUITestsRawVersions.swift - early iteration of the tests for visibility and reference
- ToDoListStepDefinitions.swift - step defintions for the tests written in BDD
- ToDoListUITestElements.swift - UI elements used in the tests
- ToDoListUITestBase - Base class for the tests

- Pattern is based on a lightweight page object model layout along with BBD "Given, When, Then" formatted test class and related step definition file.

## Requirements

- iOS 13.0+
- Xcode 11.0+
- Swift 5.0+

## How to run

1. Clone the repo
2. Turn on iCloud option in ```Signing & Capabilities``` and check ```CloudKit```. Turn on ```Background Modes``` and check ```Background fetch``` + ```Remote notification```.
3. Make sure to update your app group config (```Signing & Capabilities```, ```App Groups```) and id string in ```RealmManager.swift```.
4. ```Update Deployment info``` to ```iOS 13.0``` for iPhone and iPhone for ```ToDoList``` target and ```iOS 13.0``` for iPhone for ```ToDoListWidget```
5. You may also need to check the box for ```Copy only when installing``` for ```ToDoList``` target for ``` Embed App Extensions```  and ``` Embed Watch Content```  in ``` Build Phases``` 
 
6. Got to ToDoListBDDTests to run the tests. But before running the tests on a simulator or physical device, please uninstall the ToDoList so a fresh installation is installed when you build to the simulator (more context in 'Further information about the approach' below).

7. Also, please ensure that you remove any tasks you might have in your 'All Tasks' folder.  This is a prerequisite state that currently has to be set up manually in the absence of automating or mocking this state (more context in 'Further information about the approach' below). 


## Further information about the approach

- Please treat the tests seen in ToDoListBDDTests.swift as the main tests to review and run.
- ToDoListUITestsRawVersions.swift are an earlier iterations of the tests from when I started working on them.  They have been included to give insight into the ways in which I approached writing the tests for this technical task.
- In terms of patterns, I looked into Cucumberish and TABTestKit BDD frameworks but elected to format tests myself in a BDD manner as time was limited in which to familiarise myself with those additional tools and to write tests (implemented with or without) one of BDD frameworks mentioned previously.  As such, the format of my BDD tests is not quite as reusable as if I were using a true BDD framework but the formatting (and pattern ) I've used, along with the step definitions allows me to demonstrate my understanding of BDD.
- There are also more readable Given, When, Then statements added to the test reports due to my use of XCTContext.runActivity in the step definition file.  Happy to discuss in further detail.  
- There is logic in the set up that checks for the Welcome journey and the existence of an error message relating to iCloud being logged out.  Uninstalling the app first and then running the tests more than once each should demonstrate this logic in action.
- In the create and edit task tests, there is a data-clean up method after assertion to remove the created task from the the user's All Tasks lists.  This wasn't added as part of the tear down in the base class because it is not required uninversally for all tests.  
- Given more time, I'd have tried to further research and implement a Reset Application State method for either set up and/or tear down between each test potentially - dependant on context and the nature of the functionality.  After initial investigation it seemed that I may have run out time to implement reset app state/clear app data functionality and also complete the general task.  Due to not having this functionality, if test fail then they can leave unwanted data in the All Tasks list which then will further cause tests to fail.  Addressing this situation would be vital in order to scale and maintain.  This also means the tests are more dependant on each other than one would like because one failed test can leave task data in the app that can cause other tasks to fail.
- There may be the option to to reset the app between each test run in Build Phases in Xcode but this would only partly address the requirement for prerequisite (cleared app data) state - i.e. before a test run but not in between tests.   
- Another approach to configuring the prerequisite state(s) required for scalable, maintainable and reusable automation testing that could have be investigated if there had been more time may have been the use of mocking an authenticated logged-in user account state with the required prequisite state mocked for the test account(s).  Another avenue to potentially explore.


## Summary

I hope this all makes sense and is useful information.  I look forward to discussing if further detail.

#  <#Title#>

