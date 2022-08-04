//
//  GetTodos.swift
//  CleanArchitectureTodo
//
//  Created by Ionut Vasile on 04.08.2022.
//

import Foundation

struct GetTodosUseCase: GetTodos {
    var repo: TodoRepository
    
    func execute() async -> Result<[Todo], UseCaseError> {
        do {
            let todos = try await repo.getTodos()
            return .success(todos)
        } catch(let error) {
            switch(error) {
                case APIServiceError.DECODING_ERROR:
                    return .failure(.DECODING_ERROR)
                default:
                    return .failure(.NETWORK_ERROR)
            }
        }
    }
}

enum UseCaseError: Error {
    case NETWORK_ERROR, DECODING_ERROR
}

protocol GetTodos {
    func execute() async -> Result<[Todo], UseCaseError>
}
