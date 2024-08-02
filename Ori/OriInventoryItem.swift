//
//  OriInventoryItem.swift
//  Ori
//
//  Created by Kwasi Nsiah on 8/2/24.
//

import Foundation

struct OriInventoryItem: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let sku = "None"
//    let metalType: String
    let goldGrossWeight: Double
    let location = "None"
}

struct MockInventoryData {
    static let sampleInventoryItem = OriInventoryItem (
        id: 123,
        name: "Something's gone wrong",
//        sku: "Sample SKU"
//        metalType: "Gold",
        goldGrossWeight: 1.2
//        location: "Test location")
        )
    static let item = [sampleInventoryItem, sampleInventoryItem, sampleInventoryItem]
}

