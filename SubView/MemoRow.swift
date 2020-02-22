//
//  MemoRow.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/20.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

/// data row for list
struct MemoRow: View {
    var memo: Memo
    var body: some View {
        HStack {
            memo.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(memo.name)
            Spacer()
            if memo.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

/// example inputs for preview
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MemoRow(memo: memos[0])
            MemoRow(memo: memos[1])
            MemoRow(memo: memos[2])
            MemoRow(memo: memos[3])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
