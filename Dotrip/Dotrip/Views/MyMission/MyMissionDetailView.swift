//
//  MyMissionDetailView.swift
//  Dotrip
//
//  Created by 유지인 on 12/11/23.
//

import SwiftUI

struct MyMissionDetailView: View {
   
       // @Binding var seletedMissions : Mission
        @Binding var missions : Mission
       
        
        @State var reward  = ""
        @State var clickedBtn = false
        @State var missionStatus = false
        @State var selectedImage = ""
        var body: some View {
            
                VStack {
                    VStack(alignment:.leading, spacing: 0){
                        Text("\(missions.name)")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.bottom,5)
                        Text("주소: \(missions.address)")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                        Text("미션내용:\(missions.description)")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                            

                        if missionStatus == true {
                            MyMissionCameraView(mission:$missions)
                                
                        }else {
                            Image("서울이미지1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 350)
                                .cornerRadius(20)
                        }
     
                    }
                  
                    ZStack{
                        
                        Button(self.clickedBtn == false ? "미션 시작" : "미션중") {
                            //클릭하면 카메라 작동
                            withAnimation{
                                self.clickedBtn = true
                                self.missionStatus = true
                            }
                        }
                        .fontWeight(self.clickedBtn == false ? .regular : .bold)
                        .frame(width:250, height: 50)
                        .foregroundColor(self.clickedBtn == false ? .black : .white)
                        .background(self.clickedBtn == true ?  Color.orange : Color.white)
                        .cornerRadius(10)
                        .shadow(radius:4, x:0, y:4)
                        .padding(.top, 100)
                        
                        Spacer()
                    }
                }//VStack
                .padding(20)
            }
            
        }

//#Preview {
//    MyMissionDetailView()
//}
