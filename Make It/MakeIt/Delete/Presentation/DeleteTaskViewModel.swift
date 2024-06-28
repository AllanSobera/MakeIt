//
//  DeleteTaskViewModel.swift
//  MakeIt
//
//  Created by Allan Soberanski on 27/06/24.
//

import Foundation

@Observable
final class DeleteViewData {
    var didDeleteItem: Bool = false
}

@Observable
final class DeleteTaskViewModel {
    var state = DeleteViewData()
}

extension DeleteTaskViewModel: DeleteTaskViewModelPresenter {
    func didDeleteTask(_ data: TaskModel) {
        state.didDeleteItem = true
    }
}
