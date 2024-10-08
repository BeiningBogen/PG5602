//
//  HomeView.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 04/09/2024.
//

import Foundation
import SwiftUI

enum ClothingType: String, CaseIterable, Identifiable {
    
    public var id: String {
        return rawValue
    }
    
    case klær = "Klær"
    case sko = "Sko"
    case accessories = "Accessories"
    case streetwear = "Streetwear"


    var url: URL {
        switch self {
            case .klær:
                return URL.init(string: "https://raw.githubusercontent.com/BeiningBogen/PG5602/refs/heads/master/Nettbutikk/products.json")!
                
            case .sko:
                return URL.init(string: "https://raw.githubusercontent.com/BeiningBogen/PG5602/refs/heads/master/Nettbutikk/sko.json")!
            
            default:
                return URL.init(string: "https://raw.githubusercontent.com/BeiningBogen/")!
        }
    }
    
}


struct HomeView: View {
    
    @State var isShowingSheet = false
    
    @State var selectedClothingType: ClothingType = .klær
    
    func didTap(clothingType: ClothingType) {
        print("Tapped \(clothingType)")
        
        selectedClothingType = clothingType
        isShowingSheet = true
    }
    
    
    var body: some View {
        
        VStack {
            
            ZStack {
                Color.orange
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("Kickstart høsten")
                            .rainbowStyle()
//                            .pulseEffect()
//                            .modifier(RainbowModifier())
                            
                        
                        Text("Spar opptil 50% på tusenvis av varer")
                            .font(.title)
                    }
                    .padding(.leading)
                    Spacer()
                    
                }.measure()
            }
            .foregroundStyle(.white)
            .frame(height: 160)
            .measure()
            
            
            ZStack {
                Color("secondaryOrange")
                
                VStack {
                    Text("Oppdag mer:")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(ClothingType.allCases) {
                                clothingType in
                                
                                Button(action: {
                                    didTap(clothingType: clothingType)
                                }, label: {
                                   
                                    Text("\(clothingType.rawValue)")
                                })
                            }
                        }
                        .fontWeight(.bold)
                    }
                    .padding(.leading)
                }
                .foregroundStyle(.white)
                
            }
            
            productCategoryList
                .measure()
            
            
        }
        .sheet(isPresented: $isShowingSheet, content: {
            
            ProductView(selectedClothingType: selectedClothingType)
            
        })
        
    } // body
    
    var productCategoryList: some View {
        ZStack {
            Color.white
            VStack {
                Text("Hvem shopper du til?")
                Text("Gutt, jente eller baby")
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: {
                            
                            print("trykka baby 0-12 mnd")
                            
                            
                        }, label: {
                            ZStack {
                                VStack {
                                    
                                    Image("baby")
                                    ZStack {
                                        Color.blue
                                        Text("Baby (0-12 måneder)")
                                    }
                                }
                                
                            }
                        })
                        
                        
                        Button(action: {
                            print("trykka jente (1-3 år)")
                        }, label: {
                            ZStack {
                                VStack {
                                    
                                    Image("baby")
                                    ZStack {
                                        Color.red
                                        Text("Jente (1-3 år)")
                                    }
                                }
                                
                            }
                        })
                        
                    }
                    
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
