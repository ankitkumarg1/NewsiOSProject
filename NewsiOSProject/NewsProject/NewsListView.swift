//
//  NewsListView.swift
//  NewsProject
//
//  Created by QUYTECH_ankit_ios on 13/07/20.
//  Copyright © 2020 QUYTECH. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    
    @State var showMenu: Bool = false
    
    var parent = ContentView()
    
    var body: some View {

        let drag = DragGesture()
        .onEnded {
            if $0.translation.width < -100 {
                withAnimation {
                self.showMenu = false
                }
            }
        }
    return NavigationView {
       // VStack {
        GeometryReader { geometry in
            ZStack(alignment: .leading){
               MainView()
            .frame(width: geometry.size.width, height: geometry.size.height)
                .offset(x: self.showMenu ? geometry.size.width / 2 : 0)
                
   .disabled(self.showMenu ? true : false)
              
                if self.showMenu {
                    MenuView()
                        .frame(width: geometry.size.width * 0.5,height: geometry.size.height,alignment: .leading)
                        .padding(.top,0)
                        .padding(.leading,0)
           .transition(.move(edge: .leading))
                }
        }
    .gesture(drag)
        
        }
        //.padding(.leading,0)
        //.padding(.top,20)
        .navigationBarHidden(false)
        .navigationBarTitle("Home",displayMode: .inline)
        .background(NavigationConfigurator { nc in
            nc.navigationBar.barTintColor = .systemBlue
            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            }
        
        )
            .navigationBarHidden(false)
        .navigationBarItems(leading: (
           
            Button (action: {
                withAnimation {
                    
               self.showMenu.toggle()
                }
            }){
                Image(systemName: "line.horizontal.3")
                .imageScale(.large)
                .foregroundColor(.white)
            }
        ),trailing: (
           Button (action: {
                withAnimation {
            
              // self.showMenu.toggle()
                }
            }){
                Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .foregroundColor(.white)
            }
        ))
        
    }
        
        .padding(.leading,0)
        .padding(.trailing,0)
    .padding(.top,1)
    .edgesIgnoringSafeArea([.bottom,.leading,.trailing])
    .navigationBarBackButtonHidden(true)
    .navigationBarTitle("", displayMode: .inline)
    .navigationBarHidden(true)
    .navigationViewStyle(StackNavigationViewStyle())
       
    }
    
}


struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in
        
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct MainView: View {
    
  //  @Binding var showMenu: Bool
    var body: some View {
        List(0 ..< 5){ item in
            NewsRow()
      }
    }
}
#if DEBUG
struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
    NewsListView()
    }
}
#endif
