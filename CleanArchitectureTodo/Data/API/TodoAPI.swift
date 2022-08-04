//
//  TodoAPI.swift
//  CleanArchitectureTodo
//
//  Created by Ionut Vasile on 04.08.2022.
//

import Foundation

enum APIServiceError: Error{
    case BAD_URL, REQUEST_ERROR, DECODING_ERROR, STATUS_NOT_OK
}

struct TodoAPI: TodoDataSource{
    
    
    func getTodos() async throws -> [Todo] {
        
        guard let url = URL(string:  "\(Constants.BASE_URL)/todos") else{
            throw APIServiceError.BAD_URL
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else{
            throw APIServiceError.REQUEST_ERROR
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw APIServiceError.STATUS_NOT_OK
        }
        
        guard let result = try? JSONDecoder().decode([TodoAPIEntity].self, from: data) else {
            throw APIServiceError.DECODING_ERROR
        }
        
        return result.map({ item in
            Todo(
                id: item.id,
                title: item.title,
                isCompleted: item.completed
            )
        })
    }
}
