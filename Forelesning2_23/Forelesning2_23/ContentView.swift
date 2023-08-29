//
//  ContentView.swift
//  Forelesning2_23
//
//  Created by Håkon Bogen on 29/08/2023.
//

import SwiftUI

enum SystemImage: String {
    case pencil
    case eraser
    case pencilTip = "pencil.tip"
    case pencilCircle = "pencil.circle"
}


struct AppIconView: View {
    
    let title: String
    let image: SystemImage
    
    public init(title: String, image: SystemImage) {
        self.title = title
        self.image = image
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .scaledToFit()
            VStack {
                Image(systemName: image.rawValue)
                    .foregroundColor(.blue)
                Text(title)
                    .foregroundColor(.white)
            }
        }
    }
}




struct ContentView: View {
    var body: some View {
        ZStack {
            Color("bakgrunnsfarge")
                .ignoresSafeArea()
            
            Image("geofencing")
                .resizable()
                .scaledToFit()
                .imageScale(.large)
            //                .aspectRatio(contentMode: .fit)
            //                .frame(width: 200)
            
            VStack {
                HStack {
                    AppIconView(title: "Første app", image: .pencil)
                    
                    AppIconView(title: "Andre app", image: .pencilTip)
                    
                    AppIconView(title: "Tredje app", image: .pencil)
                    AppIconView(title: "Fjerde app", image: .pencilCircle)
                }
                
                //                ZStack {
                //                    RoundedRectangle(cornerRadius: 20)
                //                        .scaledToFit()
                ////                        .padding(120)
                //                        .foregroundColor(.green)
                //                        .frame(width: 100)
                //
                //                    VStack {
                //                        Image(systemName: "eraser")
                //                            .imageScale(.large)
                //                            .foregroundColor(.red)
                //                        Text("Viskelær")
                //                            .foregroundColor(.white)
                //                    } // VStack
                //
                //                } // ZStack
                
                //                ZStack {
                //
                //                    RoundedRectangle(cornerRadius: 20)
                //                        .scaledToFit()
                //                        .foregroundColor(.blue)
                //                        .frame(width: 100)
                //
                //                    VStack {
                //                        Image(systemName: "pencil")
                //                            .imageScale(.large)
                //                            .foregroundColor(.teal)
                //
                //                        Text("Hello, world!")
                //                            .foregroundColor(.red)
                //                    } // VStack
                //                } // ZStack
                
                
                //                ZStack {
                //
                //                    RoundedRectangle(cornerRadius: 20)
                //                        .scaledToFit()
                //                        .foregroundColor(.blue)
                //                        .frame(width: 100)
                //
                //                    VStack {
                //                        Image(systemName: "pencil")
                //                            .imageScale(.large)
                //                            .foregroundColor(.teal)
                //
                //                        Text("3rd app")
                //                            .foregroundColor(.red)
                //                    } // VStack
                //                }
                
            }
            .padding()
        }
    }
}


let bakgrunnsfarge = UIColor.init(red: 323, green: 320, blue: 223,
                                  alpha: 0.2)

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //            .preferredColorScheme(.dark)
    }
}
