//
//  ModiftProfileView.swift
//  Dotrip
//
//  Created by 이현호 on 12/10/23.
//

import PhotosUI
import SwiftUI

class UserData: ObservableObject {
    @AppStorage("myPageNickname") var myPageNickname: String = "카피바라"
}

struct ModifyProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var userData: UserData
    @State private var showingAlert = false // 변경 완료 알림
    @State var showPicker = false
    
    init(userData: UserData) {
            self.userData = userData
    }
    
    var pickerConfig: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images
        config.selectionLimit = 20
        config.preferredAssetRepresentationMode = .current
        config.preselectedAssetIdentifiers = preseletedAssetIdentifiers
        
        return config
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .topTrailing) {
                    Circle()
                        .fill(Color(hex: 0xDADADA))
                        .overlay(
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(width: 60, height: 60)
                        )
                        .frame(width: 100, height: 100)
                    // 프로필 사진 변경을 위한 앨범
                    Button {
                        showPicker.toggle()
                    } label: {
                        Image(systemName: "camera.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .padding(.top, 65)
                    }
                    .sheet(isPresented: $showPicker, content: {
                        ImagePicker2(config: pickerConfig) {
                            seletedImages in
                            processSeletedImages(results: seletedImages)
                        }
                        .ignoresSafeArea()
                    })
                }
                .padding(.top, 40)
                
                HStack {
                    Text("닉네임")
                        .navigationBarTitle("프로필 수정", displayMode: .inline)
                        .navigationBarItems(
                            trailing: Button("완료") {
                                dismiss()
                            }
                        )
                    ZStack(alignment: .trailing) {
                        TextField("닉네임을 입력해주세요.", text: $userData.myPageNickname)
                            .padding()
                            .overlay(Rectangle().frame(height: 1).padding(.top, 30))
                        Button("변경") {
                            UserDefaults.standard.setValue(userData.myPageNickname, forKey: "myPageNickname")
                            
                            showingAlert = true
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("변경 완료"), message: Text("변경이 완료되었습니다."), dismissButton: .default(Text("확인")))
                        }
                    }
                    .padding()
                }
                .padding(30)
                Spacer()
            }
        }
    }
    
    func processSeletedImages(results: [PHPickerResult]) {
        
    }
}

#Preview {
    ModifyProfileView(userData: UserData())
}
