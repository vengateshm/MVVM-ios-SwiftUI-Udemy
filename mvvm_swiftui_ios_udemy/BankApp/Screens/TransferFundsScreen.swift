//
//  TransferFundsScreen.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/04/24.
//

import Foundation
import SwiftUI


struct TransferFundsScreen : View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel = TransferFundsViewModel()
    @State private var showSheet : Bool = false
    @State private var isFromAccount : Bool = false
    
    var actionSheetButtons: [Alert.Button] {
        var actionButtons = self.viewModel.filteredAccounts.map {account in
            Alert.Button.default(Text("\(account.name) (\(account.accountType))")){
                if self.isFromAccount {
                    self.viewModel.fromAccount = account
                } else {
                    self.viewModel.toAccount = account
                }
            }
        }
        actionButtons.append(.cancel())
        return actionButtons
    }
    
    var body: some View {
        ScrollView {
            VStack {
                AccountListView(accounts: self.viewModel.accounts)
                    .frame(height:200)
                TransferFundsAccountSelectionView(
                    viewModel:self.viewModel,
                    showSheet:$showSheet,
                    isFromAccount:$isFromAccount)
                Spacer()
                Text(self.viewModel.message ?? "")
                Button("Submit Transfer") {
                    self.viewModel.submitTransfer() {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }.padding()
                    .actionSheet(isPresented: $showSheet) {
                        ActionSheet(
                            title: Text("Transfer Funds"),
                            message: Text("Choose an Account"),
                            buttons: actionSheetButtons)
                    }
            }
        }
        .onAppear {
            viewModel.populateAccounts()
        }
        .navigationBarTitle("Transfer Funds")
        .embedInNavigationView()
    }
}


struct TransferFundsAccountSelectionView : View {
    
    @ObservedObject var viewModel : TransferFundsViewModel
    @Binding var showSheet: Bool
    @Binding var isFromAccount: Bool
    
    var body: some View {
        VStack(spacing:10) {
            Button("From \(self.viewModel.fromAccountType)"){
                self.isFromAccount = true
                self.showSheet = true
            }.padding().frame(maxWidth: .infinity).background(.green).foregroundColor(.white)
            Button("To \(self.viewModel.toAccountType)"){
                self.isFromAccount = false
                self.showSheet = true
            }.padding().frame(maxWidth: .infinity).background(.green).foregroundColor(.white)
                .opacity(self.viewModel.fromAccount != nil ? 1.0 : 0.5)
                .disabled(self.viewModel.fromAccount == nil)
            TextField("Amount",text: self.$viewModel.amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
        }.padding()
    }
}
