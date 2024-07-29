//
//  ContentView.swift
//  CoffeShopApp
//
//  Created by Sakans on 29.07.2024.
//


import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                MainMenu()
                    .tabItem {
                        Image(systemName: "house")
                    }
                    .tag(0)
                
                FavoritesView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .tag(1)
                
                CartView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                    .tag(2)
                
                NotificationView()
                    .tabItem {
                        Image(systemName: "person")
                    }
                    .tag(3)
            }
            .accentColor(Color(hex: "C67C4E"))
        }
    }
}


#Preview {
    ContentView()
}
