//
//  PrflSummary.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/21.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct PrflEdtr: View {
    @Binding var prf: Profile

    var dateRng: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: prf.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: prf.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("username").bold()
                Divider()
                TextField("usernaem", text: $prf.name)
            }

            Toggle(isOn: $prf.preferNoti) {
                Text("enable notifications")
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $prf.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id:\.self) { sesn in
                        Text(sesn.rawValue).tag(sesn)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
//            .padding(.top)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("goal date").bold()
                DatePicker(
                    "Goal Date"
                    , selection: $prf.goalDate
                    , in: dateRng
                    , displayedComponents: .date
                )
            }
//            .padding(.top)
        }
    }
}

struct PrflEdtr_Preview: PreviewProvider {
    static var previews: some View {
        PrflEdtr(prf: .constant(.default))
    }
}
