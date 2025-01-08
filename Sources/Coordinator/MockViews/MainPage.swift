//
//  MainPage.swift
//  Coordinator
//
//  Created by MohammavDev on 1/8/25.
//

import SwiftUI


public protocol StructuredPage : View {}

struct MainPage:  StructuredPage{
    let coordinator = Coordinator.shared
    init(){
        coordinator.homePage = HomeView()
    }
    
    var body : some View {
        
        Color.blue
            .frame(height:300)
        Divider()
        
        //AnyView(coordinator.currentState.returnView())
        
        coordinator.currentView
        if let state = coordinator.currentState as? (any ExtenedViewable){
            Text(state.title)
        }
        
        Divider()
        Color.green
            .frame(height:300)
        
        
        
        
    }
}

#Preview(body: {
    MainPage()
})


struct TestView : View {
    var body: some View{
        Text("some shit")
    }
}
