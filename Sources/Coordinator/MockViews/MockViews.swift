//
//  MockViews.swift
//  Coordinator
//
//  Created by MohammavDev on 1/8/25.
//

import SwiftUI

struct HomeView : MainView {
   
    
    typealias Destination  = HomeView
    
    static let isButtomBarVisible: Bool = false
    
    
    
    
    
    static let title = "خانه"
    var body: some View {
        Button("Home") {
            Coordinator.shared.push(state: SearchView())
        }
    }
    
}
#Preview {
    HomeView()
}
struct SearchView : MainView {
   
    

    
    static var title: String = "جستجو"
    
    static var isButtomBarVisible: Bool = false
    
    
    
    var body : some View {
        Button("Search") {
            Coordinator.shared.push(state: HomeView())
        }
    }
}
