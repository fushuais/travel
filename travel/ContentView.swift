//
//  ContentView.swift
//  travel
//
//  Created by fushuai on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LocationView()
                .tabItem {
                    Label("位置", systemImage: "map.fill")
                }
                .tag(0)
            
            FoodView()
                .tabItem {
                    Label("美食", systemImage: "fork.knife")
                }
                .tag(1)
            
            AccommodationView()
                .tabItem {
                    Label("居住", systemImage: "house.fill")
                }
                .tag(2)
        }
        .accentColor(.orange)
    }
}

#Preview {
    ContentView()
}
