//
//  HomeView.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 04/09/2024.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack {
            
            ZStack {
                Color.orange
                VStack {
                    Text("Kickstart høsten")
                    Text("Spar opptil 50% på tusenvis av varer")
                }
            }
            
            
            
            ZStack {
                Text("Oppdag mer:")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: {
                            print("Trykka knappen klær")
                        }, label: {
                            Text("Klær")
                        })
                        
                        Button(action: {
                            print("Trykka knappen sko")
                            
                        }, label: {
                            Text("Sko")
                        })
                    }
                }
            }
            
            productCategoryList
            
            
        }
        
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
