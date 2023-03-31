//
//  TaskDatabase.swift
//  Architecture_MVP
//
//  Created by Martin Piccato on 31/03/2023.
//

import Foundation

final class TaskDatabase {
    var tasks: [Task]
    
    init(tasks: [Task] = []) {
        self.tasks = tasks
    }
    
    func create(task: Task) -> [Task] {
        tasks.append(task)
        return tasks
    }
    
    func updateFavorite(taskID: UUID) -> [Task] {
        if let index = tasks.firstIndex(where: {$0.id == taskID}) {
            tasks[index].isFavorite = !tasks[index].isFavorite
        }
        return tasks
    }
    
    func remove(taskID: UUID) -> [Task] {
        if let index = tasks.firstIndex(where: {$0.id == taskID}) {
            tasks.remove(at: index)
        }
        return tasks
    }
    
    func removeAll() -> [Task] {
        tasks.removeAll()
        return tasks
    }
}

