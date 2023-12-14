//
//  ContentView.swift
//  Dotrip
//
//  Created by 이현호 on 12/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainPageView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
            MyMissionListView()
                .tabItem {
                    Image(systemName: "flag.checkered")
                    Text("내미션")
                }
            PointExchangeView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("상점")
                }
                
            MyPageView()
                .tabItem {
                    Image(systemName: "person")
                    Text("MY")
                }
        }
        .tint(Color(hex: 0xFFA800))
    }
}

#Preview {
    ContentView()
}
