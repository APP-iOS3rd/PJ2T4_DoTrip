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
   
            VStack(alignment:.leading, spacing: 0){
            
                Text("\(mission.name)")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                
                Text(mission.address)
                    .font(.system(size: 14))
                    .fontWeight(.regular)

            }
            //피그마에서 지정한 사이즈와 swiftui 에서의 width가 다른듯
            .frame(width: 320, height: 70)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius:4, x:0, y:4)

    }
}
