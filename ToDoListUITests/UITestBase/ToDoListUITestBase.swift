//
//  ToDoListUITestBase.swift
//  ToDoListUITests
//
//  Created by Matt Wassell on 22/07/2022.
//  Copyright © 2022 Radu Ursache - RanduSoft. All rights reserved.
//

import Foundation
import XCTest

class ToDoListUITestBase: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app.launch()
        checkForWelcomeJourney()
        checkForiCloudNotLoggedInMessage()
    }
        
     
    override func tearDown() {
        app.terminate()
        super.tearDown()
    
    }
        
}
    
    func waitForElementToBeHittable(_ element: XCUIElement) {
        let isElementReady = element.waitForExistence(timeout: 5)
        if isElementReady {
            XCTAssertTrue(element.isHittable)
        }
    }
    
    func checkForWelcomeJourney() {
        if ToDoListScreens.welcomeToToDoList.element.isHittable {
            waitForElementToBeHittable(ToDoListScreens.continueOnWelcomeButton.element)
            ToDoListScreens.continueOnWelcomeButton.element.tap()
            waitForElementToBeHittable(ToDoListScreens.notNowOnNotificationsButton.element)
            ToDoListScreens.notNowOnNotificationsButton.element.tap()
            waitForElementToBeHittable(ToDoListScreens.getStartedOnOnboardingButton.element)
            ToDoListScreens.getStartedOnOnboardingButton.element.tap()
        }
    }

    func checkForiCloudNotLoggedInMessage() {
        if  ToDoListScreens.iCloudNotLoggedInErrorMessage.element.isHittable {
                ToDoListScreens.iCloudNotLoggedInErrorMessage.element.tap()
        }
        
}

       

    
  



