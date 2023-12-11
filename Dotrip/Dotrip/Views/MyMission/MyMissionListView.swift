//
//  MyMissionListView.swift
//  Dotrip
//
//  Created by 유지인 on 12/11/23.
/*
 0xEFECEC : 서브컬러
 */

import SwiftUI

struct MyMissionListView: View {
    @StateObject var missionStore = MissionStore(missions: missionData)
     var succeededMissons: Int = 0 //성공한 미션 카운트

    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Text("진행중인 미션이")
                    Text("\(missionStore.missions.count)")
                        .foregroundStyle(Color.orange)
                    Text("개 있습니다")
    
                }
                .modifier(CountModify())
        
                List{
                    ForEach(0..<missionStore.missions.count, id:\.self) { item in
                            NavigationLink(destination:
MyMissionDetailView(missions: $missionStore.missions[item])) {
                                MyMissionList(mission: $missionStore.missions[item])
                        }.listRowSeparator(.hidden)
                        
                    }
                 
                }
                 .scrollContentBackground(.hidden)

                //완료된 갯수가 0개 이상이면 나타남
                if succeededMissons > 0 {
                    HStack {
                        Text("진행중인 미션이")
                        Text("\(succeededMissons)")
                            .foregroundStyle(Color.orange)
                        Text("개 있습니다")
                    }
                    .modifier(CountModify())
                    .offset(x:0, y: -300)
                }

            }
        }
    }
}

//진행중인 미션 갯수 디자인
struct CountModify: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 350, height: 30)
            .background(Color(hex: 0xEFECEC))
            .cornerRadius(20)
            .offset(x:0, y:40)
            .padding(.bottom, 20)
    }
}


#Preview {
    MyMissionListView()
}
