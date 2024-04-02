//
//  AddAccountScreen.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation
import SwiftUI

struct AddAccountScreen : View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var addAccountViewModel = AddAccountViewModel()
    
    var body: some View {
        Form {
            TextField("Name", text: self.$addAccountViewModel.name)
            Picker(selection: self.$addAccountViewModel.accountType, label : EmptyView()){
                ForEach(AccountType.allCases, id: \.self) { accountType in
                    Text(accountType.title).tag(accountType)
                }
            }
                .pickerStyle(SegmentedPickerStyle())
            TextField("Balance", text: self.$addAccountViewModel.balance)
            
            HStack{
                Spacer()
                Button("Submit"){
                    self.addAccountViewModel.createAccount { success in
                        if(success){
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                Spacer()
            }
            
            Text(self.addAccountViewModel.errorMessage)
        }
        .navigationBarTitle("Add Account")
        .embedInNavigationView()
    }
}
