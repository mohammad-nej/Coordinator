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
        Text(coordinator.currentState.title)
        coordinator.currentView
        
        
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
