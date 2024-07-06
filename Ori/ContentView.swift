//
//  ContentView.swift
//  Ori
//
//  Created by Kwasi Nsiah on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    @State var showsheet = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
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

//#Preview {
//    ContentView()
}
