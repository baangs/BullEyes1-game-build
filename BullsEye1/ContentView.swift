//
//  ContentView.swift
//  BullsEye1
//
//  Created by RD on 5/12/20.
//  Copyright © 2020 Reggie Daniels. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var points = 0
    @State var rounds = 1
    
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    
    struct ButtonLargeText: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ButtonSmallText: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    struct Shadow: ViewModifier {
           func body(content: Content) -> some View {
               return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            }
       }
       
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to: ").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
                    
                
                    
                }
        
                //slider row
            Spacer()
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }
                
                //Button row
                Spacer()
                Button(action: {
                    print("Button pressed!")
                    self.alertIsVisible = true
                    
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/).modifier(ButtonLargeText())
                }
                .alert(isPresented: $alertIsVisible){
                    () -> Alert in
                    //let roundedValue = Int(sliderValue.rounded())
                    return Alert(title: Text(alertTitle()), message: Text("The sliders value is \(sliderValueRounded()).\n" +
                        "You scored \(pointsForCurrentRound()) points this round."), dismissButton: .default(Text("Awesome!")) {
                            self.points = self.points + self.pointsForCurrentRound()
                            self.target = Int.random(in: 1...100)
                            self.rounds = self.currentRound()
                        })
                }
                .background(Image("Button")).modifier(Shadow())
                
                // score row
            
            Spacer()
            HStack {
                
                Button(action:{self.newGame()}) {
                    HStack {
                        
                        Image("StartOverIcon")
                        Text("Start Over").modifier(ButtonSmallText())
                    }
                }
                .background(Image("Button")).modifier(Shadow())
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(points)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(rounds)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutInfoView()) {
                    HStack {
                        Image("InfoIcon")
                        Text("Info").modifier(ButtonSmallText())
                  }
                }
                .background(Image("Button")).modifier(Shadow())
              }
                .padding(.bottom, 20)
            }
        .background(Image("Background"), alignment: .center)
        .navigationBarTitle("BullsEye")
        }
    func newGame() {
        points = 0
        rounds = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue)
      }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func currentRound() -> Int {
        rounds + 1
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        if difference == 0 {
            title = "Perfect!!"
        } else if difference < 5 {
            title = "Almost there!"
        } else if difference < 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
     }
    
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
