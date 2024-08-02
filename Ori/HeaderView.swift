//
//  HeaderView.swift
//  Ori
//
//  Created by Kwasi Nsiah on 8/2/24.
//

import SwiftUI

struct HeaderView: View {
    var activeView: AvailableViews
    var body: some View {
        switch activeView {
        case .ordering:
            HStack {
                OrderIdCol(isHeader: true, text: "Order #")
                Spacer()
                TableCol(isHeader: true, text: "Description", width: 200)
                Spacer()
                TableCol(isHeader: true, text: "Gross Weight", width: 148)
                Spacer()
                TableCol(isHeader: true, text: "Stone Weight", width: 160)
                Spacer()
                TableCol(isHeader: true, text: "Net Weight", width: 160)
                Spacer()
                TableCol(isHeader: true, text: "Karat", width: 100)
                Spacer()
                TableCol(isHeader: true, text: "", width: 160)
            }
            .frame(height: 50)
            .background(Color.black)
            .foregroundColor(.white)
        case .inventory:
            HStack {
                OrderIdCol(isHeader: true, text: "Item name")
                Spacer()
                TableCol(isHeader: true, text: "SKU", width: 200)
                Spacer()
                TableCol(isHeader: true, text: "Gross Weight", width: 148)
                Spacer()
                TableCol(isHeader: true, text: "Location", width: 160)
                Spacer()
                TableCol(isHeader: true, text: "", width: 160)
            }
            .frame(height: 50)
            .background(Color.black)
            .foregroundColor(.white)
        }
        
    }
}

//#Preview {
//    HeaderView()
//}
