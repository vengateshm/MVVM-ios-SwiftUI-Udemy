//
//  AccountListView.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation
import SwiftUI

struct AccountListView : View {
    let accounts : [AccountUIModel]
    
    var body : some View {
        List(accounts, id: \.accountId) { account in
            AccountCellView(account:account)
        }
    }
}

struct AccountCellView : View {
    let account:AccountUIModel
    var body: some View{
        HStack {
            VStack(alignment: .leading, spacing: 10){
                Text(account.name).font(.headline)
                Text(account.accountType).opacity(0.5)
            }
            Spacer()
            Text("\(account.balance.formatAsCurrency())")
                .foregroundColor(.green)
        }
    }
}
