//
//  TaskRepository.swift
//  Make It
//
//  Created by Allan Soberanski on 24/06/24.
//

import SwiftUI
import SwiftData

class TaskRepository {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = TaskRepository()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: TaskModel.self)
        self.modelContext = modelContainer.mainContext
    }
}

extension TaskRepository: TaskRepositoryProtocol {
    
    func fetchTasks() -> [TaskModel] {
        do {
            return try modelContext.fetch(FetchDescriptor<TaskModel>())
        } catch (let error) {
            fatalError(error.localizedDescription)
        }
    }
    
    func addTask(task: TaskModel) {
        modelContext.insert(task)
        do {
            try modelContext.save()
        } catch (let error) {
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteTask(task: TaskModel) {
        modelContext.delete(task)
    }
}
