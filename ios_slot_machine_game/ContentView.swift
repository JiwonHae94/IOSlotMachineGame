//
//  ContentView.swift
//  ios_slot_machine_game
//
//  Created by Jiwon_Hae on 2021/11/01.
//

import SwiftUI

struct ContentView: View {
    @State var credits = 1000
    @State var item0 = 0
    @State var item1 = 0
    @State var item2 = 0
    
    
    var body: some View {
        ZStack{
            VStack{
                
                Text("SwiftUI Slots!").font(.largeTitle)
                
                Spacer()
                
                Text("Credits: \(credits)").font(.body)
                
                Spacer()
                
                HStack{
                    Spacer()
                    Image(getType(item0)).resizable().aspectRatio(contentMode: .fit)

                    Spacer()
                    Image(getType(item1)).resizable().aspectRatio(contentMode: .fit)

                    Spacer()
                    Image(getType(item2)).resizable().aspectRatio(contentMode: .fit)


                    Spacer()
                }

                Spacer()
                
                Button("Spin") {
                    item0 = Int.random(in: 0...2)
                    item1 = Int.random(in: 0...2)
                    item2 = Int.random(in: 0...2)
                    
                    if item0 == item1 && item1 == item2{
                        credits += 15
                    } else{
                        credits -= 5
                    }
                    
                }
                .padding()
                .padding([.leading, .trailing], 40)
                .foregroundColor(.white)
                .background(Color(.systemPink))
                .cornerRadius(25)
                .font(.system(size: 18, weight: .bold, design: .default))

                Spacer()
                
            }
            
        }
        
    }
}

func getType(_ pos : Int) -> String{
    var item = "star"
    
    switch(pos){
    case 0: item = "apple"
    case 1: item = "cherry"
    case 2: item = "star"
    default : item = "star"
    }
    
    return item
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
