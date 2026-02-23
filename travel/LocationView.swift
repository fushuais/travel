//
//  LocationView.swift
//  travel
//
//  Created by fushuai on 2026/2/23.
//

import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageURL: String
}

struct LocationView: View {
    let locations = [
        Location(name: "清水寺", description: "京都最著名的古寺之一，世界文化遗产", imageURL: "https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800&q=80"),
        Location(name: "伏见稻荷大社", description: "以千本鸟居闻名的神社", imageURL: "https://images.unsplash.com/photo-1478436127897-769e1b3f0f36?w=800&q=80"),
        Location(name: "金阁寺", description: "金光闪闪的禅寺，京都的象征", imageURL: "https://images.unsplash.com/photo-1528360983277-13d401cdc186?w=800&q=80"),
        Location(name: "岚山竹林", description: "如诗如画的竹林小径", imageURL: "https://images.unsplash.com/photo-1545569341-9eb8b30979d9?w=800&q=80"),
        Location(name: "祇园", description: "传统艺伎区，保留江户时代风貌", imageURL: "https://images.unsplash.com/photo-1480796927426-f609979314bd?w=800&q=80"),
        Location(name: "二条城", description: "德川家康建造的世界遗产城堡", imageURL: "https://images.unsplash.com/photo-1542640244-7e672d6cef4e?w=800&q=80")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Image(systemName: "map")
                        .font(.system(size: 60))
                        .foregroundColor(.orange)
                        .padding(.top, 20)
                    
                    Text("探索京都")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("发现这座千年古都的魅力")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(locations) { location in
                            LocationCard(location: location)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("京都位置")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LocationCard: View {
    let location: Location
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            AsyncImage(url: URL(string: location.imageURL)) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Color.gray.opacity(0.2)
                        ProgressView()
                    }
                    .frame(height: 120)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 120)
                        .clipped()
                case .failure(_):
                    ZStack {
                        Color.gray.opacity(0.3)
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    }
                    .frame(height: 120)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(location.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(location.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .frame(height: 32)
            }
            .padding(12)
        }
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    LocationView()
}
