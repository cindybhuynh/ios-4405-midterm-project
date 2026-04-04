//
//  ContentView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

struct ShopItem: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
    var details: String // e.g., "Large, Crystal Jelly, 50% Sugar"
}

struct ContentView: View {
    @State private var cartItems: [ShopItem] = []

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("bubble-tea")
                
                Text("Bubble Tea Shop")
                    .font(.largeTitle).bold()

                // navigation links
                NavigationLink(destination: CustomDrinkView(cartItems: $cartItems)) {
                    Text("Build Your Own Drink")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 275)
                        .background(Color(red: 0.404, green: 0.745, blue: 0.851))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                

                NavigationLink(destination: SpecialtyItemsView(cartItems: $cartItems)) {
                    Text("Specialty Items")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 275)
                        .background(Color(red: 0.922, green: 0.353, blue: 0.455))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                NavigationLink(destination: CartView(cartItems: $cartItems)) {
                    Text("View Cart (\(cartItems.count))")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 275)
                        .background(Color(red: 0.286, green: 0.815, blue: 0.349))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Home")
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
