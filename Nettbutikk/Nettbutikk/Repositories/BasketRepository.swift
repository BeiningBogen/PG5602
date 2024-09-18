//
//  BasketRepository.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 18/09/2024.
//

import Foundation

class BasketRepository {

    private var basket = [Product]()

    func getBasket() -> [Product] {
        return basket
    }

    func addToBasket(_ product: Product) {
        basket.append(product)
    }

    func removeFromBasket(_ product: Product) {
        guard let index = basket.firstIndex(of: product) else { return }
        basket.remove(at: index)
    }

    func clearBasket() {
        basket = []
    }

}
