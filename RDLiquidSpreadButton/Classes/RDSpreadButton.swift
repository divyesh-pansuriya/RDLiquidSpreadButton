//
//  RDSpreadButton.swift
//  RDLiquidSpreadButton
//
//  Created by Divyesh Pansuriya on 12/01/25.
//
import SwiftUI

//@available(iOS 14.0, *)
struct RDLiquidSpreadButtonsWithIcons: View {
    @State private var isExpanded = false
    @State private var rotationAngle: Double = 0
    
    @State private var tappedIndex: String? = nil // Store the index of the tapped button
    @State private var showToast = false // Control the visibility of the toast
    @State private var likedButtons: [String: Bool] = [:] // Track like/unlike state for each button
    
    let buttons = [
        ("pencil", Color.green),
        ("trash", Color.red),
        ("paperplane", Color.orange),
        ("heart", Color.purple)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .opacity(0.9)
                    .ignoresSafeArea()
                
                Text("RDLiquidSpreadButton")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .position(x: geometry.size.width/2, y: geometry.size.height*0.1)
                
                if isExpanded {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isExpanded = false
                        }
                }
                
                ForEach(0..<buttons.count, id: \.self) { index in
                    Button(action: {
                        print("\(buttons[index].0) Button Tapped")
                        tappedIndex = buttons[index].0 // Update tapped name
                        isExpanded = false
                        showToastMessage()
                    }) {
                        Image(systemName: buttons[index].0)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Circle().fill(Color.gray.opacity(0.5)))
                            .shadow(radius: 5)
                            .scaleEffect(isExpanded ? 1 : 0.5)
                            .opacity(isExpanded ? 1 : 0)
                    }
                    .offset(
                        x: 0,
                        y: isExpanded ? -CGFloat(index + 1) * 70 : 0
                    )
                    .position(x: geometry.size.width-50, y: geometry.size.height - 80) // Start at main button's position
                    .animation(
                        .spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.2)
                        .delay(Double(index) * 0.1),
                        value: isExpanded
                    )
                }
                
                // Main Button (Fixed at Bottom-Left)
                Button(action: {
                    toggleExpansion()
                }) {
                    Circle()
                        .fill(Color.gray.opacity(0.7))
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: isExpanded ? "xmark" : "plus")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .shadow(radius: 10)
                        .rotationEffect(.degrees(rotationAngle)) // Rotate the button
                        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: rotationAngle) // Smooth animation
                }
                .position(x: geometry.size.width-50, y: geometry.size.height - 80) // Bottom-right Position
                
                // Toast View (Centered)
                if showToast {
                    VStack {
                        Text("Button \(tappedIndex ?? "") Tapped!")
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .transition(.scale)
                    }
                    .position(x: geometry.size.width/2, y: geometry.size.height*0.95) // Center the toast
                    .background(Color.clear) // Maintain transparency around toast
                }
            }
        }
    }
    
    private func toggleExpansion() {
        // Update rotation angle for animation
        rotationAngle += isExpanded ? -180 :  180 // Rotate 180° each time the button is clicked
        isExpanded.toggle() // Expand/Collapse buttons
    }
    
    // Show toast message with auto-hide
    private func showToastMessage() {
        showToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showToast = false
        }
    }
}

struct RDLiquidSpreadButtonsWithIcons_Previews: PreviewProvider {
    static var previews: some View {
        RDLiquidSpreadButtonsWithIcons()
            .previewDevice("iPhone 14")
    }
}
