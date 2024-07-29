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
            
            List {
                HeaderView()
                
                ForEach(viewModel.oriOrders) { order in
                    HStack {
                        Text(String(order.id))
                            .frame(width: 50)
                        Spacer()
                        Text(order.description)
                        Spacer()
                        Text(String(order.grossWeight))
                        Spacer()
                        Text(String(order.stoneWeight))
                        Spacer()
                        Text(String(order.netWeight))
                        Spacer()
                        Text(String(order.pureWeight))
                        Spacer()
                        Text(String(order.karat))
                        Spacer()
                        Text(String(order.rate))
                        Spacer()
                        Text(String(order.amount))
                        Spacer()
                        Button {
                            showOrderDetails = true
                        } label: {
                            DarkButton()
                                .sheet(isPresented: $showOrderDetails){
                                    NavigationView {
                                        VStack {
                                            
                                        }
                                    }
                                }
                        }
                    }
                    
                }
                
            }
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
            
            
        }
        .onAppear {
            viewModel.getOriOrders()
        }
        .padding()
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
            Text("Order #")
                .font(.headline)
            Spacer()
            Text("Description")
                .font(.headline)
            Spacer()
            Text("Gross Weight")
                .font(.headline)
            Spacer()
            Text("Stone Weight")
                .font(.headline)
            Spacer()
            Text("Net Weight")
                .font(.headline)
            Spacer()
            Text("Pure Weight")
                .font(.headline)
            Spacer()
            Text("Karat")
                .font(.headline)
            Spacer()
            Text("Rate")
                .font(.headline)
            Spacer()
            Text("amount")
                .font(.headline)
            Spacer()
            Text("")
            
        }
    }
}

struct DarkButton: View {
    var body: some View {
        Text("See more")
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(24)
    }
}
