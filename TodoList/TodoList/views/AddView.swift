//
//  AddView.swift
//  TodoList
//
//  Created by Aniket Landge on 09/03/22.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment (\.presentationMode) var presentationMode
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type Something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                //Change color -> rgb(236,235,236)
                    .background(Color("textFieldColor"))
                    .cornerRadius(10)
                
                Button  {
                    saveButtonPressed()
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add Todo 🖊")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3{
            showAlert.toggle()
            alertTitle = "Your new todo item must be 3 character long !!!"
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
