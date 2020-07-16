//
//  AboutInfoView.swift
//  BullsEye1
//
//  Created by RD on 6/10/20.
//  Copyright © 2020 Reggie Daniels. All rights reserved.
//

import SwiftUI

let beige = Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)

struct AboutHeadingStyle: ViewModifier {
       func body(content: Content) -> some View {
           return content
               .foregroundColor(Color.black)
               .padding(.bottom, 20)
               .padding(.top, 20)
               .font(Font.custom("Arial Rounded MT Bold", size: 30))
       }
   }

struct AboutTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.black)
            .padding(.trailing, 60)
            .padding(.leading, 60)
            .padding(.bottom, 20)
            .font(Font.custom("Arial Rounded MT Bold", size: 16))
    }
}

struct AboutInfoView: View {
    var body: some View {
        Group {
            VStack {
                Text("🎯 BullsEye 🎯 ").modifier(AboutHeadingStyle())
                Text("This is BullsEye, the game where you can win fame and earn points while dragging a slider.").modifier(AboutTextStyle())
                Text("Your goal is to place the slider as close to the target value as possible. Remember,the closer you get the more points you score!").modifier(AboutTextStyle())
                Text("Enjoy.").modifier(AboutTextStyle())
                
            }
        
                .navigationBarTitle("About You")
                .background(beige)
        }
        .background(Image("Background"))
    }
}

struct AboutInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AboutInfoView().previewLayout(.fixed(width: 896, height: 414))
    }
}
