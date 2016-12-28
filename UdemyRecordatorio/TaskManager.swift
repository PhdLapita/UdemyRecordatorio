//
//  TaskManager.swift
//  UdemyRecordatorio
//
//  Created by Bear on 27/12/16.
//  Copyright © 2016 BearCreekMining. All rights reserved.
//

import Foundation

class TaskManager{
    static let sharedInstance = TaskManager()
    var tasks : [[String:String]] = [[String:String]]()
    func save(){
        UserDefaults.standard.set(tasks, forKey: "tasks")
    }
    func load(){
        if let array = UserDefaults.standard.array(forKey: "tasks ") as? [[String : String]] {
                tasks = array
        }
    }
    
}
