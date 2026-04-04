//
//  PaymentView.swift
//  ios-4405-midterm-project
//
//  Created by Cindy Huynh on 4/1/26.
//

import SwiftUI

struct PaymentView: View {
    @Binding var cartItems: [ShopItem]
    @Environment(\.dismiss) var dismiss
    
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
                    .background(total == 0 ? Color.gray : Color(red: 0.286, green: 0.815, blue: 0.349))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(total == 0)
            
            Button("Back to Cart") {
                dismiss()
            }

            Button("Add More Items") {
                dismiss()
            }
        }
        .navigationTitle("Payment")
        .padding()
    }
}
