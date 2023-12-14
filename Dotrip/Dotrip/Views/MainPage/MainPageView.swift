//
//  MainPageView.swift
//  Dotrip
//
//  Created by Hee on 12/11/23.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("홈")
                
                NavigationLink(destination: SearchView()) {
                    Text("검색")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    MainPageView()
}
