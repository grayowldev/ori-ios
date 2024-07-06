//
//  OriOrder.swift
//  Ori
//
//  Created by Kwasi Nsiah on 7/6/24.
//

import Foundation

struct OriOrder: Decodable, Identifiable {
    
    let id: Int
    let description: String
    let grossWeight: Double
    let stoneWeight: Double
    let netWeight: Double
    let pureWeight: Double
    let karat: Double
    let rate: Double
    let amount: Double
    
}

struct MockData {
    static let sampleOrder = OriOrder(
        id: 123,
        description: "Test ios order",
        grossWeight: 1.2,
        stoneWeight: 2.3,
        netWeight: 1.1,
        pureWeight: 6.0,
        karat: 24.0,
        rate: 1.2,
        amount: 99.99)
    static let order = [sampleOrder, sampleOrder, sampleOrder, sampleOrder, sampleOrder]
}
