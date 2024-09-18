//
//  FavoriteProductsRepository.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 18/09/2024.
//

import Foundation

struct FavoriteProductsRepository {

    static let favoriteProductsKey = "favoriteProductsKey"

    // getProducts

    func getProducts() -> [Product] {
        guard let data = UserDefaults.standard.data(forKey: Self.favoriteProductsKey) else {
            return []
        }
        do {
            let decodedArray = try JSONDecoder().decode([Product].self, from: data)
            return decodedArray
        } catch {
            print(error)
        }
        return []
    }

    // addToFavorites

    func toggleFavorite(_ product: Product) {
        let currentFavorites = getProducts()
        guard currentFavorites.firstIndex(of: product) != nil else {
            addToFavorites(product)
            return
        }
        removeFromFavorites(product)
    }

    func addToFavorites(_ product: Product) {
        var currentFavorites = getProducts()
        currentFavorites.append(product)
        save(currentFavorites)
    }

    func removeFromFavorites(_ product: Product) {
        var currentFavorites = getProducts()
        guard let index = currentFavorites.firstIndex(of: product) else { return }
        currentFavorites.remove(at: index)
        save(currentFavorites)
    }

    // MARK: - Private

    private func save(_ products: [Product]) {
        do {
            let encoded = try JSONEncoder().encode(products)
            UserDefaults.standard.set(encoded, forKey: Self.favoriteProductsKey)
        } catch {
            print("error")
        }
    }

}
