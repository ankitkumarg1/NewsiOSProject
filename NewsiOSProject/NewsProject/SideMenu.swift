//
//  SideMenu.swift
//  NewsProject
//
//  Created by QUYTECH_ankit_ios on 14/07/20.
//  Copyright © 2020 QUYTECH. All rights reserved.
//

import SwiftUI
import Combine

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
                HStack {
                MenuContent()
                .frame(width: self.width)
                .background(Color.white)
                .offset(x: self.isOpen ? 0 : -self.width)
                .animation(.default)

                    Spacer()
                
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
               .animation(Animation.easeIn.delay(0.25))
               .onTapGesture {
                   self.menuClose()
               }
        }
    }
}
}


