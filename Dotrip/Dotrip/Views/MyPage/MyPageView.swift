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
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    CardContent(showModal: $showModal, userData: userData, geometry: geometry)
                        .padding()
                    
                    Spacer()
                    
                    ListSection()
                        .padding()
                        .listStyle(InsetListStyle())
                    
                    HStack {
                        Button {
                            print("로그아웃")
                        } label: {
                            Text("로그아웃")
                                .font(.system(size: 12))
                                .frame(width: 80, height: 25)
                                .foregroundStyle(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(Color(hex: 0xC2BDBD), lineWidth: 1.5)
                                )
                        }
                        
                        Spacer()
                        
                        Button {
                            print("탈퇴하기")
                        } label: {
                            Text("탈퇴하기")
                                .font(.system(size: 12))
                                .frame(width: 80, height: 25)
                                .foregroundStyle(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(Color(hex: 0xC2BDBD), lineWidth: 1.5)
                                )
                        }
                    }
                    .padding(40)
                }
            }
        }
    }
}

// 프로필 정보
struct CardContent: View {
    @Binding var showModal: Bool
    @ObservedObject var userData: UserData
    var geometry: GeometryProxy
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: geometry.size.width * 0.85, height: geometry.size.width * 0.5)
                .shadow(radius: 2, x: 0, y: 2)
                .overlay(
                    HStack {
                        LeftContent(userData: userData, showModal: $showModal, geometry: geometry)
                        Divider()
                            .frame(width: 1, height: 160)
                        RightContent(geometry: geometry)
                    }
                )
        }
    }
}

// 프로필 왼쪽 정보
struct LeftContent: View {
    var userData: UserData
    @Binding var showModal: Bool
    var geometry: GeometryProxy
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
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
    }
}

// 오른쪽 정보
struct RightContent: View {
    var geometry: GeometryProxy
    
    var body: some View {
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
}

// 리스트
struct ListSection: View {
    var body: some View {
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
    }
}

#Preview {
    MyPageView()
}
