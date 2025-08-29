//
//  newItemsview.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//

import SwiftUI

struct NewItemsView: View {
    @StateObject var viewModel = NewItemsViewViewModels()
    @Binding var newitempresented : Bool
    var body: some View {
        VStack {
            Text(" NEW ITEMS")
                .font(.system(size : 30))
                .bold()
                .padding(.top ,100)
            
            Form {
                TextField(" Title", text: $viewModel.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLview (title: "Save", backgroundColor: .pink) {
                    if viewModel.canSave{
                        viewModel.save()
                        newitempresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                    
                }
                .alert( isPresented: $viewModel.showAlert)
                {
                    Alert(title:Text ("Error"),message: Text("Please fill all the fields - select a due date that is today  or later"))
                }
            }
        }
    }
    
    struct NewItemsView_Previews: PreviewProvider {
        static var previews: some View {
            NewItemsView(newitempresented: .constant(true))
        }
    }
}
