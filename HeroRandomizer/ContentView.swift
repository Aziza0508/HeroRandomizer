//
//  ContentView.swift
//  HeroRandomizer
//
//  Created by Aziza Gilash on 06.03.2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            // Image
            AsyncImage(url: viewModel.selectedHero?.imageUrl) { phase in
                switch phase {
                case .empty:
                    Image("noPhoto")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(10)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(10)
                case .failure:
                    Color.red.frame(height: 300)
                @unknown default:
                    Color.gray.frame(height: 300)
                }
            }
            .padding(32)
            
            // Details
            if let selectedHero = viewModel.selectedHero {
                Text(selectedHero.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 8)
                
                List(viewModel.heroDetails, id: \.self) { detail in
                    Text(detail)
                        .font(.body)
                }
                .frame(height: 300)
            } else {
                Text("No hero selected yet")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button {
                Task {
                    await viewModel.fetchHero()
                }
            } label: {
                Text("Roll Hero")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 32)
            }
            .padding(.bottom, 20)
        }
    }
    
}

#Preview {
    let viewModel = ViewModel()
    return ContentView(viewModel: viewModel)
}
