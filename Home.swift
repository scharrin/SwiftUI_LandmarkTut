////
////  Home.swift
////  LandmarkTut
////
////  Created by macproo on 2020/02/21.
////  Copyright © 2020 ddd. All rights reserved.
////
//
//import SwiftUI
//
//struct CategoryHome: View {
//    @EnvironmentObject var usrData : UserData
//    var categories: [String: [Memo]] {
//        Dictionary(
//            grouping: memos, by: {$0.category.rawValue}
//        )
//    }
//    
//    var featured: [Memo] {
//        memos.filter{$0.isFeatured}
//    }
//    
//    @State var showProfile = false
//    
//    var proflBtn: some View {
//        Button(action : {self.showProfile.toggle()}) {
//            Image(systemName: "person.crop.circle")
//                .imageScale(.large)
//            .accessibility(label: Text("user profile"))
//            .padding()
//        }
//    }
//    
//    var body: some View {
//        NavigationView {
//            List {
//                FeaturedMemos(lnmks: featured)
//                    .scaledToFill()
//                    .frame(height:200)
//                    .clipped()
//                    .listRowInsets(EdgeInsets())
//                
//                ForEach (categories.keys.sorted(), id: \.self) {ky in
////                    Text(ky)
//                    CategoryRow(categoryName: ky, items: self.categories[ky]!)
//                }
//                .listRowInsets(EdgeInsets())
//                
//                NavigationLink(destination:
//                    MemoListV().environmentObject(self.usrData)
////                        .environmentObject(UserData())
//                ) {
//                    Text("see all")
//                }
//            }
//            .navigationBarTitle("Featured")
//            .navigationBarItems(trailing: proflBtn)
//            .sheet(isPresented: $showProfile){
//                userPflHost()
//                    .environmentObject(self.usrData)
////                Text("User profile")
//            }
//        }
//    }
//}
//
//struct CategoryHome_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryHome().environmentObject(UserData())
//    }
//}
//
//struct FeaturedMemos: View {
//    var lnmks : [Memo]
//    var body: some View {
//        lnmks[0].image.resizable()
//    }
//}
