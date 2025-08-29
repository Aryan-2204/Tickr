//
//  taskyview.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//
import FirebaseFirestore
import SwiftUI

struct TaskyView: View {
    @StateObject var viewModel:TaskyviewViewModels
    @FirestoreQuery var items: [TaskyItem]
    
    init(userId : String) {
        self._items = FirestoreQuery(
            collectionPath : "users/\(userId)/tasks"
        )
        self._viewModel = StateObject(wrappedValue:TaskyviewViewModels(userId: userId)  )
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items){
                    item in
                    TaskyItemsView( item : item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                                    .tint(.red)
                            }
                        }
                .listStyle(PlainListStyle() )
            }
            .navigationTitle( "Tickr" )
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                }label:{
                    Image(systemName: "plus.circle.fill")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView)
            { NewItemsView(newitempresented: $viewModel.showingNewItemView)
                
            }
        }
    }
}
    

#Preview {
    TaskyView(userId: "q1CdsJlF3vcXhC7Lz9wPJq1bwq52")
}
