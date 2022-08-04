//
//  TodoDataSource.swift
//  CleanArchitectureTodo
//
//  Created by Ionut Vasile on 04.08.2022.
//

import Foundation

protocol TodoDataSource{
    
    func getTodos() async throws -> [Todo]
    
}
