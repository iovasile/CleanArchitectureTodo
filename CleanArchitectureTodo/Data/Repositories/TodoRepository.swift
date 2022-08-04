//
//  TodoRepositories.swift
//  CleanArchitectureTodo
//
//  Created by Ionut Vasile on 04.08.2022.
//

import Foundation

struct TodoRepository: TodoRepositoryBase {
    
    var dataSource: TodoDataSource
    
    func getTodos() async throws -> [Todo] {
        let todos =  try await dataSource.getTodos()
        return todos
    }
}
