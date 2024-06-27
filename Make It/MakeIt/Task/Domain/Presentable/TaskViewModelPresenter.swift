//
//  TaskViewModelPresenter.swift
//  MakeIt
//
//  Created by Allan Soberanski on 27/06/24.
//

import Foundation

protocol TaskViewModelPresenter {
    func didFetchTasks(_ data: [TaskModel])
}
