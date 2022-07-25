//
//  ToDoListBDDTests.swift
//  ToDoListUITests
//
//  Created by Matt Wassell on 22/07/2022.
//  Copyright © 2022 Radu Ursache - RanduSoft. All rights reserved.
//



import Foundation
import XCTest

class ToDoListBDDTests: ToDoListUITestBase {
    
    func testBDDCreateTask() {
        givenIAmOnTheToDoList()
        whenIAddATask()
        andISpecifyTaskContent(taskContent: "Test Create Task")
        andISpecifyDateForTask()
        andISaveTheTask()
        thenIShouldSeeThatTaskSavedInMyAllTasksList()
    }
    
    func testBDDDeleteTask() {
        givenIAddATask()
        andISpecifyTaskContent(taskContent: "Test Delete Task")
        andISpecifyDateForTask()
        andISaveTheTask()
        whenIDeleteThatTask()
        thenIShouldNoLongerSeeThatTaskInMyAllTasksList()
    }
    
    func testBDDEditTask() {
        givenIAddATask()
        andISpecifyTaskContent(taskContent: "Test Edit Task")
        andISpecifyDateForTask()
        andISaveTheTask()
        whenIEditAndSaveTheTaskContent(taskContent: " - Edited")
        thenIShouldSeeEditedTaskContentInMyAllTasksList()
    
    }
    
}

