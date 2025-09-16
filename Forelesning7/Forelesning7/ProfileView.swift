//
//  ProfileView.swift
//  Forelesning7
//
//  Created by Håkon Bogen on 16/09/2025.
//

import SwiftUI

struct ProfileView: View {
    
    let profileURL =  URL(string: "https://picsum.photos/200/200?random=profile")
 
    var body: some View {
        VStack {
            AsyncImage(url: profileURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                
            } placeholder: {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 120, height: 120)
                // lag grå, samme str, med ikon inni
                    .overlay {
                        Image(systemName: "person.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(.gray)
                        //                            .foregroundColor(.gray)
                    }
            } // End AsyncImage
            
            VStack {
                Text("Ola Nordmann")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("iOS-utvikler")
            }
        } // End VStack
    } // End body
} // End struct ProfileView

#Preview {
    ProfileView()
}
