//
//  NewsItemList.swift
//  NewsProject
//
//  Created by QUYTECH_ankit_ios on 14/07/20.
//  Copyright © 2020 QUYTECH. All rights reserved.
//

import SwiftUI

struct NewsItemList: View {
    
    @State var menuOpen: Bool = false
    
    var body: some View {
        ZStack {
            if !self.menuOpen {
                Button(action: {
                    self.openMenu()
                }, label: {
                    Text("Open")
                })
            }

            SideMenu(width: 270,
                     isOpen: self.menuOpen,
                     menuClose: self.openMenu)
        }
    }
    
    func openMenu() {
        self.menuOpen.toggle()
    }
}

struct NewsItemList_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemList()
    }
}
