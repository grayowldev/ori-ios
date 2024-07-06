//
//  OriOrderViewManager.swift
//  Ori
//
//  Created by Kwasi Nsiah on 7/6/24.
//

import SwiftUI

final class OriOrderViewModel: ObservableObject {
    @Published var oriOrders: [OriOrder] = []
    
    func getOriOrders() {
        NetworkManager.shared.getOrders { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let oriOrders):
                    self.oriOrders = oriOrders
                    print("success")
                case .failure(let error):
                    print(error.localizedDescription)
                    print("failed")
                }
            }
        }
    }
}
