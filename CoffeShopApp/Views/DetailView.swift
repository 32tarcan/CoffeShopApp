//
//  DetailView.swift
//  CoffeShopApp
//
//  Created by Sakans on 30.07.2024.
//


import SwiftUI

struct DetailView: View {
    
    @State private var isViewed = false
    @State private var selectedSize: String? = "M"
    
    var body: some View {
        VStack {
            Image("heart")
                .offset(x: 150)
            
            Image("coffee-2")
                .resizable()
                .cornerRadius(16)
                .frame(width: 347, height: 202)
            
            
            Text("Description")
                .font(.headline)
                .padding()
                .offset(x: -120)
            
            
            Text("A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk the fo... A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk the fo A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk the fo")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .lineLimit(isViewed ? nil : 2)
                .padding(.horizontal)
            
            Button(action: {
                isViewed.toggle()
            }) {
                Text(isViewed ? "Read Less" : "Read More")
                    .foregroundColor(Color(hex: "C67C4E"))
            }
            
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
                    // Action for Buy Now button
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
                .padding(.top, -10)
                
                Spacer()
            }
        }
        .padding(.top)
        .background(Color.white)
    }
}


#Preview {
    DetailView()
}
