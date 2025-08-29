//
//  taskyItemsview.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//

import SwiftUI

struct TaskyItemsView: View {
    @StateObject var viewModel = TaskyItemsViewViewModels()
    let item : TaskyItem
    var body: some View {
        HStack{
            VStack(alignment : .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970:item.dueDate).formatted(date:.abbreviated,time:.shortened))")
                    .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
                Button{
                    viewModel.toggleIsDone(item :item)
            } label :{
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
        
    }
}

#Preview {
    TaskyItemsView(item : .init(
        id: "123",
        title:"GET MILK",
        dueDate:Date().timeIntervalSince1970,
        createdDate:Date().timeIntervalSince1970,
        isDone: false
    ))
}


