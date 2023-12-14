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
   
            VStack(alignment:.leading){
                Text("\(mission.name)")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding(.vertical,0.5)
                    .offset(x:-12,y:0)
                Text(mission.address)
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .offset(x:-12,y:0)
                  

            }
            
            .frame(width: 320, height: 70)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius:2, x:0, y:2)
          

    }
}

struct SucceededMisson: View {
    var body: some View {
   
            VStack(alignment:.leading){
                Text("경복궁에서 한복을 입고 인증샷 찍기")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding(.vertical,0.5)
                    .offset(x:-12,y:0)
                Text("서울특별시 종로구 사직로 161")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .offset(x:-12,y:0)
                  

            }
            
            .frame(width: 320, height: 70)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius:2, x:0, y:2)
          

    }
}


