//
//  MainPage.swift
//  Coordinator
//
//  Created by MohammavDev on 1/8/25.
//

import SwiftUI




struct MainPage:  MainView{
    private var coordinator : Coordinator
    init(){
        coordinator = Coordinator(homePage: HomeView())
     
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
            .onAppear{
                coordinator.homePage = HomeView()
            }
        Color.green
            .frame(height:300)
            .environment(coordinator)
        
            
        
        
    }
}

#Preview(body: {
    MainPage()
        .environment(Coordinator())
})


struct TestView : View {
    var body: some View{
        Text("some shit")
    }
}
