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
    var items :[Memo]
    var body: some View {
        VStack (alignment: .leading){
            Text(self.categoryName)
                .font (.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (alignment: .top){
                    ForEach(self.items) { m in
                        NavigationLink(
                            destination:
                            MemoContentV(memo: m).environmentObject(self.usrData)
                        ){
                            CategoryItem(memo: m)
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
            categoryName: memos[0].category.rawValue
            , items: Array(memos.prefix(4))
        )
    }
}

struct CategoryItem : View {
    var memo:Memo
    var body: some View {
        VStack (alignment: .leading) {
            memo.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(memo.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}
