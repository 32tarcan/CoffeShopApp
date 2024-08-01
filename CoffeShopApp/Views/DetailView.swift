//
//  DetailView.swift
//  CoffeShopApp
//
//  Created by Sakans on 30.07.2024.
//


import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isViewed = false
    @State private var selectedSize: String? = "M"
    @State private var orderNav = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("coffee-2")
                    .resizable()
                    .cornerRadius(16)
                    .frame(width: 327, height: 202)
                
                VStack {
                    Text("Description")
                        .font(.headline)
                        .padding()
                        .offset(x: -120)
                    
                    Text("A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the foA cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the foA cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the foA cappuccinoA cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the foA cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the foA cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the foA cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    
                   
                    
                }
                .offset(y: 150)
                
                VStack {
                    Text("Size")
                        .font(.headline)
                        .padding()
                        .offset(x: -150)
                    
                    HStack {
                        ForEach(["S", "M", "L"], id: \.self) { size in
                            Button(action: {
                                selectedSize = size
                            }) {
                                Text(size)
                                    .font(.headline)
                                    .frame(width: 96, height: 41)
                                    .background(selectedSize == size ? Color(hex: "C67C4E").opacity(0.2) : Color(hex: "F9F2ED"))
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color(hex: "C67C4E"), lineWidth: selectedSize == size ? 2 : 0)
                                    )
                                    .padding(.horizontal, 5)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding(.top, 200)
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("Price")
                            .font(.headline)
                        
                        
                        Text("$ 4.53")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(Color(hex: "C67C4E"))
                        
                    }
                    .padding()
                    .offset(x: 20)
                    
                    Button(action: {
                        self.orderNav = true
                    }) {
                        Text("Buy Now")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 217, height: 56)
                            .background(Color(hex: "C67C4E"))
                            .cornerRadius(16)
                            .padding()
                    }
                    .offset(x: 50)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: OrderView(),
                        isActive: $orderNav
                    ) {
                        EmptyView()
                    }
                }
                .background(.gray.opacity(0.1))
               
                .cornerRadius(16)
                
            }
            .padding(.bottom, -10)
            .padding(.top)
            
        }
        .navigationBarTitle("Detail", displayMode: .inline)
        .navigationBarItems(
            trailing: Button(action: {
                // Action for trailing button
            }) {
                Image("heart")
                    .foregroundColor(.black)
            }
                .navigationBarBackButtonHidden(true)
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Button(action: {
                                    dismiss()
                                }) {
                                    Label("Back", image: "back")
                                        .frame(width: 44, height: 44)
                                        
                                }
                            }
                        }
    )}
}


#Preview {
    DetailView()
}
