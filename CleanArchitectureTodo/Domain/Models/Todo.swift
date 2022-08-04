//
//  Todo.swift
//  CleanArchitectureTodo
//
//  Created by Ionut Vasile on 04.08.2022.
//

import Foundation

struct Todo: Identifiable {
    let id: Int
    let title: String
    let isCompleted: Bool
}
