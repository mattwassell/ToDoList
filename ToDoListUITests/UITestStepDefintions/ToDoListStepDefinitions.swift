//
//  ToDoListStepDefinitions.swift
//  ToDoListUITests
//
//  Created by Matt Wassell on 22/07/2022.
//  Copyright © 2022 Radu Ursache - RanduSoft. All rights reserved.
//

import Foundation
import XCTest

extension ToDoListUITestBase {
        
    func givenIAmOnTheToDoList() {
        XCTContext.runActivity(named: "Given I am on the ToDoList screen") { _ in
            XCTAssertTrue(ToDoListScreens.toDoListButton.element.exists)
        }
    }
        
    func whenIAddATask() {
        XCTContext.runActivity(named: "When I add a task") { _ in
            ToDoListScreens.addTaskButton.element.tap()
        }
    }
        
    func andISpecifyTaskContent(taskContent: String) {
        XCTContext.runActivity(named: "And I specify the task content") { _ in
            app.typeText(taskContent)
        }
    }
        
    func andISpecifyDateForTask() {
        XCTContext.runActivity(named: "And I specify a date for the task") { _ in
            ToDoListScreens.dateAndTimeButton.element.tap()
            waitForElementToBeHittable(todayDatePickerWheel)
            todayDatePickerWheel.swipeUp()
        }
    }
        
    func andISaveTheTask() {
        XCTContext.runActivity(named: "And I save the task") { _ in
            dateDrawerSaveButton.tap()
            saveNavBarButton.tap()
        }
    }
        
    func thenIShouldSeeThatTaskSavedInMyAllTasksList() {
        XCTContext.runActivity(named: "Then I should see that task saved in my All Tasks list.") { _ in
            if UIDevice.current.userInterfaceIdiom == .phone {
                ToDoListScreens.allTasksRow.element.tap()
            }
            XCTAssertTrue(app.staticTexts["Test Create Task"].exists)
            //Test-specific data clean up:
            ToDoListScreens.completeTaskCheckIconButton.element.tap()
        }
    }
    
    func givenIAddATask() {
        XCTContext.runActivity(named: "Given I create a task") { _ in
            ToDoListScreens.addTaskButton.element.tap()
        }
    }
    
    func whenIDeleteThatTask() {
        XCTContext.runActivity(named: "When I delete that task") { _ in
            if UIDevice.current.userInterfaceIdiom == .phone {
                ToDoListScreens.allTasksRow.element.tap()
            }
            ToDoListScreens.completeTaskCheckIconButton.element.tap()
        }
    }
    
    
    func thenIShouldNoLongerSeeThatTaskInMyAllTasksList() {
        XCTContext.runActivity(named: "Then I should no longer see that task in my All tasks list.") { _ in
            XCTAssertFalse(app.staticTexts["Test Delete Task"].exists)
        }
    }
    
    func whenIEditAndSaveTheTaskContent(taskContent: String) {
        XCTContext.runActivity(named: "When I edit and save the task's content") { _ in
            if UIDevice.current.userInterfaceIdiom == .phone {
                ToDoListScreens.allTasksRow.element.tap()
            }
            app.staticTexts["Test Edit Task"].tap()
            ToDoListScreens.editActionSheetButton.element.tap()
            app.typeText(taskContent)
            saveNavBarButton.tap()
            if UIDevice.current.userInterfaceIdiom == .phone {
                ToDoListScreens.allTasksRow.element.tap()
            }
        }
    }
    
    func thenIShouldSeeEditedTaskContentInMyAllTasksList() {
        XCTContext.runActivity(named: "Then I should see the edited task content reflected in my All Tasks list.") { _ in
            XCTAssertTrue(app.staticTexts["Test Edit Task - Edited"].exists)
            //Test-specific data clean up:
            ToDoListScreens.completeTaskCheckIconButton.element.tap()
        }
    }
    
}
   

