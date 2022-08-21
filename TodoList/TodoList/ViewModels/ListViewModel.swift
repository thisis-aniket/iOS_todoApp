//
//  ListViewModel.swift
//  TodoList
//
//  Created by Aniket Landge on 13/03/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    let itemKey: String = "list_items"
    
    init(){
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "First item", isCompleted: true),
//            ItemModel(title: "Second item", isCompleted: true),
//            ItemModel(title: "Third item", isCompleted: false),
//        ]
//        items.append(contentsOf: newItems)
        
        guard let data = UserDefaults.standard.data(forKey: itemKey),
              let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{
            return
        }
        
        self.items = savedItem
    }
    
    func delete(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func move(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        
        //When we assigning index here it creates new ItemModel with new id in solution of that we are creating custom initializer to get same id as we create the new ItemModel...
//        if let index = items.firstIndex(where: { $0.id == item.id }){
//            items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemKey)
        }
    }
}
