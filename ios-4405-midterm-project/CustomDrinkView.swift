//
//  CustomDrinkView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

struct CustomDrinkView: View {

    var body: some View {
        VStack {
            Image(systemName: "mango")
                .font(.system(size: 80))
                .foregroundStyle(.yellow)
            
            Text("This is the Custom Drink View")
        }
        .navigationTitle("Custom Drink")
    }
}
