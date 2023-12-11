//
//  MyMissionCameraView.swift
//  Dotrip
//
//  Created by 유지인 on 12/11/23.
//

import SwiftUI

struct MyMissionCameraView: View {
    
    @Binding var mission: Mission
    
    @State var showActionSheet: Bool = false
    @State var showImagePicker: Bool = false
    @State var image : Image?
    @State var sourcetype :Int = 0
    
    var body: some View {
        ZStack{
            VStack{
                image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350)
                    .cornerRadius(20)
                    .overlay(
                        CameraButtonView(showActionSheet: $showActionSheet)
                           // .offset(x:50,y:65)
                    )
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
        .onAppear{self.image = Image(self.mission.image) }
    }
}


//#Preview {
//    MyMissionCameraView()
//}
