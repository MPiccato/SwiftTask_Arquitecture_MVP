//
//  TaskPresenter.swift
//  Architecture_MVP
//
//  Created by Martin Piccato on 31/03/2023.
//

import Foundation

protocol UI: AnyObject {
    func update()
}

final class TaskPresenter {
    weak var delegate: UI?
    var tasks: [Task] = []
    private var taskDatabase = TaskDatabase()
    
    func create(task: String) {
        guard !task.isEmpty else {
            return
        }
        let newTask: Task = .init(text: task, isFavorite: false)
        tasks = taskDatabase.create(task: newTask)
        delegate?.update()
    }
    
    func updateFavorite(taskId: UUID) {
        tasks = taskDatabase.updateFavorite(taskID: taskId)
        delegate?.update()
        
    }
    
    func removeTasks(taskId: UUID) {
        tasks = taskDatabase.remove(taskID: taskId)
        delegate?.update()
    }
    
    @objc
    func removeallTasks() {
        tasks = taskDatabase.removeAll()
        delegate?.update()
    }
}
