//
//  NewPurchaseOrderView.swift
//  Ori
//
//  Created by Kwasi Nsiah on 7/6/24.
//

import SwiftUI

struct NewPurchaseOrderView: View {
    @State private var description = ""
    @State private var date = ""
    @State private var metalType = ""
    @State private var grossWeightString = ""
    @State private var stoneWeightString = ""
    @State private var stoneRateString = ""
    @State private var laborRateString = ""
    
    private var grossWeight: Double {
        return Double(grossWeightString) ?? 0.0
    }
    
    private var stoneWeight: Double {
        return Double(stoneWeightString) ?? 0.0
    }
    
    private var stoneRate: Double {
        return Double(stoneRateString) ?? 0.0
    }
    
    private var stoneCost: Double {
        return stoneWeight * stoneRate
    }
    
    private var netWeight: Double {
        return (grossWeight - stoneWeight)
    }
    
    private var laborRate: Double {
        return Double(laborRateString) ?? 0.0
    }
    
    private var laborCost: Double {
        return netWeight * laborRate
    }
    
    private var pureWeight: Double {
        return 0.0
    }
    
    private var pureRate: Double {
        return 0.0
    }
    
    private var metalCost: Double {
        return 0.0
    }
    
    
    
    
    var body: some View {
        TabView {
//            VStack {
//                Text("Page 1")
//                TextField("Enter a description for this order", text: $description)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
//                HStack {
//                    TextField("mm/dd/yyyy", text: $date)
//                        .textFieldStyle(.roundedBorder)
//                        .padding()
//                        .padding(.trailing, 400 )
//                }
//                
//                TextField("Enter a description for this order", text: $metalType)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
//                    .padding(.trailing, 400 )
//                
//            }
//            
//            VStack {
//                Text("Page 2")
//                // Screen 2
//                    //  Pure Metal rate
//                    //  Vendor Code
//                    //  Ref #
//                    //  Metal Purity
//                TextField("Enter a description for this order", text: $description)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
//                TextField("Enter a description for this order", text: $description)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
//                TextField("Enter a description for this order", text: $description)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
//                TextField("Enter a description for this order", text: $description)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
//                
//            }
            
            ScrollView {
                
                VStack {
                    HStack {
                        OrderTextField(textBinding: $grossWeightString, fieldLabel: "Gross Weight", fieldPlaceholder: "Enter Gross Weight")
                        
                        Text("+")
                            .frame(width: 10)
                        
                        OrderTextField(textBinding: $stoneWeightString, fieldLabel: "Stone Weight", fieldPlaceholder: "Enter Stone Weight")
                        
                        Text("=")
                            .frame(width: 10)
                        
                        OrderTextInfo(label: "Net Weight (g)", info: String(netWeight))
                    }
                    
                    HStack {
                        OrderTextInfo(label: "Stone Weight", info: String(stoneWeight))
                        
                        Text("x")
                            .frame(width: 10)
                        
                        OrderTextField(textBinding: $stoneRateString, fieldLabel: "Stone Rate (g)", fieldPlaceholder: "Enter Stone Rate")
                        
                        Text("=")
                            .frame(width: 10)
                        
                        OrderTextInfo(label: "Stone Cost", info: String(stoneCost))
                    }
                    
                    HStack {
                        OrderTextInfo(label: "Net Weight", info: String(netWeight))
                        
                        Text("x")
                            .frame(width: 10)
                        
                        OrderTextField(textBinding: $laborRateString, fieldLabel: "Labor Rate", fieldPlaceholder: "Enter Labor Rate")
                        
                        Text("=")
                            .frame(width: 10)
                        
                        OrderTextInfo(label: "Labor Cost", info: String(laborCost))
                    }
                    
                    
                    Text("Pure Weight:")
                    Text("Pure Rate:")
                   
                    HStack {
                        VStack {
                            TotalView(label: "Total Stone Cost", valueRes: String(stoneCost))
                            TotalView(label: "Total Labor Cost", valueRes: String(laborCost))
                            TotalView(label: "Total Metal Cost", valueRes: String(metalCost))
                            TotalView(label: "Total Addtional Cost", valueRes: String(0.0))
                        }
                        .padding(.leading, 50)
                        
                        VStack {
                            Text("Total")
                                .font(.largeTitle)
                            Text("$1000")
                                .font(.largeTitle)
                        }
                        .padding(.trailing, 50)
                    }
                    .padding(.top, 100)
                }
            }
            
            VStack {
                Text("Page 4")
                //  Screen 4
                    // Summary / recipt
            }
            
            VStack {
                Text("Page 5")
                Button ("Submit") {
                    print("Submitted")
                }
                //  Screen 5
                    //  Notes
                    //  Images
            }
            
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        
        HStack {
            Spacer()
            Button("Next") {
                
            }
            .padding(.trailing, 100)
            
        }
        Spacer()
    }
}

#Preview {
    NewPurchaseOrderView()
}

struct TotalView: View {
    var label: String = ""
    var valueRes: String = ""
    var body: some View {
        HStack {
            Text(label + ":")
            Text(valueRes)
            Spacer()
        }
    }
}

struct OrderTextField: View {
    var textBinding: Binding<String>
    var fieldLabel: String
    var fieldPlaceholder: String
    var body: some View {
        VStack {
            Text(fieldLabel)
            TextField(fieldPlaceholder, text: textBinding)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .frame(width: 200)
    }
}

struct OrderTextInfo: View {
    var label: String
    var info: String
    var body: some View {
        VStack {
            Text(label)
            Text(info)
                .padding(10)
        }
        .padding()
        .frame(width: 200)
    }
}
