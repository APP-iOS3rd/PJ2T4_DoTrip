//
//  MapListView.swift
//  Dotrip
//
//  Created by jonghyun baik on 12/13/23.
//

import SwiftUI

struct MapList : View {
    
    @Binding var listState : Bool
    @Binding var network : TourKoreaAPI
    
    // 요거 추가해야함
    @ObservedObject var navigationManager: NavigationManager
    @ObservedObject var modalManager: NavigationManager

    @Binding var contId : String
    @Binding var contyId : String
    @Binding var cont : Item?
        
        var body: some View {
            VStack {
                if listState {
                    List {
                        ForEach(network.posts, id: \.self) { data in
                                HStack {
                                    AsyncImage(url: URL(string: data.firstimage ?? "")) { img in
                                        img.image?.resizable()
                                    }
                                    .frame(width: 80, height: 80)
                                    .scaledToFit()
                                    
                                    VStack(alignment: .leading) {
                                        Text(data.title)
                                        Text("\(data.addr1) \(data.addr2)")
                                    }
                                    
                                }
                                .onTapGesture {
                                    // TapGesture 시 네비게이션
                                    cont = data
                                    contId = data.contentid
                                    contId = data.contenttypeid
                                    modalManager.stackPath = .MapMissionDetailView
                                }
                            
                        }
                    }
                } else {
                    List {
                        ForEach(network.posts, id: \.self) { data in
                                HStack {
                                    AsyncImage(url: URL(string: data.firstimage ?? "")) { img in
                                        img.image?.resizable()
                                    }
                                    .frame(width: 80, height: 80)
                                    .scaledToFit()
                                    
                                    VStack(alignment: .leading) {
                                        Text(data.title)
                                        Text("\(data.addr1) \(data.addr2)")
                                    }
                                    
                                }
                                .onTapGesture {
                                    // TapGesture 시 네비게이션
                                    cont = data
                                    contId = data.contentid
                                    contyId = data.contenttypeid
                                    modalManager.stackPath = .MapDetailView
                                }
                            
                        }
                    }
                    
                }
            }
            .onAppear() {
                network.tourData(params: ["20231201", "20231231", "39", "", "제주"])
            }
        }
}

