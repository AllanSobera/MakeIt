//
//  Task.swift
//  Make It
//
//  Created by Allan Soberanski on 24/06/24.
//

import Foundation
import SwiftData

@Model
final class TaskModel {
    
    let id: UUID
    let title: String
    let descriptionTitle: String
    let startTime: Date
    
    var isOverdue: Bool {
        get {
            return startTime < Date.now
        }
    }
    
    init(
        id: UUID,
        title: String,
        descriptionTitle: String,
        startTime: Date
    ) {
        self.id = id
        self.title = title
        self.descriptionTitle = descriptionTitle
        self.startTime = startTime
    }
}


#warning("Think about this idea, because I need to structure this and think more about which is the best way to do. I use mapper, or the object has him own resposability like the variable 'isOverDue in taskmodel'")
//
//struct TaskEntity {
//    let id: UUID
//    let title: String
//    let descriptionTitle: String
//    let hour: String
//    let date: String
//}
//
//
//[TaskModel].map {
//    return TaskEntity()
//}
//
//object.older
//
//
//
//[TaskEntity]
//
//struct AnotherStruct {
//    let name: String
//    let age: String
//    let phoneNumber: String
//    let tasks: [TaskModel]
//}
