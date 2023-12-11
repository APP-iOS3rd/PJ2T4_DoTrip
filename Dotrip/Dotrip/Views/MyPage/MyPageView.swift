//
//  MyPageView.swift
//  Dotrip
//
//  Created by 이현호 on 12/10/23.
//

import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double((hex >> 0) & 0xff) / 255
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

struct MyPageView: View {
    @State private var showModal = false
    @ObservedObject private var userData: UserData = UserData()
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: geometry.size.width * 0.85, height: geometry.size.width * 0.5)
                                .shadow(radius: 4, x: 0, y: 4)
                                .overlay(
                                    HStack {
                                        // 좌측 내용
                                        ZStack(alignment: .topTrailing) {
                                            // 프로필수정
                                            Button {
                                                self.showModal = true
                                            } label: {
                                                Image(systemName: "gearshape")
                                                    .font(.system(size: 20))
                                                    .foregroundColor(.black)
                                            }
                                            .sheet(isPresented: self.$showModal) {
                                                ModifyProfileView(userData: userData)
                                            }
                                            .padding()
                                            
                                            VStack {
                                                Circle()
                                                    .fill(Color(hex: 0xDADADA))
                                                    .overlay(
                                                        Image("capybara")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 70, height: 70)
                                                    )
                                                    .padding()
                                                
                                                HStack {
                                                    Text(userData.myPageNickname)
                                                        .foregroundColor(.black)
                                                        .bold()
                                                    Text("님")
                                                        .foregroundColor(.black)
                                                }
                                            }
                                            .padding()
                                        .frame(width: geometry.size.width * 0.425)
                                        }
                                        
                                        // 세로 구분선
                                        Divider()
                                            .frame(width: 1, height: geometry.size.width * 0.4)
//                                            .background(Color(hex: 0xDADADA))
                                        
                                        Spacer()
                                        
                                        // 우측 내용
                                        VStack {
                                            Text("보유 포인트")
                                                .foregroundColor(.black)
                                                .padding(1)
                                            Text("1,203")
                                                .font(.system(size: 30))
                                                .bold()
                                                .foregroundColor(Color(hex: 0xFFA800))
                                        }
                                        .padding()
                                        .frame(width: geometry.size.width * 0.425)
                                    }
                                )
                        }
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                    
                    // 리스트
                    List {
                        Section(header: Text("포인트")) {
                            NavigationLink(destination: PointHistoryView()) {
                                Text("포인트 사용내역")
                            }
                            NavigationLink(destination: PointExchangeView()) {
                                Text("포인트 교환")
                            }
                        }
                        
                        Section(header: Text("고객센터")) {
                            NavigationLink(destination: QnAView()) {
                                Text("자주 묻는 질문")
                            }
                            NavigationLink(destination: EmailInquiryView()) {
                                Text("이메일 문의")
                            }
                        }
                    }
                    
                    .padding()
                    .listStyle(InsetListStyle())
                    
                    HStack {
                        Button {
                            print("Button action")
                        } label: {
                            Text("로그아웃")
                                .font(.system(size: 12))
                                .frame(width: 80, height: 25)
                                .foregroundStyle(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(Color(hex: 0xC2BDBD),lineWidth: 1.5)
                                )
                        }
                        
                        Spacer()
                        
                        Button {
                            print("Button action")
                        } label: {
                            Text("탈퇴하기")
                                .font(.system(size: 12))
                                .frame(width: 80, height: 25)
                                .foregroundStyle(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(Color(hex: 0xC2BDBD),lineWidth: 1.5)
                                )
                        }
                    }
                    .padding(40)
                }
            } // End VStack
            
        }
        .tabItem {
            Image(systemName: "person")
            Text("MY")
        }
    }
}

#Preview {
    MyPageView()
}
