//
//  MockViews.swift
//  Coordinator
//
//  Created by MohammavDev on 1/8/25.
//

import SwiftUI


protocol   ExtenedViewable : MainView {
    static var title: String { get }
}
extension ExtenedViewable {
    var title : String { Self.title }
}
struct HomeView : ExtenedViewable {
   
    
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
