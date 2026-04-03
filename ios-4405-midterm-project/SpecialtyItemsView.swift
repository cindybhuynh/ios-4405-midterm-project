//
//  SpecialtyItemsView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

struct SpecialtyItemsView: View {
    @Binding var cartItems: [CartItem]
    
    let specialtyMenu = [
        CartItem(name: "Oreo Vanilla Macarons", price: 4.00, details: "Dessert"),
        CartItem(name: "Chocolate Strawberries", price: 5.50, details: "Dessert"),
        CartItem(name: "Lemon Crepes", price: 5.00, details: "Dessert")
    ]

    var body: some View {
        List {
            ForEach(specialtyMenu) { item in
                HStack {
                    // Replace "bubble-tea" with your icon name from Assets
                    Image(systemName: "cupcake.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.pink)
                    
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
