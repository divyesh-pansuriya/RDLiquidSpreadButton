//
//  RDSplashScreenView.swift
//  ButtonAnimation
//
//  Created by Divyesh Pansuriya on 12/01/25.
//

import SwiftUI

struct RDSplashScreenView: View {
    @State private var isActive = false // Track when to transition
    
    var body: some View {
        if isActive {
            RDLiquidSpreadButtonsWithIcons() // Navigate to your main app view
        } else {
            GeometryReader { geometry in
                ZStack {
                    // Background color
                    Color.black
                        .ignoresSafeArea()
                    VStack {
                        Text("RDLiquidSpreadButton")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                        Text("By Divyesh Pansuriya")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                    }
                }
                .onAppear {
                    // Simulate a delay for splash screen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isActive = true // Transition after delay
                    }
                }
            }
        }
    }
}

struct RDSplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RDSplashScreenView()
            .previewDevice("iPhone 14")
    }
}
