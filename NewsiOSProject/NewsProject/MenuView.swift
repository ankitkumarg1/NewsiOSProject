//
//  MenuView.swift
//  NewsProject
//
//  Created by QUYTECH_ankit_ios on 14/07/20.
//  Copyright © 2020 QUYTECH. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @State var shouldDismiss = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(systemName: "person")
                .foregroundColor(.gray)
                .imageScale(.large)
                    .padding()
                Text("Account")
                    .foregroundColor(.gray)
                    .font(.headline)
                    .onTapGesture {
                        print("Account")
                }
               
            }
            .padding(.top,100)
        
            HStack {
                    Image(systemName: "person")
                      .foregroundColor(.gray)
                      .imageScale(.large)
                        .padding()
                      Text("Settings")
                          .foregroundColor(.gray)
                          .font(.headline)
                        .onTapGesture {
                            print("Settings")
                }
                
                  }
                  .padding(.top,30)
            
            HStack {
              Image("logout")
                .foregroundColor(.gray)
                .imageScale(.large)
                .padding()
                Text("Logout")
                    .foregroundColor(.gray)
                    .font(.headline)
                    .onTapGesture {
                        let sceneDelegate = SceneDelegate()
                     let context = sceneDelegate.managedObjectContext
                        
                        let login = sceneDelegate.loginData?[0]
                        if let login = login {
                        context.delete(login)
                        }
                        sceneDelegate.emailID = nil
                        sceneDelegate.userName = nil
                        //context.save()
                        let loginDataModel = Login()
                        loginDataModel.deleteRecord()
                      //  let context = sceneDelegate.managedObjectContext

                        
                      
                        
                        print("Logout")
                }
            }
            .padding(.top,30)
            
                 Spacer()
              }
        .padding(.top,30)
        .frame(maxWidth: .infinity,alignment: .leading)
    .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
        }
    }


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
