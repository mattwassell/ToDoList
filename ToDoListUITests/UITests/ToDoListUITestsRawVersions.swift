//
//  ToDoListUITests.swift
//  ToDoListUITests
//
//  Created by Matt Wassell on 22/07/2022.
//  Copyright © 2022 Radu Ursache - RanduSoft. All rights reserved.
//

import XCTest

class ToDoListUITestsRawVersions: ToDoListUITestBase {
    

    func testCreateTask() {
        app.buttons["Add Task"].tap()
        app.typeText("Test Create Task")
        app.buttons["Date & Time"].tap()
        waitForElementToBeHittable(app.pickerWheels["Today"])
        app.pickerWheels["Today"].swipeUp()
        app.toolbars.buttons["Save"].tap()
        app.navigationBars.buttons["Save"].tap()
        if UIDevice.current.userInterfaceIdiom == .phone {
            app.staticTexts["All Tasks"].tap()
        }
        XCTAssertTrue(app.staticTexts["Test Create Task"].exists)
        //Test-specific data clean up:
        app.buttons["complete task icon"].tap()
    
    }
    
    func testDeleteTask() {
        app.buttons["Add Task"].tap()
        app.typeText("Test Delete Task")
        app.buttons["Date & Time"].tap()
        waitForElementToBeHittable(app.pickerWheels["Today"])
        app.pickerWheels["Today"].swipeUp()
        app.toolbars.buttons["Save"].tap()
        app.navigationBars.buttons["Save"].tap()
        if UIDevice.current.userInterfaceIdiom == .phone {
            app.staticTexts["All Tasks"].tap()
        }
        app.buttons["complete task icon"].tap()
        XCTAssertFalse(app.staticTexts["Test Delete Task"].exists)
        
    }
    
    func testEditTask() {
        app.buttons["Add Task"].tap()
        app.typeText("Test Edit Task")
        app.buttons["Date & Time"].tap()
        waitForElementToBeHittable(app.pickerWheels["Today"])
        app.pickerWheels["Today"].swipeUp()
        app.toolbars.buttons["Save"].tap()
        app.navigationBars.buttons["Save"].tap()
        if UIDevice.current.userInterfaceIdiom == .phone {
            app.staticTexts["All Tasks"].tap()
        }
        app.staticTexts["Test Edit Task"].tap()
        app.buttons["Edit"].tap()
        app.typeText(" - Edited")
        app.navigationBars.buttons["Save"].tap()
        if UIDevice.current.userInterfaceIdiom == .phone {
            app.staticTexts["All Tasks"].tap()
        }
        XCTAssertTrue(app.staticTexts["Test Edit Task - Edited"].exists)
        //Test-specific data clean up:
        app.buttons["complete task icon"].tap()
        
    }
    
 
}


