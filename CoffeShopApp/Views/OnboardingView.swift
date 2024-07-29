//
//  OnboardingView.swift
//  CoffeShopApp
//
//  Created by Sakans on 29.07.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var navigateToMainView = false
    
    var body: some View {
        ZStack {
            Image("onboarding")
                .resizable()
                .frame(width: 468, height: 702)
                .offset(y: -90)
            
            VStack {
                Text("Fall in love with\nCoffee in Blissful\nDelight!")
                    .foregroundStyle(.white)
                    .bold()
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(width: 400)
                Text("Welcome to our cozy coffee corner, where\nevery cup is a delightful for you.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)
                
                Button(action: {
                    self.navigateToMainView = true
                }) {
                    Text("Get Started")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.title3)
                        .frame(width: 327, height: 56)
                        .background(Color(hex: "C67C4E"))
                        .cornerRadius(16)
                        .padding()
                }
                
                Spacer()
            }
            .background(Color.black)
            .cornerRadius(25)
            .shadow(color: Color.black.opacity(0.8), radius: 20, x: 0, y: -20)
            .offset(y: 510)
            
            .fullScreenCover(isPresented: $navigateToMainView) {
                ContentView()
            }
        }
        
    }
}
#Preview {
    OnboardingView()
}
