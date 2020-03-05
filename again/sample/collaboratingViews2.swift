

/// https://swiftui-lab.com/communicating-with-the-view-tree-part-1/
///

import SwiftUI

struct MyTextPreferenceKey: PreferenceKey {
    typealias Value = [MyTextPreferenceData]

    static var defaultValue: [MyTextPreferenceData] = []
    
    static func reduce(value: inout [MyTextPreferenceData], nextValue: () -> [MyTextPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}

struct MyTextPreferenceData: Equatable {
    let viewIdx: Int
    let rect: CGRect
}

struct ContentView3 : View {
    
    @State private var activeIdx: Int = 0
    @State private var rects: [CGRect] = Array<CGRect>(repeating: CGRect(), count: 12)
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 3.0).foregroundColor(Color.green)
                .frame(width: rects[activeIdx].size.width, height: rects[activeIdx].size.height)
                .offset(x: rects[activeIdx].minX, y: rects[activeIdx].minY)
                .animation(.easeInOut(duration: 1.0))
            
            VStack {
                Spacer()
                
                HStack {
                    MonthView2(activeMonth2: $activeIdx, label: "January", idx: 0)
                    MonthView2(activeMonth2: $activeIdx, label: "February", idx: 1)
                    MonthView2(activeMonth2: $activeIdx, label: "March", idx: 2)
                    MonthView2(activeMonth2: $activeIdx, label: "April", idx: 3)
                }
                
                Spacer()
                
                HStack {
                    MonthView2(activeMonth2: $activeIdx, label: "May", idx: 4)
                    MonthView2(activeMonth2: $activeIdx, label: "June", idx: 5)
                    MonthView2(activeMonth2: $activeIdx, label: "July", idx: 6)
                    MonthView2(activeMonth2: $activeIdx, label: "August", idx: 7)
                }
                
                Spacer()
                
                HStack {
                    MonthView2(activeMonth2: $activeIdx, label: "September", idx: 8)
                    MonthView2(activeMonth2: $activeIdx, label: "October", idx: 9)
                    MonthView2(activeMonth2: $activeIdx, label: "November", idx: 10)
                    MonthView2(activeMonth2: $activeIdx, label: "December", idx: 11)
                }
                
                Spacer()
                }.onPreferenceChange(MyTextPreferenceKey.self) { preferences in
                    for p in preferences {
                        self.rects[p.viewIdx] = p.rect
                    }
            }
        }.coordinateSpace(name: "myZstack")
    }
}

struct MonthView2: View {
    @Binding var activeMonth2: Int
    let label: String
    let idx: Int
    
    var body: some View {
        Text(label)
            .padding(10)
            .background(MyPreferenceViewSetter(idx: idx)).onTapGesture { self.activeMonth2 = self.idx }
    }
}

struct MyPreferenceViewSetter: View {
    let idx: Int
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.clear)
                .preference(key: MyTextPreferenceKey.self,
                            value: [MyTextPreferenceData(viewIdx: self.idx, rect: geometry.frame(in: .named("myZstack")))])
        }
    }
}

struct prv2: PreviewProvider {
    static var previews: some View {
//         Group {
            ContentView3()
//            EasyExample()
//         }
    }
}
