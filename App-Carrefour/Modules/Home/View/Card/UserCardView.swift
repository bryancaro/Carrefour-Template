//
//  UserCardView.swift
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

struct UserCardView: View {
    // MARK: - Environment
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - Observed Object
    // MARK: - Binding variables
    // MARK: - State variables
    @State var animation: Bool = false
    // MARK: - Constant variables
    var userData: HomeModel
    // MARK: - Properties
    var sexTitle: String {
        if userData.sex == "M" {
            return "Es Hombre"
        } else {
            return "Es Mujer"
        }
    }
    // MARK: - Principal View
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "person.fill")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(userData.name)
                    
                    Text(sexTitle)
                }
                
                Spacer()
                
                Text("\(userData.age, specifier: "%.f") years old")
            }
            .padding()
            .frame(width: screen.width - 50, height: 70, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 10)
            .scaleEffect(animation ? 1 : 0)
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: animation)
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
    }
    
    // MARK: - Subviews
    // MARK: - Actions
    func onAppear() {
        withAnimation {
            print("[DEBUG]-[VIEW] [UserCardView]: [onAppear]")
            animation = true
        }
    }
    
    func onDisappear() {
        withAnimation {
            print("[DEBUG]-[VIEW] [UserCardView]: [onDisappear]")            
        }
    }
}

struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView(userData: HomeModel(name: "Bryan", age: 45, sex: "M"))
    }
}

