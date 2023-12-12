//
//  MyMissionDetailView.swift
//  Dotrip
//
//  Created by 유지인 on 12/11/23.
//

import SwiftUI

struct MyMissionDetailView: View {
   
        @StateObject var missionStore : MissionStore
        @Binding var missions : Mission
        @Binding var path: NavigationPath
        @Binding var showActionSheet : Bool
        @State var btnStatus = false
    
   

        var body: some View {
            
                ZStack {

                    VStack(alignment:.leading, spacing: 0){
                        Text("\(missions.name)")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.bottom,8)
                        Text("미션내용:\(missions.description)")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                        Text("주소: \(missions.address)")
                            .font(.system(size: 15))
                            .fontWeight(.regular)
                    }.offset(x:0, y:-250)//미션 내용, 장소 정보
                    
                    VStack(alignment:.leading, spacing: 0){
                            if btnStatus == false {
                                Button(action: {
                                    self.showActionSheet.toggle()
                                    btnStatus = true
                                    print("\(btnStatus)")
                                }) {
                                    //미션시작 버튼 클릭전
                                    VStack{
                                        Image("경복궁사진1")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 330, height: 280)
                                            .cornerRadius(20)
                                            .padding(.vertical,40)
                                            
                                        
                                        Text("미션 시작")
                                            .fontWeight(.regular)
                                            .frame(width:250, height: 50)
                                            .foregroundColor(.black)
                                            .background(Color.white)
                                            .cornerRadius(10)
                                            .shadow(radius:4, x:0, y:4)
                                            .offset(x:0, y: -10)
                                            
                                    }
                                }
                                
                            }else{
                                VStack{
                              //미션시작 버튼 클릭 후
                               //사진첨 들어옴
                                    MyMissionCameraView(mission: $missions, missionStore: missionStore, stackPath: $path)
                                    VStack{
                                        Text("미션중")
                                            .fontWeight(.regular)
                                            .frame(width:250, height: 50)
                                            .foregroundColor(.white)
                                            .background(Color.orange)
                                            .cornerRadius(10)
                                            .shadow(radius:4, x:0, y:4)
                                            .offset(x:0, y: -5)
                                           
                                        
                                        
                                        Button(action: {
                                            giveupMission()
                                            self.btnStatus.toggle()
                                            print("\(btnStatus)")
                                        }) {
                                            
                                            Text("미션 포기하기")
                                                .fontWeight(.regular)
                                                .frame(width:250, height: 50)
                                                .foregroundColor(.black)
                                                .background(Color.white)
                                                .cornerRadius(10)
                                                .shadow(radius:4, x:0, y:4)
                                        }
                                    }// VStack
                                    .offset(x:0, y: 210)
                                
                                }//이미지 포함 Vstack
                        }
                    }
                }
            }
            
            func succeededMissons() {
                let succeededItem = Mission(id: UUID().uuidString, name: "",
                                            address: "", description: "", image: "경복궁사진1")
                missionStore.missions.append(succeededItem)
            }

            //포기한 미션
            func giveupMission() {
                guard !path.isEmpty else {
                    print("Path is empty!")
                    return
                }
                print("Removing from path: \(path)")
                path.removeLast()
             }
            
        }

