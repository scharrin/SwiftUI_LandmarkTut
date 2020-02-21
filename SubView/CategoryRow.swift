//
//  CategoryRow.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/21.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject var usrData : UserData
    var categoryName : String
    var items :[Landmark]
    var body: some View {
        VStack (alignment: .leading){
            Text(self.categoryName)
                .font (.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (alignment: .top){
                    ForEach(self.items) { lm in
//                        Text(lm.name)
                        NavigationLink(
                            destination:
                            LandmarkDetail(lndmrk: lm).environmentObject(self.usrData)
                        ){
                            CategoryItem(lnmrk: lm)
                        }
                        
                    }
                }
                Spacer()
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue
            , items: Array(landmarks.prefix(4))
        )
    }
}

struct CategoryItem : View {
    var lnmrk:Landmark
    var body: some View {
        VStack (alignment: .leading) {
            lnmrk.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(lnmrk.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}
