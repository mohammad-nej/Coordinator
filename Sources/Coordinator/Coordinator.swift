// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI


///Shared Singleton of Coordinator class for ease of use
///You have to set homePage befor using Coordinator or it will crash at runtime
@MainActor public let coordinator = Coordinator.shared

///Class responsible for changing views when neccessary
@Observable
public final class Coordinator {
  
    @MainActor public static let shared = Coordinator()
    
   
    public var homePage : (any MainViewable)?

    private var stack : [any MainViewable]
    
    private init() {
        stack = []
    }
 
}

public extension Coordinator {
    func push(state : any MainViewable){
        guard homePage != nil else {
            fatalError("HomePage must not be nil!")
        }
        stack.append(state)
    }
    
    func pop(){
        guard let homePage else {
            fatalError("HomePage must not be nil!")
        }
        if !stack.isEmpty {
            let _ = stack.popLast()
        }
        if stack.isEmpty{
            stack = [homePage]
        }
    }
    func toHome(){
        guard let homePage else {
            fatalError("HomePage must not be nil!")
        }
        stack = [homePage]
    }
}

public extension Coordinator {
     var currentState : any MainViewable {
        guard let homePage else {
            fatalError("HomePage must not be nil!")
        }
       return stack.last ?? homePage
    }
    @MainActor var currentView : some View {
        
        return AnyView(currentState.returnView())
    }
}






