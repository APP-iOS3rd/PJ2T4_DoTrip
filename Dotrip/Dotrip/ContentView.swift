//
//  ContentView.swift
//  Dotrip
//
//  Created by 이현호 on 12/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Text("홈")
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
            MyMissionListView()
                .tabItem {
                    Image(systemName: "flag.checkered")
                    Text("내미션")
                }
            Text("즐겨찾기")
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("즐겨찾기")
                }
            MyPageView()
        }
    }
}

#Preview {
    ContentView()
}
