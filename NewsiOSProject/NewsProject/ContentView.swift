//
//  ContentView.swift
//  NewsProject
//
//  Created by QUYTECH_ankit_ios on 13/07/20.
//  Copyright © 2020 QUYTECH. All rights reserved.
//

import SwiftUI


let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let storedUsername = "A"
let storedPassword = "B"
let storedEmail    = "C"

enum PresentedView {
 case login
 case registration
}

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Login.getAllToDoItems()) var login: FetchedResults<Login>
  
    @State private var newToDoItem = ""
    
    @State var username: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
   @State var editingMode: Bool = false
     @State private var isShowingDetailView = false
    @State private var viewToPresent: PresentedView?
    @State private var isLoginValid: Bool = false
    @State private var shouldShowLoginAlert: Bool = false
    @State private var errorMsg: String = ""
    
    var body: some View {
        
        NavigationView {
        VStack(spacing: 10.0){
       
            UsernameTextField(username: $username, editingMode: $editingMode)
                .padding()
//            if username.isValidEmail == true {
//                Text("Invalid UserName")
//                    .offset(y: -1)
//                    .foregroundColor(.red)
//            }
        
        PasswordSecureField(password: $password)
            .padding()
//            if password.isValidPassword == true {
//            Text("Invalid Password")
//                .offset(y: -1)
//                .foregroundColor(.red)
//        }
            
            EmailTextField(email: $email)
                .padding()
        
//            TextField("Email", text: $email)
//                .padding()
//                .keyboardType(.emailAddress)
//               .background(lightGreyColor)
//               .cornerRadius(5.0)
//               .padding(.bottom,5)
       
//            if email.isValidEmail == true {
//            Text("Invalid Email")
//                .offset(y: -1)
//                .foregroundColor(.red)
//        }
            NavigationLink(destination: NewsListView(),
                       isActive: self.$isLoginValid) {
             Text("Login")
                .onTapGesture {
                    let isLoginValid = self.username.isValidUserName && self.email.isValidEmail  && self.password.isValidPassword
                   
                    if self.username == "" && self.email == "" && self.password == ""{
                        self.errorMsg = "Please fill all the fields"
                    }else if self.username == "" {
                     self.errorMsg = "Please fill username field"
                    }else if self.password == "" {
                         self.errorMsg = "Please fill password field"
                    }else if self.email == "" {
                         self.errorMsg = "Please fill email field"
                    }else if !self.username.isValidUserName{
                     self.errorMsg = "Please fill valid username "
                    }else if !self.password.isValidPassword{
                    self.errorMsg =  "Please fill valid password"
                    }else if !self.email.isValidEmail {
                        self.errorMsg = "Please fill valid emailID"
                    }else{
                        self.errorMsg = "Unexpected Error"
                    }
                    
                    if !self.username.isValidUserName {
                        
                    }
                    
                    if isLoginValid {
                        let toDoItem = Login(context: self.managedObjectContext)
                        toDoItem.email = self.email
                        toDoItem.username = self.username
                        do {
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                        
                    self.isLoginValid = true
                    }else{
                        self.shouldShowLoginAlert = true
                    }
                }
            }
        
            
        
        .alert(isPresented: $shouldShowLoginAlert, content: { () -> Alert in
            Alert(title: Text(self.errorMsg))
        })
              .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.blue)
            .cornerRadius(15.0)
            }
        }
        .background(Image(""))
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            print()
        }
        //.padding()
    }

}

struct EmailTextField: View {
    
    @Binding var email: String
    
    var body : some View {
        return TextField("Email", text: $email)
         .padding()
         .keyboardType(.emailAddress)
        .background(lightGreyColor)
        .cornerRadius(5.0)
        .padding(.bottom,5)

    }
}

struct PasswordSecureField : View {
    
    @Binding var password: String
    
    var body: some View {
        return SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 5)
    }
}

struct UsernameTextField : View {
    
    @Binding var username: String
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("Username", text: $username, onEditingChanged: {edit in
            if edit == true
            {self.editingMode = true}
            else
            {self.editingMode = false}
        })
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 5)
    }
}

func login(){
    
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("LOGIN")
                   .font(.headline)
                   //change
                   .foregroundColor(.white)
                   .padding()
                   .frame(width: 220, height: 60)
                   .background(Color.blue)
                   .cornerRadius(15.0)
    }
    
    
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    ContentView()
    }
}
#endif
