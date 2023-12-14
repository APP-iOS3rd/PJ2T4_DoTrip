//
//  EmailInquiryView.swift
//  Dotrip
//
//  Created by 이현호 on 12/10/23.
//

import SwiftUI

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color(hex: 0xB5B5B5))
                    .padding(.top, 35)
            )
    }
}

struct EmailInquiryView: View {
    @State private var emailFieldInput: String = ""
    @State var selectedCategory = "Category"
    var Category = ["계정 관련", "포인트 관련", "미션 관련", "오류", "건의사항","기타"]
    @State private var inquiryContent = ""
    @State private var showingAlert = false // 변경 완료 알림
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading) {
                    Text("답변 받으실 이메일")
                        .bold()
                    TextField("이메일을 입력해주세요.", text: $emailFieldInput) // 이메일 형식이라 파란색으로 뜸
                        .underlineTextField()
                }.padding()
            }
            
            VStack(alignment: .leading) {
                Text("문의 유형")
                    .bold()
                HStack {
                    Picker("Choose a category", selection: $selectedCategory) {
                        ForEach(Category, id: \.self) {
                            Text($0)
                        }
                        .foregroundStyle(.black)
                        .pickerStyle(.menu)
                    }
                    .padding(-10)
                    .accentColor(Color(.black))
                    Spacer()
                }
                .padding(.vertical, 10)
                .underlineTextField()
                .foregroundColor(Color(hex: 0xB5B5B5))
                
            }
            .padding()
            
            VStack (alignment: .leading) {
                Text("문의 내용")
                    .bold()
                ZStack (alignment: .topLeading) {
                    Rectangle()
                        .foregroundStyle(Color(hex: 0xF4F4F4))
                        .cornerRadius(10)
                    TextField("내용을 입력해주세요.", text: $inquiryContent, axis: .vertical)
                        .padding()
                }
                HStack {
                    Spacer()
                    CounterView(text: $inquiryContent)
                        .bold()
                        .frame(alignment: .leading)
                }
            }
            .padding()
            Spacer()
            
            VStack {
                Button(action: {
                    showingAlert = true
                }) {
                    Text("문의하기")
                        .frame(width:330, height: 50) // 텍스트에 프레임 적용
                        .foregroundColor(.white)
                        .background(Color(hex: 0xFFA800))
                        .cornerRadius(10)
                        .shadow(radius:2, x:0, y:2)
                        .padding()
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("문의 완료"), message: Text("문의하신 내용이 정상적으로 접수되었습니다."), dismissButton: .default(Text("확인")))
                }
                .navigationTitle("이메일 문의")
                .padding()
            }
        }
        .padding()
    }
}

// 글자수 카운트
struct CounterView: View {
    @Binding var text: String
    var counter: Int = 0
    
    init(text: Binding<String>) {
        self._text = text
        counter = self._text.wrappedValue.count
    }
    
    var body: some View {
        Text("\(counter) / 1000")
            .font(.caption)
            .foregroundStyle(.black)
    }
}


#Preview {
    EmailInquiryView()
}
