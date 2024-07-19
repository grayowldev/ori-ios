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
                            
                        } label: {
                            Text("See more")
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
//                            Text("This is a sheet view")
//                                .padding()
//                            Button("Dismiss") {
//                                dismiss()
//                            }
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
            Text("Description")
                .font(.headline)
            Spacer()
            Text("Description")
                .font(.headline)
            Spacer()
            Text("Description")
                .font(.headline)
            Spacer()
            Text("Description")
                .font(.headline)
            Spacer()
            Text("Description")
                .font(.headline)
            Spacer()
            Text("Description")
                .font(.headline)
            Spacer()
            Text("Description")
                .font(.headline)
            
        }
    }
}
