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
    
    @State var showActionSheet: Bool = false
    @State var showImagePicker: Bool = false
    @State var image : Image?
    @State var sourcetype :Int = 0
    
    @State var btnStatus :Bool = false
    
    var body: some View {
        ZStack{
            VStack {
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
                }.offset(x:0,y:-80)
                
                VStack{
                    
                    if image != nil {
                        
                        image?
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 330,height: 350)
                            .cornerRadius(20)
                            .offset(x:0, y:-70)
                            .overlay(
                                CameraButtonView(showActionSheet: $showActionSheet)
                            )
                    }
                    
                    Button(action: {
                        giveupMission()
                        print("\(showActionSheet)")
                        print("\(showImagePicker)")
                    }) {
                        Text("미션 포기하기")
                            .fontWeight(.regular)
                            .frame(width:250, height: 50)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius:2, x:0, y:2)
                    }.offset(x:0,y: 30)
                }
            }
    
            .actionSheet(isPresented: $showActionSheet, content:{ () -> ActionSheet in
                ActionSheet(title: Text("이미지 선택하기"),message: Text("사진첩에서 이미지를 고르거나 카메라를 사용해주세요"), buttons: [ActionSheet.Button.default(Text("카메라"), action: {
                    self.sourcetype = 0
                    self.showImagePicker.toggle()
                }),
                ActionSheet.Button.default(Text("사진첩"),action: {
                    self.sourcetype = 1
                    self.showImagePicker.toggle()
                }),
                ActionSheet.Button.cancel()
                ])
            })
            if showImagePicker {
                ImagePicker(isVisible: $showImagePicker,image: $image, sourcetype: sourcetype )
            }
        }
        .onAppear{self.image = Image(self.missions.image) }
    }

 
    func giveupMission() {
        guard !path.isEmpty else {
            print("Path is empty!")
            return
        }
        print("Removing from path: \(path)")
        path.removeLast()
    }
}

