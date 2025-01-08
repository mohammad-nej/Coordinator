//
//  MainView.swift
//  Coordinator
//
//  Created by MohammavDev on 1/8/25.
//


import SwiftUI

@MainActor public protocol MainView:  View{
    //associatedtype Destination : View
    static var title : String { get }
    static var isButtomBarVisible : Bool { get }
//    @ViewBuilder var body : Destination { get }
   //var destination : Destination { get }
}
public extension MainView where Self : View {
    func returnView() -> Self {
        return self
    }
    
    var title : String {
        return Self.title
    }
    var isButtomBarVisible : Bool {
        return Self.isButtomBarVisible
    }
}
