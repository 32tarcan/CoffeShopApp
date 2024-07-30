//
//  ContentView.swift
//  CoffeShopApp
//
//  Created by Sakans on 29.07.2024.
//

import SwiftUI

struct MainMenu: View {
    
    @State private var selectedLocation = "Bilzen, Tanjungbalai"
    @State private var selectedCategory: String = "All Coffee"
    @State private var showLocationPicker = false
    
    var locations = ["Bilzen, Tanjungbalai", "New York, USA", "Tokyo, Japan", "Sydney, Australia"]
    var categories = ["All Coffee", "Macchiato", "Latte", "Americano"]
    
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
                    ForEach(categories, id: \.self) { category in
                        CategoryView(title: category, isSelected: category == selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .padding(.horizontal)
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    CoffeeCardView(name: "Caffe Mocha", price: "$4.53", imageName: "coffee-1", rating: 4.8, star: "star")
                    CoffeeCardView(name: "Flat White", price: "$3.15", imageName: "coffee-2", rating: 4.8, star: "star")
                    CoffeeCardView(name: "Caffe Mocha", price: "$4.88", imageName: "coffee-3", rating: 4.8, star: "star")
                    CoffeeCardView(name: "Flat White", price: "$3.09", imageName: "coffee-4", rating: 4.8, star: "star")
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
            .font(.subheadline)
            .padding(.vertical, 10)
            .padding(.horizontal, 22)
            .background(isSelected ? Color(hex: "C67C4E") : Color(hex: "EDEDED").opacity(0.3))
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(10)
        
    }
}

struct CoffeeCardView: View {
    var name: String
    var price: String
    var imageName: String
    var rating: Double
    var star: String
    
    @State private var detail = false
    
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
                    NavigationLink(
                        destination: DetailView(),
                        isActive: $detail
                    ) {
                        EmptyView()
                    }
                    Button(action: {
                        self.detail = true
                    }) {
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
