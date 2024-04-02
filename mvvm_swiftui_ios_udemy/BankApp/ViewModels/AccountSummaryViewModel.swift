//
//  AccountSummaryViewModel.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

class AccountSummaryViewModel : ObservableObject {
    private var _accountModels = [Account]()
    @Published var accounts : [AccountUIModel] = [AccountUIModel]()
    
    var total:Double{
        _accountModels.map {$0.balance}.reduce(0,+)
    }
    
    func getAllAccounts() {
        AccountService.shared.getAllAccounts { result in
            switch result {
            case .success(let accounts):
                if let accounts = accounts {
                    self._accountModels = accounts
                    DispatchQueue.main.async {
                        self.accounts = accounts.map(AccountUIModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

class AccountUIModel {
    var account:Account
    
    init(account: Account) {
        self.account = account
    }
    
    var name: String{
        account.name
    }
    
    var accountId: String{
        account.id.uuidString
    }
    
    var accountType: String{
        account.accountType.title
    }
    
    var balance: Double{
        account.balance
    }
}
