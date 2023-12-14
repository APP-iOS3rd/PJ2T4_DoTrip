//
//  MyMissionList.swift
//  Dotrip
//
//  Created by 유지인 on 12/11/23.
//

import SwiftUI

struct MyMissionList: View {
    @Binding var mission: Mission
    var body: some View {
        
        ZStack(){
            
            Rectangle()
                .modifier(ListModify())
                .overlay(
                    VStack(alignment:.leading){
                        Text("\(mission.name)")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                       Text(mission.address)
                            .font(.system(size: 15))
                    }.padding(.trailing, 10)
                )
        }.offset(x:9,y:0)
    }
}

struct SucceededMisson: View {
    var body: some View {
        ZStack(){
            Rectangle()
                .modifier(ListModify())
                .overlay(
                    VStack(alignment:.leading){
                        Text("경복궁에서 한복을 입고 인증샷 찍기")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            //.padding(.vertical,0.2)
                        
                       Text("서울특별시 종로구 사직로 161")
                            .font(.system(size: 15))
                    }.padding(.trailing, 10)
                )
            Image(systemName: "")
        }.offset(x:9,y:0)
    }
}
