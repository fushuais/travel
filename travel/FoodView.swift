//
//  FoodView.swift
//  travel
//
//  Created by fushuai on 2026/2/23.
//

import SwiftUI

struct Food: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let icon: String
    let price: String
}

struct FoodView: View {
    let foods = [
        Food(name: "怀石料理", description: "精致的传统日式多道料理", icon: "🍱", price: "¥5000-15000"),
        Food(name: "京都拉面", description: "浓郁的猪骨汤底配嫩滑面条", icon: "🍜", price: "¥800-1200"),
        Food(name: "抹茶甜点", description: "京都特产宇治抹茶制作的甜品", icon: "🍵", price: "¥500-1500"),
        Food(name: "豆腐料理", description: "用京都清泉制作的嫩滑豆腐", icon: "🥘", price: "¥1000-3000"),
        Food(name: "鳗鱼饭", description: "炭火烤制的香甜鳗鱼盖饭", icon: "🍚", price: "¥2000-4000"),
        Food(name: "京都寿司", description: "新鲜海鲜制作的顶级寿司", icon: "🍣", price: "¥3000-8000")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Image(systemName: "fork.knife.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.orange)
                        .padding(.top, 20)
                    
                    Text("京都美食")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("品味传统与现代融合的美味")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    
                    VStack(spacing: 12) {
                        ForEach(foods) { food in
                            FoodCard(food: food)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("京都美食")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FoodCard: View {
    let food: Food
    
    var body: some View {
        HStack(spacing: 16) {
            Text(food.icon)
                .font(.system(size: 50))
                .frame(width: 70, height: 70)
                .background(Color.orange.opacity(0.1))
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(food.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(food.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text(food.price)
                    .font(.caption)
                    .foregroundColor(.orange)
                    .fontWeight(.semibold)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    FoodView()
}
