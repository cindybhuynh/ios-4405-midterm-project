//
//  OrderConfirmationView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

struct OrderConfirmationView: View {
    @Binding var cartItems: [CartItem]

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
            
            Text("Order successful!")
                .font(.title).bold()
            
            Text("Your order has been placed.")
            
            .onAppear {
                cartItems.removeAll()
            }
            
            NavigationLink(destination: ContentView()) {
                Text("Back to Home")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(cartItems.isEmpty ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Success")
    }
}
