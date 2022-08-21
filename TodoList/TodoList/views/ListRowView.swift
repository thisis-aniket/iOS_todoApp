//
//  ListRowView.swift
//  TodoList
//
//  Created by Aniket Landge on 09/03/22.
//

import SwiftUI

struct ListRowView: View {
    var item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle").foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First", isCompleted: true)
    static var item2 = ItemModel(title: "second", isCompleted: false)

    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
