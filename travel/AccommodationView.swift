//
//  AccommodationView.swift
//  travel
//
//  Created by fushuai on 2026/2/23.
//

import SwiftUI

struct Accommodation: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let description: String
    let price: String
    let rating: Double
}

struct AccommodationView: View {
    let accommodations = [
        Accommodation(name: "京都传统町屋", type: "传统民宿", description: "体验正宗的京都传统住宅", price: "¥15000/晚", rating: 4.8),
        Accommodation(name: "祇园温泉旅馆", type: "日式旅馆", description: "享受温泉和传统服务", price: "¥25000/晚", rating: 4.9),
        Accommodation(name: "京都精品酒店", type: "现代酒店", description: "现代设施与传统美学结合", price: "¥12000/晚", rating: 4.6),
        Accommodation(name: "岚山禅意民宿", type: "民宿", description: "竹林环绕的静谧住所", price: "¥18000/晚", rating: 4.7),
        Accommodation(name: "五星级度假村", type: "度假村", description: "豪华设施和顶级服务", price: "¥35000/晚", rating: 5.0),
        Accommodation(name: "青年背包客栈", type: "青年旅社", description: "经济实惠的住宿选择", price: "¥3000/晚", rating: 4.3)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Image(systemName: "bed.double.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.orange)
                        .padding(.top, 20)
                    
                    Text("住在京都")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("从传统町屋到现代酒店，总有适合您的")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    
                    VStack(spacing: 12) {
                        ForEach(accommodations) { accommodation in
                            AccommodationCard(accommodation: accommodation)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("京都居住")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AccommodationCard: View {
    let accommodation: Accommodation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(accommodation.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(accommodation.type)
                        .font(.caption)
                        .foregroundColor(.orange)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(8)
                }
                
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Text(String(format: "%.1f", accommodation.rating))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
            }
            
            Text(accommodation.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
            
            HStack {
                Text(accommodation.price)
                    .font(.headline)
                    .foregroundColor(.orange)
                
                Spacer()
                
                Button(action: {}) {
                    Text("查看详情")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.orange)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    AccommodationView()
}
