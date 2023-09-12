//
//  UpdateProductView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 12/09/2023.
//

import SwiftUI

struct UpdateProductView: View {
    
    var minusButtonTapped: (() -> ())
    
    var plusButtonTapped: (() -> Void)
    
    init(
        minusButtonTapped: @escaping (   () -> Void ),
        plusButtonTapped:  @escaping (() -> Void
        )
    ) {
        self.minusButtonTapped = minusButtonTapped
        self.plusButtonTapped = plusButtonTapped
    }
    
//    let name: String
//    init(name: String) { self.name = name}
    
  //  func demoFunction(name: String) -> String { }
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                Text("-")
                    .foregroundColor(.white)
            }// ZStack
            .onTapGesture {
                print("did tap circle -")
                minusButtonTapped()
                // tapped - button
            }
               
            ZStack {
                Circle()
                Text("+")
                    .foregroundColor(.white)
            }.onTapGesture {
                plusButtonTapped()
                // tapped - button
            }
                
        }.font(.title)
            .padding()
    }
}

struct UpdateProductView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProductView(
            minusButtonTapped:
                {
                    print("minus button was tapped!")
                    
                    return ()
                },
            plusButtonTapped:
                {
                    print("Plus button  was tapped!")
                    return ()
                }
        )
    }
}

//                          func anotherFunction() -> () {
//
//
//        }
