//
//  Task.swift
//  Make It
//
//  Created by Premiersoft on 24/06/24.
//

import Foundation
import SwiftData

@Model
final class TaskModel {
    let id: UUID
    let title: String
    let descriptionTitle: String
    let startTime: Date
    
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
