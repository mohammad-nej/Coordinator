// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI


/////Shared Singleton of Coordinator class for ease of use.
/////You have to set homePage befor using Coordinator or it will crash at runtime
//@MainActor public let coordinator = Coordinator.shared




@MainActor public protocol Coordinatable : Observable {
    
    static var shared : Self { get }
    
    var homePage : (any MainView)? { get }
    var stack : [any MainView] { get set }
}

///Class responsible for changing views when neccessary
@MainActor
@Observable
public final class Coordinator {
    
  
   
    public var homePage : (any MainView)

    public var stack : [any MainView]

    @_disfavoredOverload
    public init() {
        logger.debug("Initializing Coordinator")
        stack = []
        homePage = NilCoordinatorView()
    }
    
    public  init(homePage : (any MainView)) {
        stack = []
        self.homePage = homePage
    }
 
}

public extension Coordinator {
     func push(state : any MainView){
     
        stack.append(state)
    }
    
     func pop(){
    
        if !stack.isEmpty {
            let _ = stack.popLast()
        }
        if stack.isEmpty{
            stack = [homePage]
        }
    }
     func toHome(){
    
        stack = [homePage]
    }
}

public extension Coordinator {
    var currentState : any MainView {
    
       return stack.last ?? homePage
    }
    @MainActor var currentView : some View {
        
        return AnyView(currentState.returnView())
    }
}







