//
//  ContentView.swift
//  UI1-WeSplit
//
//  Created by Sothesom on 10/09/1403.
//

import SwiftUI

struct ContentView: View {
    
    let country = ["IRAN", "USA", "UK", "JAPAN"]
    @State private var selectCountry = "IRAN"
    
    @State var tapCount = 0
    @State var name = ""
    
    var body: some View {
        NavigationStack{
            Form{
                Text("Sothesom")
                Text("iran")
                
                Section{
                    Text("tehran")
                }
                
                Section{
                    Button("add \(tapCount)"){
                        tapCount += 1
                    }
                }
                
                Section{
                    Picker("select your contry", selection: $selectCountry){
                        ForEach(country, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                TextField("Enter your name", text: $name)
                Text("Your name is \(name)")
                
                Section{
                    ForEach(0..<10) { number in
                        Text("ADAD \(number)")
                    }
                }
                
            }
            .navigationTitle("Sothesom")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
