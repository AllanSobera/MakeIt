//
//  AddTaskViewModel.swift
//  MakeIt
//
//  Created by Allan Soberanski on 27/06/24.
//

import Foundation

@Observable
class AddTaskViewData {
    let title: String = ""
    let description: String = ""
    let startDate: Date = Date.now
}

@Observable
final class AddTaskViewModel {
    var data: AddTaskViewData = AddTaskViewData()
}

extension AddTaskViewModel: AddTaskViewModelPresenter {
    func didAddTask() {
        
    }
}
