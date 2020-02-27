//
//  ListTestV.swift
//  LandmarkTut
//
//  Created by macproo on 2020/02/22.
//  Copyright © 2020 ddd. All rights reserved.
//

import SwiftUI

struct ListTestV: View {
    
    @State var tmpMemo: String
    let lst = ["ddd", "ddd", "dd", "d"]
    var body: some View {
        VStack {
            Text("dddd")
//            NavigationView {
//                List(lst, id: \.self) { ii in
//                    NavigationLink(destination: ListTestDtlV(i: ii)) {
//                        Text(ii)
//                    }
//                }
//                .navigationBarTitle("dddd?")
//            }
            TxtV(txt: $tmpMemo)
        }
    }
}

struct ListTestDtlV: View {
    let i : String
    var body: some View {
        Text (i)
    }
}


struct LongPressGestureView: View {
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false

    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 3)
            .updating($isDetectingLongPress) { currentstate, gestureState,
                    transaction in
                gestureState = currentstate
                transaction.animation = Animation.easeIn(duration: 2.0)
            }
            .onEnded { finished in
                self.completedLongPress = finished
            }
    }

    var body: some View {
        Circle()
            .fill(self.isDetectingLongPress ?
                Color.red :
                    (self.completedLongPress ? Color.green : Color.yellow))
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(longPress)
    }
}


struct ContentView2 : View {
    @State var toggling = false
    var body: some View {
        NavigationView {
            Form {
                Section(footer: Text("footer")) {
                    Toggle(isOn: $toggling) {
                        Text("Toggly")
                    }
                }
                Section {
                    Button(action: {
                    }) {
                        Text("Save changes")
                    }.disabled(!toggling)
                }
            }.navigationBarTitle(Text("Settings"))
        }
    }
}
struct ContentView : View {
    @State var showingAdvancedOptions = false
    @State var toggling = false
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $showingAdvancedOptions) {
                    Text("Show advanced options")
                }
                if showingAdvancedOptions {
                    Toggle(isOn: $toggling) {
                        Text("Toggly")
                    }
                }
            }
        }
    }
}

struct TxtV: UIViewRepresentable {
    typealias UIViewType = UITextView
    
    @Binding var txt: String
    
    func makeUIView(context: UIViewRepresentableContext<TxtV>) -> UITextView {
        let txtV = UITextView()
        
        txtV.textContainer.lineFragmentPadding = 0
        txtV.textContainerInset = .zero
        txtV.font = UIFont.systemFont(ofSize: 22)
        
        return txtV
    }
    
    func makeCoordinator() -> Cordntr {
        Coordinator(self)
    }
    
    func updateUIView(_ _uiV: UITextView, context: UIViewRepresentableContext<TxtV>) {
        
        _uiV.text = txt
        _uiV.delegate = context.coordinator
    }
    
    class Cordntr: NSObject, UITextViewDelegate {
        var prnt: TxtV
        
        
        init(_ _prnt: TxtV) {
            self.prnt = _prnt
        }
    }
}


struct ListTestV_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            ListTestV()
            ContentView2()
            ContentView()
            LongPressGestureView()
        }
    }
}
