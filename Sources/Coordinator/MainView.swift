//
//  MainView.swift
//  Coordinator
//
//  Created by MohammavDev on 1/8/25.
//


import SwiftUI


///Phantom type for View, which will allow you to mark the Views that you want your Coordinator to
///show.
@MainActor public protocol MainView:  View{ }

public extension MainView where Self : View {
    func returnView() -> Self {
        return self
    }
    
}


