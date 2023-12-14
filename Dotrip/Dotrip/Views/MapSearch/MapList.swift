//  MapListView.swift

import SwiftUI

struct MapList : View {
    
    @ObservedObject var missionStore = MissionStore(missions: missionData)
    
    @Binding var listState : Bool
    @Binding var network : TourKoreaAPI
    @Binding var mission : Mission?
    // 요거 추가해야함
    @ObservedObject var navigationManager: NavigationManager
    @ObservedObject var modalManager: NavigationManager

    @Binding var contId : String
    @Binding var contyId : String
    @Binding var cont : Item?
        
        var body: some View {
            VStack {
                if listState {
                    HStack {
                        Text("총")
                            .font(.system(size: 13))
                        Text("\(missionStore.missions.count)")
                            .foregroundStyle(Color.pointColor)
                            .font(.system(size: 13))
                            .padding(.leading, -5)
                            .bold()

                        Text("개 항목이 있습니다.")
                            .font(.system(size: 13))
                            .padding(.leading, -5)

                    }
                    List{
                        ForEach(0..<missionStore.missions.count, id:\.self) { item in
                            VStack (alignment: .leading) {
                                Text("\(missionStore.missions[item].name)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text("\(missionStore.missions[item].address)")
                                    .font(.footnote)
                            }
                            .onTapGesture {
                                // TapGesture 시 네비게이션
                                mission = missionStore.missions[item]
                                modalManager.stackPath = .MapMissionDetailView
                            }
                        }
                    }
                    .listStyle(.plain)
                    
                } else {
                    HStack {
                        Text("총")
                            .font(.system(size: 13))
                        Text("\(network.totalCount)")
                            .foregroundStyle(Color.pointColor)
                            .font(.system(size: 13))
                            .padding(.leading, -5)
                            .bold()

                        Text("개 항목이 있습니다.")
                            .font(.system(size: 13))
                            .padding(.leading, -5)

                    }
                    List {
                        ForEach(network.posts, id: \.self) { data in
                                HStack {
                                    AsyncImage(url: URL(string: data.firstimage ?? "")) { img in
                                        img.image?.resizable()
                                    }
                                    .frame(width: 65, height: 65)
                                    .cornerRadius(5)
                                    .scaledToFit()
                                    
                                    VStack(alignment: .leading) {
                                        Text(data.title)
                                            .font(.system(size: 15))
                                            .bold()
                                            .padding(.bottom, 3)
                                            .lineLimit(1)
                                        Text("\(data.addr1) \(data.addr2)")
                                            .font(.system(size: 13))
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
                    .listStyle(.plain)
                    
                }
            }
        }
}
