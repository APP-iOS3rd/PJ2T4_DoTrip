//
//  ModiftProfileView.swift
//  Dotrip
//
//  Created by 이현호 on 12/10/23.
//

import SwiftUI

struct ModifyProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var nickname: String = "카피바라"
    
    var body: some View {
        NavigationView {
            
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
                    
                    Button {
                        // 사진 변경 동작
                    } label: {
                        Image(systemName: "camera.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .padding(3)
                    }
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
                        TextField("닉네임을 입력해주세요.", text: $nickname)
                            .padding()
                            .overlay(Rectangle().frame(height: 1).padding(.top, 30))
                        Button("변경") {
                            
                        }
                    }
                    .padding()
                    
                }
                .padding(30)
                Spacer()
            }
        }
    }
}

#Preview {
    ModifyProfileView()
}
