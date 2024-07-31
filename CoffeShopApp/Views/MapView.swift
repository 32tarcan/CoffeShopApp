//
//  MapView.swift
//  CoffeShopApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region)
                .frame(height: 515)
            
            // Order status
            VStack {
                Text("10 minutes left")
                    .font(.title)
                    .bold()
                Text("Delivery to Jl. Kpg Sutoyo")
                    .foregroundColor(.gray)
                ProgressView(value: 0.66)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.green))
                    .padding(.horizontal)
            }
            .padding()
            VStack {
                // Order details
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "bag.fill")
                                .foregroundColor(Color(hex: "C67C4E"))
                                .padding(8)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                            Text("Delivered your order")
                                .bold()
                        }
                        Text("We will deliver your goods to you in the shortest possible time.")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 5)
                .padding(.horizontal)
                
                // Courier details
                HStack {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text("Brooklyn Simmons")
                            .bold()
                        Text("Personal Courier")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {
                        // Call action
                    }) {
                        Image(systemName: "phone.fill")
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
                            .background(Color.white)
                            .foregroundColor(.black)
                        
                        
                    }
                }
                .padding()
            }
            .padding(.bottom, 90)
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
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                
                            }) {
                                Label("navigate", image: "navigate")
                                    .frame(width: 44, height: 44)
                                    
                            }
                        }
                    }
        }
    }
}


#Preview {
    MapView()
}
