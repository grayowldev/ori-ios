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
    @State var visibility: NavigationSplitViewVisibility = .detailOnly
    @State var selectedView: AvailableViews? = AvailableViews.inventory
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            List {
                Button(
                    "Dashboard"
                ){
//                    selectedView = "dashboard"
                }
                Button(
                    "Inventory"
                ){
                    selectedView = AvailableViews.inventory
                }
                Button(
                    "Ordering"
                ){
                    selectedView = AvailableViews.ordering
                }
                Button(
                    "Branches"
                ){
//                    selectedView = "branches"
                }
                Button(
                    "Bin"
                ){
//                    selectedView = "bin"
                }
                Button(
                    "Settings"
                ){
//                    selectedView = "settings"
                }
            }
            .navigationTitle("Ori")
        } detail: {
            if let selectedView {
                switch selectedView {
                case .inventory:
                    InventoryView()
                    Spacer()
                case .ordering:
                    OrderingView()
                    Spacer()
                }
                    
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}

enum AvailableViews: String, CaseIterable {
    case inventory, ordering
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
