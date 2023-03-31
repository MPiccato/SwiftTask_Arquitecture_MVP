//
//  Task.swift
//  Architecture_MVP
//
//  Created by Martin Piccato on 31/03/2023.
//

import Foundation

struct Task {
    let id: UUID = UUID()
    let text: String
    var isFavorite: Bool
}
