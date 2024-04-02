//
//  AccountSummaryScreen.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation
import SwiftUI

enum ActiveSheet {
    case addAccount
    case transferFunds
}

struct AccountSummaryScreen : View {
    @ObservedObject private var accountSummaryViewModel = AccountSummaryViewModel()
    
    @State private var isPresented : Bool = false
    @State private var activeSheet : ActiveSheet = .addAccount
    
    var body : some View {
        VStack {
            GeometryReader { g in
                VStack{
                    AccountListView(accounts: accountSummaryViewModel.accounts)
                        .frame(height:g.size.height/2)
                    Text("\(accountSummaryViewModel.total.formatAsCurrency())")
                    Spacer()
                    Button("Transfer Funds") {
                        self.activeSheet = .transferFunds
                        self.isPresented = true
                    }
                }
            }
        }
        .onAppear {
            self.accountSummaryViewModel.getAllAccounts()
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            self.accountSummaryViewModel.getAllAccounts()
        }){
            if self.activeSheet == .transferFunds {
                TransferFundsScreen()
            } else if self.activeSheet == .addAccount {
                AddAccountScreen()
            }
        }
        .navigationBarItems(trailing: Button("Add Account"){
            self.activeSheet = .addAccount
            self.isPresented = true
        })
        .navigationBarTitle("Account Summary")
        .embedInNavigationView()
    }
}
