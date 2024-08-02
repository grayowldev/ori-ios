//
//  OriInventoryViewModel.swift
//  Ori
//
//  Created by Kwasi Nsiah on 8/2/24.
//

import SwiftUI

final class OriInventoryViewModel: ObservableObject {
    @Published var oriInventoryItem: [OriInventoryItem] = []
    
    func getOriInventoryItems() {
        NetworkManager.shared.getIInventoryItems { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let oriItem):
                    self.oriInventoryItem = oriItem
                case .failure(let error):
                    print(error.localizedDescription)
                    print("failed to get inventory items")
                }
            }
        }
    }
}
