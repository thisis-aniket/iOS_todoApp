//
//  ListView.swift
//  TodoList
//
//  Created by Aniket Landge on 09/03/22.
//

import SwiftUI

struct ListView: View {
//    @State var items: [ItemModel] = [
//        ItemModel(title: "First item", isCompleted: true),
//        ItemModel(title: "Second item", isCompleted: true),
//        ItemModel(title: "Third item", isCompleted: false),
//    ]
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                Text("No Items!!!")
            }else{
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.delete)
                    .onMove(perform: listViewModel.move)
                }
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(destination: {
                AddView()
            }, label: {
                Text("Add")
            })
        )
    }
    
//    func delete(indexSet: IndexSet){
//        listViewModel.items.remove(atOffsets: indexSet)
//    }
//
//    func move(from: IndexSet, to: Int){
//        items.move(fromOffsets: from, toOffset: to)
//    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


