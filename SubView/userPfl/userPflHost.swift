//
//  userPflHost.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/21.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct userPflHost: View {
    @State var draftPrfl = Profile.default
    @Environment(\.editMode) var mod
    @EnvironmentObject var usrData: UserData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mod?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftPrfl = self.usrData.prfl
                        self.mod?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if self.mod? .wrappedValue == .inactive {
                PrflSummary(profile: usrData.prfl)
            } else {
//                Text("profile editor")
                PrflEdtr(prf: $draftPrfl)
                    .onAppear {
                        self.draftPrfl = self.usrData.prfl
                }
                .onDisappear {
                    self.usrData.prfl = self.draftPrfl
                }
            }
//            PrflSummary(profile: draftPrfl)
        }
        .padding()
//        Text("profile for: \(draftPrfl.name)")
    }
}

struct userPflHost_Previews: PreviewProvider {
    static var previews: some View {
        userPflHost().environmentObject(UserData())
    }
}
