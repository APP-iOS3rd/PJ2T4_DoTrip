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
    @Binding var succeededMissons: Int
    
    //카메라
    @Binding var showActionSheet : Bool
    // @State var showActionSheet: Bool
    @State var showImagePicker: Bool = false
    @State var image : Image?
    @State var sourcetype :Int = 0
    
    @State var btnStatus :Bool = false
    @State var showingAlert: Bool  = false
    
    
    var body: some View {
        ZStack{
        
            VStack(alignment:.leading,spacing: 0){
              
                    Text("\(missions.name)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Text("\(missions.description)")
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                        .padding(.top,6 )
                    Text("\(missions.address)")
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                        .padding(.top,3 )
            }.offset(x:-25,y:-280)
                

            VStack{
                if !btnStatus {
                    
                    Image("경복궁사진1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 330,height: 350)
                        .cornerRadius(20)
                        .padding(.bottom,45)
                    
                    Button {
                        btnStatus = true
                    } label: {
                        Text("미션 시작하기")
                            .fontWeight(.regular)
                            .frame(width:250, height: 50)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius:2, x:0, y:2)
                    
                    }
                }else {
                 
                        Image(systemName:"photo.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 40))
                            .frame(width: 330,height: 350)
                            .background(Color.gray)
                            .cornerRadius(20)
                            .opacity(0.1)
                            .overlay(
                                image?
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 330,height: 350)
                                    .cornerRadius(20))
                            .offset(x:0,y:30)

                            .padding(.bottom,40)
                        
                        Button {
                            self.showActionSheet.toggle()
                            btnStatus = true
                        } label: {
                            Image(systemName: "photo.badge.plus.fill")
                            Text("미션을 인증해 주세요!")
       
                        }
                        .font(.system(size: 18))
                        .foregroundStyle(Color.orange)
//                       .padding(.top,20)
     
                    HStack{
                        Button {
                            showingAlert = true
                            succeededMissons += 1
                        } label: {
                            Text("미션 완료하기")
                                .fontWeight(.regular)
                                .frame(width: 150, height: 50)
                                .foregroundColor(.white)
                                .background(Color(hex: 0xFFA800))
                                .cornerRadius(10)
                                .shadow(radius: 2, x: 0, y: 2)
                        }/*.padding(.bottom,5)*/
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("미션 완료"),
                                message: Text("미션이 완료되었습니다."),
                                dismissButton: .default(Text("확인")) {
                                    giveupMission()
                                }
                            )// Alert
                        }
                      
                          // Alert
                            
                            Button {
                                giveupMission()
                            } label: {
                                Text("미션 포기하기")
                                    .fontWeight(.regular)
                                    .frame(width:150, height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius:2, x:0, y:2)
                            }
                        }//HStack -Button
                    .padding(.top,39)
                            
//
    }//VStack?
 }   //카메라 로직부분
            .actionSheet(isPresented: $showActionSheet, content:{ () -> ActionSheet in
                ActionSheet(title: Text("이미지 선택하기"),message: Text("사진첩에서 이미지를 고르거나 카메라를 사용해주세요"), buttons: [ActionSheet.Button.default(Text("카메라"), action: {
                    self.sourcetype = 0
                    self.showImagePicker.toggle()
                }),
                ActionSheet.Button.default(Text("사진"),action: {
                    self.sourcetype = 1
                    self.showImagePicker.toggle()
                }),
                ActionSheet.Button.cancel()])
            })//actionSheet.
                
                if showImagePicker {
                    ImagePicker(isVisible: $showImagePicker,image: $image, sourcetype: sourcetype )
                }
        }.onAppear{self.image = Image(self.missions.image) }
            
            
        }//MyMissionDetailView
    //네비게이션 패스
    func giveupMission() {
        guard !path.isEmpty else {
            print("Path is empty!")
            return
        }
        print("Removing from path: \(path)")
        path.removeLast()
    } //네비게이션 패스// var body: some View
}

