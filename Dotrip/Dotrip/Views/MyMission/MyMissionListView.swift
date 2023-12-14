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
    
    @State var showActionSheet: Bool = false
    @State var stackPath = NavigationPath()
    @State var succeededMissons: Int = 0 //성공한 미션 카운트
    @State var btnStatus = false
    
    var missioncnt: Int {
        return missionStore.missions.count - succeededMissons
    }
    
    var body: some View {
        NavigationStack(path: $stackPath){
            VStack {
                Text("내미션")
                    .frame(width:350, alignment: .leading)
                    .font(.title)
                    .bold()
                    .padding(.top,20)
                    .padding(.bottom, -20)
                HStack{
                    Text("진행중인 미션이")
                    Text("\(missioncnt)")
                        .foregroundStyle(Color.orange)
                    Text("개 있습니다")
                }
                .modifier(CountModify())
                .padding(.bottom,30)
        
                List{
                    ForEach(0..<missioncnt, id:\.self) { item in
                        NavigationLink(value: item) {
                            MyMissionList(mission: $missionStore.missions[item])
                        }.listRowSeparator(.hidden)
                        
                    }
                }.scrollContentBackground(.hidden)
                    .navigationDestination(for: Int.self) { i in
                        MyMissionDetailView(missionStore: missionStore, missions: $missionStore.missions[i], path: $stackPath, succeededMissons: $succeededMissons, showActionSheet: false,btnStatus: btnStatus)
                    
                    }
                   
     
                //완료된 갯수가 0개 이상이면 나타나
                if succeededMissons > 0 {
                    HStack {
                    Text("진행중인 미션이")
                    Text("\(succeededMissons)")
                        .foregroundStyle(Color.orange)
                    Text("개 있습니다")
                    }
                        .modifier(CountModify())
                        .offset(x:0, y: -250)
                    SucceededMisson()
                        .offset(x:-10, y: -170)
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
            .offset(x:0, y:50)
    }
}

#Preview {
    MyMissionListView()
}
