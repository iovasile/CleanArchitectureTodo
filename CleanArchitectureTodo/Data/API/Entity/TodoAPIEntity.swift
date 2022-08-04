//
//  TodoAPIEntity.swift
//  CleanArchitectureTodo
//
//  Created by Ionut Vasile on 04.08.2022.
//

import Foundation

struct TodoAPIEntity: Codable {
    let id: Int
    let title: String
    let completed: Bool
}
