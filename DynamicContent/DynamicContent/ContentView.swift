//
//  ContentView.swift
//  DynamicContent
//
//  Created by Wanmy on 1/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var names: [String] = ["Elisha", "Andre", "Jasmine", "Po-Chun"]
    @State private var nameToAdd: String = ""
    @State private var pickedName: String = ""
    @State private  var shouldRemovePickedName: Bool = false
    
    var body: some View {
        VStack {
            VStack (spacing: 10){
                Image(systemName: "person.3.fill")
                Text("Random Org")
            }
            .font(.title)
            .bold()
            
            
            Text(pickedName.isEmpty ? " " : pickedName)
            
            List{
                ForEach(names , id: \.description) {
                    name in Text(name)
                }
                
            }
            TextField("Add name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                        print("called add name")
                    }
                }
            Divider()
            
            Toggle("Remove picked name", isOn: $shouldRemovePickedName)
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll(){
                            name in
                            return (name == randomName)
                        }
                    }
                } else {
                    pickedName = " "
                }
            } label: {
                Text("Pick random name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
