//
//  InventoryView.swift
//  Ori
//
//  Created by Kwasi Nsiah on 8/2/24.
//

import SwiftUI

struct InventoryView: View {
    @StateObject var viewModel = OriInventoryViewModel()
    @State var showNewItemSheet = true;
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Button("Add New Item", action: {})
            }
            HeaderView(activeView:  AvailableViews.inventory)
            ForEach(viewModel.oriInventoryItem) { item in
                InventoryItemRow(item: item)
            }
        }
        .onAppear {
            viewModel.getOriInventoryItems()
        }
        .sheet(isPresented: $showNewItemSheet, content: {
            Text("New Item Form goes here!!")
        })
        
    }
}

#Preview {
    InventoryView()
}

struct InventoryItemRow: View {
    var item: OriInventoryItem
    @State var showOrderDetails = false
    var body: some View {
        HStack {
            TableCol(text: item.name, width: 160)
            Spacer()
            TableCol(text: item.sku, width: 160)
            Spacer()
            TableCol(text: String(format: "%.2f", item.goldGrossWeight), width: 200)
            Spacer()
            TableCol(text: String(item.location), width: 160)
            Spacer()
            
            Button {
                showOrderDetails = true
            } label: {
                DarkButton()
                    .sheet(isPresented: $showOrderDetails){
                        NavigationView {
                            ScrollView {
                                VStack {
//                                    Text("Order Id: " + String(order.id))
                                    Text("ORDER DETAILS")
//                                    OrderInfoItem(
//                                        name: "Name", value: String(order.description))
//                                    OrderInfoItem(
//                                        name: "Gross Weight", value: String(order.grossWeight))
//                                    OrderInfoItem(
//                                        name: "Stone Weight", value: String(order.stoneWeight))
//                                    OrderInfoItem(
//                                        name: "Net weight", value: String(order.netWeight))
//                                    OrderInfoItem(
//                                        name: "Pure Weight", value: String(order.pureWeight))
//                                    OrderInfoItem(
//                                        name: "Karat", value: String(order.karat))
//                                    OrderInfoItem(
//                                        name: "Rate", value: String(order.rate))
//                                    OrderInfoItem(
//                                        name: "Amount", value: "$" + String(order.amount))
                                }
                            }
                        }
                    }
            }
            .frame(width: 160)
            .padding(.trailing, 18)
            
        }
    }
}
