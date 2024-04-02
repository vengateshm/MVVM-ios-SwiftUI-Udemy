//
//  AccountService.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

class AccountService {
    
    static let shared = AccountService()
    
    private init(){}
    
    func urlForGetAllAccounts() -> URL? {
        return URL(string: "http://antique-marsh-train.glitch.me/api/accounts")
    }
    
    func urlForCreateAccount() -> URL? {
        return URL(string: "http://antique-marsh-train.glitch.me/api/accounts")
    }
    
    func urlForTransferFunds() -> URL? {
        return URL(string: "http://antique-marsh-train.glitch.me/api/transfer")
    }
    
    func getAllAccounts(completion : @escaping (Result<[Account]?, NetworkError>) -> Void ){
        
        guard let url = urlForGetAllAccounts() else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let accounts = try? JSONDecoder().decode([Account].self, from: data)
            if accounts == nil {
                completion(.failure(.decodingError))
            }else {
                completion(.success(accounts))
            }
        }.resume()
    }
    
    func createAccount(createAccountRequest : CreateAccountRequest, completion : @escaping (Result<CreateAccountResponse, NetworkError>) -> Void) {
        
        guard let url = urlForCreateAccount() else {
            return completion(.failure(.badUrl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(createAccountRequest)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let createAccountResponse = try? JSONDecoder().decode(CreateAccountResponse.self, from: data)
            
            if let createAccountResponse = createAccountResponse {
                completion(.success(createAccountResponse))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func transferFunds(transferFundRequest : TransferFundRequest, completion : @escaping (Result<TransferFundResponse, NetworkError>) -> Void) {
        
        guard let url = urlForTransferFunds() else {
            return completion(.failure(.badUrl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(transferFundRequest)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let transferFundResponse = try? JSONDecoder().decode(TransferFundResponse.self, from: data)
            
            if let transferFundResponse = transferFundResponse {
                completion(.success(transferFundResponse))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
