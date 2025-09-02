//
//  MyList.swift
//  Forelesning3
//
//  Created by Håkon Bogen on 02/09/2025.
//

import SwiftUI

struct MyList: View {
    
    let names: [String] = ["Håkon", "Mari", "Peter", "Rob", "Abdullah"]
    
    var body: some View {
        VStack {
            Text("Klasseliste")
                .font(.largeTitle)
            //            List(names, id: \.self) { name in
            //                HStack {
            //                    Image(systemName: "person")
            //                    Spacer()
            //                    Text(name)
            //                }
            //            }
            ScrollView(.vertical) {
                ForEach(names, id:\.self) { name in
                    HStack {
                        Image(systemName: "person")
                            .padding(.leading, 15)
                        Text("\(name)")
                            .padding(.leading, 5)
                        Spacer()
                        Text("(3. året)")
                        Spacer()
                            .frame(width: UIScreen.main.bounds .width / 4)
                        Text("PG5602")
                            .padding(.trailing)
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    MyList()
}
