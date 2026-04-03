//
//  PaymentView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

struct PaymentView: View {
    @Binding var cartItems: [CartItem]
    var total: Double { cartItems.reduce(0) { $0 + $1.price } }

    var body: some View {
        VStack(spacing: 30) {
            Text("Total Amount Due")
            Text("$\(total, specifier: "%.2f")")
                .font(.system(size: 40, weight: .bold))
            
            NavigationLink(destination: OrderConfirmationView(cartItems: $cartItems)) {
                Text("Pay Now")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(total == 0 ? Color.gray : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(total == 0) // Required by rubric
            
            Spacer()
        }
        .navigationTitle("Payment")
        .padding()
    }
}
