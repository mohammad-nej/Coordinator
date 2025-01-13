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
   
    @Environment(Coordinator.self) private var coordinator
    typealias Destination  = HomeView
    
    static let isButtomBarVisible: Bool = false
    
    
    
    
    
    static let title = "خانه"
    var body: some View {
        Button("Home") {
            coordinator.push(state: SearchView())
           // Coordinator.shared.push(state: SearchView())
        }
    }
    
}
#Preview {
    HomeView()
        .environment(Coordinator())
}
struct SearchView : MainView {
   
    

    @Environment(Coordinator.self) private var coordinator
    static var title: String = "جستجو"
    
    static var isButtomBarVisible: Bool = false
    
    
    
    var body : some View {
        Button("Search") {
            coordinator.push(state: HomeView())
           // Coordinator.shared.push(state: HomeView())
        }
    }
}
