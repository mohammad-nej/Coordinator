//
//  NilCoordinatorView.swift
//  Coordinator
//
//  Created by MohammavDev on 1/13/25.
//


import SwiftUI

struct NilCoordinatorView : MainView {
    var body: some View {
        Text("Coordinators homePage value is nil. Please set it to continue")
            .font(.title)
            .foregroundStyle(.red)
            .frame(maxWidth:.infinity, maxHeight:.infinity)
    }
}