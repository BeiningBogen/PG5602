//
//  Meal.swift
//  RatatouilleExamPractice
//
//  Created by Håkon Bogen on 30/10/2024.
//

import SwiftData
import SwiftUI
//
//@Model
//class Area {
//    
//}
//
//@Model
//class Ingredient {
//    
//}

/// Kan persisteres på disk:
@Model
class Meal: Decodable { // Decodable = Kan leses fra JSON
    
    var id: String
    var name2: String
    
    var drinkAlternative: String?
    
    required init(from decoder: any Decoder) throws {
        
        let container = try decoder.container(keyedBy: Keys.self)
        // Hent ut String fra key id i JSON
        self.id = try container.decode(String.self, forKey: .id)
        // Hent ut String hvis eksisterer i container, for key=drinkAlternative
        self.drinkAlternative = try container.decodeIfPresent(String.self, forKey: .drinkAlternative)
        self.name2 = try container.decode(String.self, forKey: .name)
    }
    
    enum Keys: String, CodingKey {
        // name i vår kode, tilsvarer strMeal i APIet
        case name = "strMeal"
        
        case drinkAlternative = "strDrinkAlternate"
        case id = "idMeal"
    }
    
}

//{
//    "meals": [
//        {
//            "idMeal": "52888",
//            "strMeal": "Eccles Cakes",
//            "strDrinkAlternate": null,
//            "strCategory": "Dessert",
//            "strArea": "British",
//            "strInstructions": "To make the pastry, dice the butter and put it in the freezer to go really hard. Tip flour into the bowl of a food processor with half the butter and pulse to the texture of breadcrumbs. Pour in the lemon juice and 100ml iced water, and pulse to a dough. Tip in the rest of the butter and pulse a few times until the dough is heavily flecked with butter. It is important that you don\u2019t overdo this as the flecks of butter are what makes the pastry flaky.\r\nOn a floured surface roll the pastry out to a neat rectangle about 20 x 30cm. Fold the two ends of the pastry into the middle (See picture 1), then fold in half (pic 2). Roll the pastry out again and refold the same way 3 more times resting the pastry for at least 15 mins each time between roll and fold, then leave to rest in the fridge for at least 30 mins before using.\r\nTo make the filling, melt the butter in a large saucepan. Take it off the heat and stir in all the other ingredients until completely mixed, then set aside.\r\nTo make the cakes, roll the pastry out until it\u2019s just a little thicker than a \u00a31 coin and cut out 8 rounds about 12cm across. Re-roll the trimming if needed. Place a good heaped tablespoon of mixture in the middle of each round, brush the edges of the rounds with water, then gather the pastry around the filling and squeeze it together (pic 3). Flip them over so the smooth top is upwards and pat them into a smooth round. Flatten each round with a rolling pin to an oval until the fruit just starts to poke through, then place on a baking tray. Cut 2 little slits in each Eccles cakes, brush generously with egg white and sprinkle with the sugar (pic 4).\r\nHeat the oven to 220C\/200C fan\/gas 8. Bake the Eccles cakes for 15-20 mins until just past golden brown and sticky. Leave to cool on a rack and enjoy while still warm or cold with a cup of tea. If you prefer, Eccles cakes also go really well served with a wedge of hard, tangy British cheese such as Lancashire or cheddar.",
//            "strMealThumb": "https:\/\/www.themealdb.com\/images\/media\/meals\/wtqrqw1511639627.jpg",
//            "strTags": "Snack,Treat",
//            "strYoutube": "https:\/\/www.youtube.com\/watch?v=xV0QCJ0GD5w",
//            "strIngredient1": "Butter",
//            "strIngredient2": "Plain Flour",
//            "strIngredient3": "Lemon",
//            "strIngredient4": "Butter",
//            "strIngredient5": "Currants",
//            "strIngredient6": "Mixed Peel",
//            "strIngredient7": "Muscovado Sugar",
//            "strIngredient8": "Cinnamon",
//            "strIngredient9": "Ginger",
//            "strIngredient10": "Allspice",
//            "strIngredient11": "Lemon",
//            "strIngredient12": "Eggs",
//            "strIngredient13": "Sugar",
//            "strIngredient14": "",
//            "strIngredient15": "",
//            "strIngredient16": "",
//            "strIngredient17": "",
//            "strIngredient18": "",
//            "strIngredient19": "",
//            "strIngredient20": "",
//            "strMeasure1": "250g",
//            "strMeasure2": "350g",
//            "strMeasure3": "Juice of 1\/2",
//            "strMeasure4": "25g",
//            "strMeasure5": "200g",
//            "strMeasure6": "50g",
//            "strMeasure7": "100g ",
//            "strMeasure8": "1 tsp ",
//            "strMeasure9": "1 tsp ",
//            "strMeasure10": "1 tsp ",
//            "strMeasure11": "Zest of 1",
//            "strMeasure12": "1 beaten",
//            "strMeasure13": "spinkling",
//            "strMeasure14": "",
//            "strMeasure15": "",
//            "strMeasure16": "",
//            "strMeasure17": "",
//            "strMeasure18": "",
//            "strMeasure19": "",
//            "strMeasure20": "",
//            "strSource": "https:\/\/www.bbcgoodfood.com\/recipes\/786659\/eccles-cakes",
//            "strImageSource": null,
//            "strCreativeCommonsConfirmed": null,
//            "dateModified": null
//        }
//    ]
//}
