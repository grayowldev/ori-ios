//
//  ContentView.swift
//  Ori
//
//  Created by Kwasi Nsiah on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = OriOrderViewModel()
    @State var showsheet = false
    @State var showOrderDetails = false
    @Environment(\.dismiss) var dismiss
    
    
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
            
            HeaderView()
            VStack {
                ForEach(viewModel.oriOrders) { order in
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
                    Divider()
                }
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
    ContentView()
}

struct HeaderView: View {
    var body: some View {
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
        
    }
}

struct DarkButton: View {
    var body: some View {
        Text("See more")
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(18)
    }
}

struct OrderIdCol: View {
    var isHeader: Bool = false
    var text: String
    var body: some View {
        Text(text)
            .font(isHeader ? .headline : .body)
            .frame(width: 82)
            .padding(.leading, 42)
//            .background(.blue)
    }
}

struct TableCol: View {
    var isHeader: Bool = false
    var text: String
    var width: CGFloat
    var body: some View {
        Text(text)
            .font(isHeader ? .headline : .body)
            .frame(width: width)
//            .background(.red)
    }
}

struct OrderInfoItem: View {
    var name: String
    var value: String
    var body: some View {
        VStack {
            Text(name)
                .fontWeight(.semibold)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            Text(value)
                .font(.system(size: 64))
                .fontWeight(.thin)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading, 42)
        .padding(.bottom, 22)
        .foregroundStyle(.black)
    }
}
