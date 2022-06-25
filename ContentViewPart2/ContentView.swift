//
//  ContentView.swift
//  ContentViewPart2
//
//  Created by ERASOFT on 06/04/22.
//

import SwiftUI


struct ContentView: View {
    
   @State private var name = ""
   @State private var password = ""
   @State private var text = ""

   @State private var totalChars = 0
   @State private var lastText = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, World!")
                } header: {
                    Text("Section 1")
                }
                
                Section {
                    Text("Hello, World!")
                    TextField("Username", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.red)
                        .background(.pink)
                        .padding(50)
                        .border(.red, width: 2)
                    SecureField(text: $password, prompt: Text("Required")) {
                             Text("Password")
                        }
                    
                    TextField("Enter your name", text: $name) { (isBegin) in
                        if isBegin {
                            print("Start")
                        } else {
                            print("End")
                        }
                    }
                        .keyboardType(.phonePad)
                    if !name.isEmpty {
                        Text("Welcome \(name)!")
                    }
                    Button("Autofill") {
                        name = "Sarunw from autofill"
                    }
                } header: {
                    Text("Section 2")
                }
                
                VStack {
                    TextEditor(text: $text)
                        .padding()
                        .background(Color.yellow.opacity(0.5))
                        .foregroundColor(Color.white)
                        .font(Font.custom("AvenirNext-Regular", size: 20, relativeTo: .body))
                        .frame(width: 300, height: 300)
                        .cornerRadius(25)
                        .onChange(of: text) { newValue in
                            totalChars = text.count
                        }
                    
                    ProgressView("Chars: \(totalChars) / 150", value: Double(totalChars), total: 150)
                        .frame(width: 150)
                        .padding()
                        .accentColor(.yellow)
                }
            }
        }
        .navigationTitle("Swift UI")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
