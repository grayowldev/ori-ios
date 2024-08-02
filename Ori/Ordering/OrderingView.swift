//
//  OrderingView.swift
//  Ori
//
//  Created by Kwasi Nsiah on 8/2/24.
//

import SwiftUI

struct OrderingView: View {
    @State var showsheet = false
    @State var showOrderDetails = false
    
    @StateObject var viewModel = OriOrderViewModel()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    showsheet = true
                } label: {
                    Text("Add Order")
                }
                .padding(.trailing, 28)
            }
            HeaderView(activeView:  AvailableViews.ordering)
            ForEach(viewModel.oriOrders) { order in
                OrderRow(order: order)
                Divider()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            viewModel.getOriOrders()
        }
        .sheet(isPresented: $showsheet) {
            NavigationView {
                        VStack {
                            NewPurchaseOrderView()
                        }
                        .navigationTitle("New Purchase Order")
                        .navigationBarTitleDisplayMode(.inline)
                        .padding()
            }
        }
    }
}

#Preview {
    OrderingView()
}

struct OrderRow: View {
    var order: OriOrder
    @State var showOrderDetails = false
    var body: some View {
        HStack {
            OrderIdCol(text: String(order.id))
            Spacer()
            TableCol(text: order.description, width: 200)
            Spacer()
            TableCol(text: String(format: "%.2f", order.grossWeight), width: 148)
            Spacer()
            TableCol(text: String(format: "%.2f",order.stoneWeight), width: 160)
            Spacer()
            TableCol(text: String(format: "%.2f",order.netWeight), width: 160)
            Spacer()
            TableCol(text: String(order.karat), width: 100)
            
            Button {
                showOrderDetails = true
            } label: {
                DarkButton()
                    .sheet(isPresented: $showOrderDetails){
                        NavigationView {
                            ScrollView {
                                VStack {
                                    Text("Order Id: " + String(order.id))
                                    Text("ORDER DETAILS")
                                    OrderInfoItem(
                                        name: "Name", value: String(order.description))
                                    OrderInfoItem(
                                        name: "Gross Weight", value: String(order.grossWeight))
                                    OrderInfoItem(
                                        name: "Stone Weight", value: String(order.stoneWeight))
                                    OrderInfoItem(
                                        name: "Net weight", value: String(order.netWeight))
                                    OrderInfoItem(
                                        name: "Pure Weight", value: String(order.pureWeight))
                                    OrderInfoItem(
                                        name: "Karat", value: String(order.karat))
                                    OrderInfoItem(
                                        name: "Rate", value: String(order.rate))
                                    OrderInfoItem(
                                        name: "Amount", value: "$" + String(order.amount))
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
