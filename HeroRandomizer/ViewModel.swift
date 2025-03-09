//
//  ViewModel.swift
//  HeroRandomizer
//
//  Created by Aziza Gilash on 06.03.2025.
//

import Foundation

// MARK: - ViewModel
final class ViewModel: ObservableObject {
    @Published var selectedHero: Hero?
    @Published var heroDetails: [String] = [] // Stores 10 parameters

    // MARK: - Fetch Hero
    func fetchHero() async {
        guard let url = URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json") else {
            return
        }

        let urlRequest = URLRequest(url: url)

        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let heroes = try JSONDecoder().decode([Hero].self, from: data)
            let randomHero = heroes.randomElement()

            await MainActor.run {
                selectedHero = randomHero
                heroDetails = generateHeroDetails(for: randomHero)
            }
        } catch {
            print("Error: \(error)")
        }
    }

    // MARK: - Generate 10 Parameters
    private func generateHeroDetails(for hero: Hero?) -> [String] {
        guard let hero = hero else { return [] }
        
        return [
//            "Name: \(hero.name)",
            "Full Name: \(hero.biography.fullName)",
            "Alignment: \(hero.biography.alignment.capitalized)",
            "First Appearance: \(hero.biography.firstAppearance)",
            "Publisher: \(hero.biography.publisher ?? "Unknown")",
            "Intelligence: \(hero.powerstats.intelligence)",
            "Strength: \(hero.powerstats.strength)",
            "Speed: \(hero.powerstats.speed)",
            "Durability: \(hero.powerstats.durability)",
            "Occupation: \(hero.work.occupation)"
        ]
    }
}
