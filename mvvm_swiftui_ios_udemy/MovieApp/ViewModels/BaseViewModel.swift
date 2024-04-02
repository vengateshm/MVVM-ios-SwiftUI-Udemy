//
//  BaseViewModel.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

enum UIState {
    case loading, success, failure, nodata
}

class BaseViewModel : ObservableObject {
    @Published var uiState : UIState = .nodata
}
