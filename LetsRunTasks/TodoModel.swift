//
//  TodoModel.swift
//  LetsRunTasks
//
//  Created by noguchi-ryota on 2019/04/11.
//  Copyright © 2019 noguchi-ryota. All rights reserved.
//

import UIKit

class TodoModel {
    
    func add(text: String?) {
        var todoList = self.get()
        todoList.append(text ?? "")
        self.set(todoList: todoList)
    }
    
    func set(todoList: [String]) {
        UserDefaults.standard.set(todoList, forKey: "todoList")
    }
    
    func set(at: Int, value: String) {
        var todoList: [String] = self.get()
        todoList[at] = value
        self.set(todoList: todoList)
    }
    
    func get() -> [String] {
        return UserDefaults.standard.object(forKey: "todoList") as? [String] ?? []
    }
    
    func remove(at: Int) {
        var todoList: [String] = self.get()
        todoList.remove(at: at)
        self.set(todoList: todoList)
    }
}
