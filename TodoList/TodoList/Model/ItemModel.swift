//
//  ItemModel.swift
//  TodoList
//
//  Created by Aniket Landge on 09/03/22.
//

import Foundation

struct ItemModel: Identifiable, Codable{
    let id: String
    var title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}


