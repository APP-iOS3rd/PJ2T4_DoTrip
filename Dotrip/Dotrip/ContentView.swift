//
//  ContentView.swift
//  Dotrip
//
//  Created by 이현호 on 12/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                NavigationLink("Search", destination: SearchView())
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
