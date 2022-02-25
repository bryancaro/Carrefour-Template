//
//  HomeView.swift
//  App-Carrefour
//
//  Created for App-Carrefour in 2022
//  Using Swift 5.0
//  Running on macOS 12.2
//
//  Created by Bryan Caro on 2/24/22.
//  
//

import SwiftUI

struct HomeView: View {
    // MARK: - Environment
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - Observed Object
    @StateObject var viewModel = HomeViewModel()
    // MARK: - Binding variables
    // MARK: - State variables
    @State var animate: Bool = false
    // MARK: - Constant variables
    // MARK: - Properties
    // MARK: - Principal View
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    if !viewModel.usersData.isEmpty {
                        ForEach(viewModel.usersData, id: \.self) { vm in
                            UserCardView(userData: vm)
                        }
                    } else {
                        NoFound
                    }
                }
                .padding(.top, 50)
            }
            
            LoadingView(showLoading: $viewModel.isLoading)
        }
        .alert(item: $viewModel.appError) { appAlert in
            Alert(
                title: Text(""),
                message: Text(appAlert.errorString),
                dismissButton: .default(Text(""), action: viewModel.dismissButtonAction))
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: animate)
        .onAppear(perform: viewModel.onAppear)
        .onDisappear(perform: viewModel.onDisappear)
    }
    
    // MARK: - Actions
    func onTapGesture() {
        withAnimation {
            viewModel.getUsersData()
        }
    }
}

// MARK: - Subviews
extension HomeView {
    var NoFound: some View {
        Text("No data found it!!, tap to refresh")
            .onTapGesture(perform: onTapGesture)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

