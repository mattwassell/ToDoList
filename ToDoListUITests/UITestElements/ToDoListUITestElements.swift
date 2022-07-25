//
//  ToDoListUITestElements.swift
//  ToDoListUITests
//
//  Created by Matt Wassell on 23/07/2022.
//  Copyright © 2022 Radu Ursache - RanduSoft. All rights reserved.
//

import Foundation
import XCTest

enum ToDoListScreens: String {
    
    //buttons
    case continueOnWelcomeButton = "Continue"
    case notNowOnNotificationsButton = "Not now"
    case getStartedOnOnboardingButton = "Get started"
    case toDoListButton = "ToDoList"
    case addTaskButton = "Add Task"
    case dateAndTimeButton = "Date & Time"
    case completeTaskCheckIconButton = "complete task icon"
    case editActionSheetButton = "Edit"
    
    //staticTexts
    case welcomeToToDoList = "Welcome to ToDoList"
    case allTasksRow = "All Tasks"
    case iCloudNotLoggedInErrorMessage = "You are not logged in iCloud. Your tasks won't be synced!"
    
   
    
    var element: XCUIElement {
        if buttonElements.contains(self) {
            return XCUIApplication().buttons[self.rawValue]
        }
        if textElements.contains(self) {
            return XCUIApplication().staticTexts[self.rawValue]
        }
        fatalError("Element not found")
    }

    private var buttonElements: [ToDoListScreens] {
        return [.continueOnWelcomeButton, .notNowOnNotificationsButton, .getStartedOnOnboardingButton, .toDoListButton, .addTaskButton, .dateAndTimeButton, .completeTaskCheckIconButton, .editActionSheetButton]
    }
    
    private var textElements: [ToDoListScreens] {
        return [.welcomeToToDoList, .allTasksRow, .iCloudNotLoggedInErrorMessage]
    }
    
}


    var app = XCUIApplication()
    
    let dateDrawerSaveButton = app.toolbars.buttons["Save"]
    let todayDatePickerWheel = app.pickerWheels["Today"]
    let saveNavBarButton = app.navigationBars.buttons["Save"]


