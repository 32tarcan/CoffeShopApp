//
//  ContentView.swift
//  CoffeShopApp
//
//  Created by Sakans on 29.07.2024.
//

import SwiftUI

struct MainMenu: View {
    
    @State private var selectedLocation = "Bilzen, Tanjungbalai"
    @State private var showLocationPicker = false
    
    var locations = ["Bilzen, Tanjungbalai", "New York, USA", "Tokyo, Japan", "Sydney, Australia"]
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 4) {
                           Text("Location")
                               .foregroundColor(.gray)
                           
                           Menu {
                               ForEach(locations, id: \.self) { location in
                                   Button(action: {
                                       selectedLocation = location
                                   }) {
                                       Text(location)
                                           .foregroundColor(Color(hex: "D8D8D8")) 
                                   }
                               }
                           } label: {
                               HStack {
                                   Text(selectedLocation)
                                       .bold()
                                   Image(systemName: "chevron.down")
                               }
                               .foregroundColor(.black)
                           }
                       }
                       .padding(.horizontal)
            
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search coffee", text: .constant(""))
                }
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(10)
                
                Button(action: {}) {
                    Image(systemName: "slider.horizontal.3")
                        .padding()
                        .background(Color(hex: "C67C4E"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            ZStack(alignment: .topLeading) {
                Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .background(Color(hex: "C67C4E"))
                    .cornerRadius(20)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Promo")
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    
                    Text("Buy one get\none FREE")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                .padding()
            }
            .padding(.horizontal)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CategoryView(title: "All Coffee", isSelected: true)
                    CategoryView(title: "Macchiato")
                    CategoryView(title: "Latte")
                    CategoryView(title: "Americano")
                }
                .padding(.horizontal)
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    CoffeeCardView(name: "Caffe Mocha", price: "$4.53", imageName: "coffee-1", rating: 4.8, star: "star")
                    CoffeeCardView(name: "Flat White", price: "$3.53", imageName: "coffee-2", rating: 4.8, star: "star")
                    CoffeeCardView(name: "Caffe Mocha", price: "$4.53", imageName: "coffee-3", rating: 4.8, star: "star")
                    CoffeeCardView(name: "Flat White", price: "$3.53", imageName: "coffee-4", rating: 4.8, star: "star")
                }
                .padding()
            }
        }
    }
}

struct CategoryView: View {
    var title: String
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .padding()
            .background(isSelected ? Color(hex: "C67C4E") : Color.clear)
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color(hex: "C67C4E") : Color.gray, lineWidth: 1)
            )
    }
}

struct CoffeeCardView: View {
    var name: String
    var price: String
    var imageName: String
    var rating: Double
    var star: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            HStack {
                Text(name)
                    .font(.headline)
                Spacer()
                Image("star")
                Text(String(format: "%.1f", rating))
                    .padding(4)
                
            }
            Text(price)
                .font(.subheadline)
            Spacer()
            HStack {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color(hex: "C67C4E"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}



#Preview {
    MainMenu()
}
