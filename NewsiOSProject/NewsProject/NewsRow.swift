//
//  NewsRow.swift
//  NewsProject
//
//  Created by QUYTECH_ankit_ios on 14/07/20.
//  Copyright © 2020 QUYTECH. All rights reserved.
//

import SwiftUI

struct NewsRow: View {
    var body: some View {
        VStack {
            HStack {
                Image("newsimage")
                .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .cornerRadius(25)
                    .aspectRatio(contentMode: .fit)
                    .padding([.top, .leading, .trailing], 10.0)
                    .padding(.top,5.0)
                    .padding(.leading, -140)
                
                Text("NewsListView")
                
                    .fontWeight(.bold)
                  //  .padding(.all, 10.0)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom,5)
                    .padding(.top,5)
                    .padding(.trailing,20)
                    .padding(.leading,-50)
            }
                
            .padding()
            .padding([.top, .leading, .trailing],10.0)
            .padding(.bottom,5)
                
            Text("President of Embracing Cheating as a way of Life")
            .fontWeight(.bold)
            .foregroundColor(.black)
            .fontWeight(.regular)
                .multilineTextAlignment(.leading)
            .lineLimit(2)
                .padding([.top],-40)
                .padding(.leading,80)
                .padding(.trailing,60)
                .padding(.bottom,5)
            
                
            
            
            Text("By Maggie Haberman")
            
            .foregroundColor(.gray)
            .fontWeight(.regular)
                .multilineTextAlignment(.leading)
            .lineLimit(2)
               // .padding([.top],-45)
                .padding(.leading,80)
                .padding(.trailing,60)
                .padding(.bottom,10)
            
            Image("arrow_right")
            .resizable()
                .frame(width: 20, height: 20, alignment: .trailing)
                .cornerRadius(10)
                .aspectRatio(contentMode: .fill)
                .padding([.top, .leading, .trailing], 10.0)
                .padding(.top,-90)
                .padding(.leading, 280)

            }
        
        }
        }
    


struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow()
    }
}
