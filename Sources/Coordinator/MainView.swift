//
//  MainView.swift
//  Coordinator
//
//  Created by MohammavDev on 1/8/25.
//


import SwiftUI


///Phantom type for View, which will allow you to mark the Views that you want your Coordinator to
///show.
@MainActor public protocol MainView:  View, Equatable{ }

public extension MainView where Self : View {
    func returnView() -> Self {
        return self
    }
    
}

 public extension MainView  {
    
  
    
     nonisolated var id : String {
        
        let name = String(describing: Self.self)
        return name
        
    }
    
    nonisolated  static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
