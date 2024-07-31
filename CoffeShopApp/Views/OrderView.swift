//
//  OrderView.swift
//  CoffeShopApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI

struct OrderView: View {
    @State private var isDeliverySelected = true
    @State private var quantity = 1
    @State private var deliver: String = "Deliver"
    
    var body: some View {
            VStack {
                Picker("", selection: $deliver) {
                           Text("Deliver").tag("Deliver")
                           Text("Pick Up").tag("Pick Up")
                       }
                       .pickerStyle(SegmentedPickerStyle())
                       .padding()
                       .accentColor(Color(hex: "C67C4E"))
                
                VStack(alignment: .leading) {
                    Text("Delivery Address")
                        .font(.headline)
                        .padding(.vertical)
                    
                    Text("Jl. Kpg Sutoyo")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.black)
                    Text("Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Button(action: {
                            // Edit address action
                        }) {
                            HStack {
                                Image(systemName: "pencil")
                                Text("Edit Address")
                            }
                            .padding(.horizontal, -70)
                            .frame(width: 160, height: 26)
                            .background(Color.white) // Arka plan rengi
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        Button(action: {
                            // Add note action
                        }) {
                            HStack {
                                Image(systemName: "note.text")
                                Text("Add Note")
                            }
                            .padding()
                            .frame(width: 160, height: 26)
                            .background(Color.white) // Arka plan rengi
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                    }
                    .foregroundColor(Color.black)
                    
                    
                }
                .padding()
                
                
                HStack {
                    Image("coffee-2")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                    VStack(alignment: .leading) {
                        Text("Caffe Mocha")
                            .font(.headline)
                        Text("Deep Foam")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            if quantity > 1 {
                                quantity -= 1
                            }
                        }) {
                            Image(systemName: "minus.circle")
                                .foregroundColor(.black)
                        }
                        Text("\(quantity)")
                            .padding(.horizontal)
                        Button(action: {
                            quantity += 1
                        }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
                .padding(.bottom, 20)
                
                // Discount
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "percent")
                            .foregroundColor(Color(hex: "C67C4E"))
                            .padding()
                        Text("1 Discount is Applies")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding()
                            .foregroundColor(.black)
                    }
                    
                }
                .frame(width: 327, height: 56)
                .background(.gray.opacity(0.1))
                .cornerRadius(16)
                
                
                
                VStack(alignment: .leading) {
                    Text("Payment Summary")
                        .font(.headline)
                        .padding(.vertical)
                    HStack {
                        Text("Price")
                        Spacer()
                        Text("$ 4.53")
                    }
                    HStack {
                        Text("Delivery Fee")
                        Spacer()
                        Text("$ 2.0")
                            .strikethrough()
                        Text("$ 1.0")
                    }
                }
                .padding()
                .padding(.bottom, 20)
                
                
                
                VStack {
                    VStack(alignment: .leading) {
                        
                        Image(systemName: "creditcard")
                            .foregroundColor(Color(hex: "C67C4E"))
                            .offset(y: 30)
                            .padding(.horizontal, -30)
                        Text("Cash/Wallet")
                            .font(.headline)
                        Text("$ 5.53")
                            .font(.headline)
                            .foregroundColor(Color(hex: "C67C4E"))
                    }
                    .offset(x: -100, y: -15)
                    
                    Button(action: {
                        // Order action
                    }) {
                        Text("Order")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 327, height: 56)
                            .background(Color(hex: "C67C4E"))
                            .cornerRadius(16)
                    }
                }
                .frame(width: 395, height: 165)
                .background(.gray.opacity(0.1))
                .cornerRadius(16)
                .padding(.bottom, -40)
                
            }
            .navigationBarTitle("Order", displayMode: .inline)
            
    }
}

#Preview {
    OrderView()
}
