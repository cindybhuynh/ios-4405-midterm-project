//
//  ContentView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

struct CartItem: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
    var details: String // e.g., "Large, Crystal Jelly, 50% Sugar"
}

struct ContentView: View {
    @State private var cartItems: [CartItem] = []

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "cup.and.saucer.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(.brown)
                
                Text("Bubble Tea Shop")
                    .font(.largeTitle).bold()

                // Navigation Buttons
                NavigationLink("Build Your Own Drink") {
                    CustomDrinkView(cartItems: $cartItems) // passes the binding
                }
                .buttonStyle(.borderedProminent)

                NavigationLink("Specialty Items") {
                    SpecialtyItemsView(cartItems: $cartItems)
                }
                .buttonStyle(.bordered)

                NavigationLink("View Cart (\(cartItems.count))") {
                    CartView(cartItems: $cartItems)
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


//@State private var cartItems = [CartItem(name: "Brown Sugar Milk Tea", price: 4.99, details: "Large, Brown Sugar, 50% Sugar"), CartItem(name: "Matcha Latte", price: 5.49, details: "Large, Matcha, 50% Sugar"), CartItem(name: "Peach Tea", price: 4.29, details: "Large, Peach, 50% Sugar")]
