//
//  SpecialtyItemsView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

struct SpecialtyItemsView: View {
    @Binding var cartItems: [ShopItem]
    
    let specialtyMenu = [
        ShopItem(name: "Oreo Vanilla Macarons", price: 4.00, details: "Dessert"),
        ShopItem(name: "Chocolate Strawberries", price: 5.50, details: "Dessert"),
        ShopItem(name: "Lemon Crepes", price: 5.00, details: "Dessert")
    ]

    var body: some View {
        List {
            ForEach(specialtyMenu) { item in
                HStack {
                    Image("cupcake")
                        .resizable()
                        .frame(width: 75, height: 75)
                    
                    VStack(alignment: .leading) {
                        Text(item.name).font(.headline)
                        Text("$\(item.price, specifier: "%.2f")").font(.subheadline)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        cartItems.append(item)
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
            }
        }
        .navigationTitle("Specialty Items")
    }
}
