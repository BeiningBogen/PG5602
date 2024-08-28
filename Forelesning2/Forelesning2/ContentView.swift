//
//  ContentView.swift
//  Forelesning1
//
//  Created by Håkon Bogen on 27/08/2024.
//

import SwiftUI

struct ContentView: View {

    @State private var displayFirstPicture = false

    var body: some View {
        VStack {
            HStack {
                stateButton
//                Toggle("Toggle Title", isOn: $displayFirstPicture)
            }

//            AsyncImage(url: )
//                .resizable()
//                .frame(width: 300, height: 300)

//            AsyncImage(
//                url: URL(string: "https://apod.nasa.gov/apod/imag/2408/Tulip_Shastry_1080.jpg")) { image in
//                    image.resizable()
//                } placeholder: {
//                    ProgressView()
//                }
//                .frame(width: 300, height: 300)

            AsyncImage(url: URL(string: "https://apod.nasa.gov/apod/image/2408/Tulip_Shastry_1080.jpg")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                case .failure(let error):
                    Text("Image failed")
                }
            }



//            CircleImage(
//                displayFirstPicture
//                ? .NasaPictures.crabMultiChandra4123
//                : .NasaPictures.perseidsStonehengeDury2780
//            )

//            Rectangle()
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .foregroundColor(Color.red)
//
//            RectangeWithExtrudedCircle()
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .foregroundColor(Color.red)

//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
//            Circle()
//                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
//            Ellipse()
//                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
            Capsule()
                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top, 30)
        }
        .padding()
    }

    @ViewBuilder
    private var stateButton: some View {
        Button("Button Title") {
            print("button tapped")
            displayFirstPicture.toggle()
        }
        .buttonStyle(MainActionButtonStyle())
    }


}

#Preview {
    ContentView()
}

