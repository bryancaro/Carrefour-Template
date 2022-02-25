//
//  LoadingView.swift
//  App-Carrefour
//
//  Created for App-Carrefour in 2022
//  Using Swift 5.0
//  Running on macOS 12.2
//
//  Created by Bryan Caro on 2/25/22.
//  
//

import SwiftUI

struct LoadingView: View {
    // MARK: - Environment
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - Observed Object
    // MARK: - Binding variables
    @Binding var showLoading: Bool
    // MARK: - State variables
    // MARK: - Constant variables
    var title: String = "Loading"
    // MARK: - Properties
    var height: Double {
        return colorScheme == .light ? screen.height : screen.height * 0.8
    }
    // MARK: - Principal View
    var body: some View {
        if showLoading {
            ZStack {
                Background

                VStack {
                    Text(title)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showLoading)
            .onAppear(perform: onAppear)
            .onDisappear(perform: onDisappear)
            .transition(.scale)
        }
    }

    // MARK: - Actions
    func onAppear() {
        withAnimation {
            print("[DEBUG]-[VIEW] [LoadingView]: [onAppear]")
        }
    }
    
    func onDisappear() {
        withAnimation {
            print("[DEBUG]-[VIEW] [LoadingView]: [onDisappear]")            
        }
    }
}

// MARK: - Subviews
extension LoadingView {
    var Background: some View {
        Color.black.opacity(0.8)
            .frame(width: screen.width, height: height, alignment: .center)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(showLoading: .constant(true))
    }
}

