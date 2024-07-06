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
            List(viewModel.oriOrders) { order in
                Text(order.description)
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                showsheet = true
            } label: {
                Text("Click here")
            }
            
        }
        .onAppear {
            viewModel.getOriOrders()
        }
        .padding()
        .sheet(isPresented: $showsheet) {
            NavigationView {
                        VStack {
                            Text("This is a sheet view")
                                .padding()
                            Button("Dismiss") {
                                dismiss()
                            }
                        }
                        .navigationTitle("Sheet")
                        .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
