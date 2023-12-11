//
//  MyMissionListView.swift
//  Dotrip
//
//  Created by 유지인 on 12/11/23.
//

import SwiftUI

struct MyMissionListView: View {
    @StateObject var missionStore = MissionStore(missions: missionData)
  
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Text("진행중인 미션이")
                    Text("\(missionStore.missions.count)")
                        .foregroundStyle(Color.orange)
                    Text("개 있습니다")
                    
                }
                .frame(width: 300, height: 30)
                .background(Color.gray)
                .cornerRadius(20)
                .offset(x:0, y:40)
                
                List{
                    ForEach(0..<missionStore.missions.count, id:\.self) { item in
                            NavigationLink(destination:
MyMissionDetailView(missions: $missionStore.missions[item])) {
                                MyMissionList(mission: $missionStore.missions[item])
                        }.listRowSeparator(.hidden)
                    }
                 
                }
                 .scrollContentBackground(.hidden)
                
             .padding()
            }
        }
    }
}

#Preview {
    MyMissionListView()
}
