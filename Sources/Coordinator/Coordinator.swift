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
    
  
    //@MainActor public static let shared = Coordinator()
    
   
    public var homePage : (any MainView)?

    public var stack : [any MainView]
    
//    public var stack : [any View]
//        return _stack
//    }
    
    public  init() {
        stack = []
    
    }
 
}
struct NilCoordinatorView : MainView {
    var body: some View {
        Text("Coordinators homePage value is nil. Please set it to continue")
            .font(.title)
            .foregroundStyle(.red)
            .frame(maxWidth:.infinity, maxHeight:.infinity)
    }
}
public extension Coordinator {
     func push(state : any MainView){
        guard homePage != nil else {
            logger.error("HomePage must not be nil!")
            stack = [NilCoordinatorView()]
            return
        }
        stack.append(state)
    }
    
     func pop(){
        guard let homePage else {
            logger.error("HomePage must not be nil!")
            stack = [NilCoordinatorView()]
            return
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
            logger.error("HomePage must not be nil!")
            stack = [NilCoordinatorView()]
            return
        }
        stack = [homePage]
    }
}

public extension Coordinator {
    var currentState : any MainView {
        guard let homePage else {
            logger.error("HomePage must not be nil!")
            return NilCoordinatorView()
            
        }
       return stack.last ?? homePage
    }
    @MainActor var currentView : some View {
        
        return AnyView(currentState.returnView())
    }
}







