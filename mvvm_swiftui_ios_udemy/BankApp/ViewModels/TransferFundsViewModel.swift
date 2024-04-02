//
//  TransferFundsViewModel.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/04/24.
//

import Foundation

class TransferFundsViewModel : ObservableObject {
    
    var fromAccount : AccountUIModel?
    var toAccount : AccountUIModel?
    
    @Published var accounts:[AccountUIModel] = [AccountUIModel]()
    @Published var message: String?
    var amount: String = ""
    
    var isAmountValid: Bool {
        guard let userAmount = Double(amount) else {
            return false
        }
        
        return userAmount <= 0 ? false : true
    }
    
    var filteredAccounts: [AccountUIModel] {
        if self.fromAccount == nil {
            return accounts
        } else {
            return accounts.filter {
                guard let fromAccount = self.fromAccount else {
                    return false
                }
                return $0.accountId  != fromAccount.accountId
            }
        }
    }
    
    var fromAccountType: String {
        fromAccount != nil ? fromAccount!.accountType : ""
    }
    
    var toAccountType: String {
        toAccount != nil ? toAccount!.accountType : ""
    }
    
    func populateAccounts() {
        AccountService.shared.getAllAccounts { result in
            switch result {
            case .success(let accounts):
                if let accounts = accounts {
                    DispatchQueue.main.async {
                        self.accounts = accounts.map(AccountUIModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func isValid() -> Bool {
        return isAmountValid
    }
    
    func submitTransfer(completion: @escaping () -> Void) {
        
        if !isValid() {
            return
        }
        
        guard let frmAcct = fromAccount,
              let toAcct = toAccount,
              let amt = Double(amount) 
        else {
            return
        }
        
        let request = TransferFundRequest(
            accountFromId: frmAcct.accountId.lowercased(),
            accountToId: toAcct.accountId.lowercased(),
            amount: amt
        )
        
        AccountService.shared.transferFunds(transferFundRequest: request) { result in
            switch result {
            case .success(let response):
                if response.success {
                    completion()
                } else {
                    self.message = response.error
                }
            case .failure(let error):
                self.message = error.localizedDescription
            }
        }
    }
}
