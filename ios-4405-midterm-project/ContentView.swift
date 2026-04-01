//
//  ContentView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

//
//struct ContentView: View {
//    
//    @State var selection: MusicTab = .received
//    var body: some View {s
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        HStack {
//            TabView {
//                Tab("Tea", systemImage: "cup.and.straw") {
//                    TeaView()
//                }
//            }
//        }
//        .padding()
//    }
//}

struct ContentView: View {

    var body: some View {
        TabView {
            NavigationStack {
//                ContentView()
//                    .navigationTitle("Home")
            }
            .tabItem {
                Label("Speciality", systemImage: "star.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.yellow)
                        
            }

            NavigationStack {
                CustomDrinkView()
                    .navigationTitle("CustomDrink")
            }
            .tabItem {
                Image("bubble-tea")
                Text("Custom Drink")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
