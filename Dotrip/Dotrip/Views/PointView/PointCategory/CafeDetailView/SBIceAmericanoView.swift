//
//  SBIceAmericanoView.swift
//  Dotrip
//
//  Created by 이현호 on 12/13/23.
//

import SwiftUI

struct SBIceAmericanoView: View {
    @ObservedObject var productDetail: ProductDetailModel
      
    var body: some View {
        
        VStack(alignment: .center) {
            Image(productDetail.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(productDetail.title)
                .font(.title3)
                .bold()
                .padding(2)
            //구매버튼
            BuyingButton()
            Divider()
                .frame(maxWidth:.infinity)
                .padding(.top, 20)
            ScrollView {
                SBIceAmericanoDetailView(productDetail: productDetail)
            }
        }
        .navigationTitle("구매하기")
    }
}

// 상세정보
struct SBIceAmericanoDetailView: View {
    @ObservedObject var productDetail: ProductDetailModel
    
    var body: some View {
        VStack (alignment:.leading, spacing: 20) {
            Text("아이스 카페 아메리카노 T (\(productDetail.price))")
                .font(.headline)
            Text(productDetail.description)
            
            ForEach(productDetail.details, id: \.self) { detail in
                if detail == "이용안내" {
                    Text(detail)
                        .font(.headline)
                } else {
                    Text(detail)
                        .font(.body) // 다른 폰트 스타일을 원하는대로 변경하세요
                }
                
            }
        }
        .padding()
    }
}

// 구매하기 버튼
struct BuyingButton: View {
    @State private var showingAlert = false
    @State private var buttonColor: Color = Color(hex: 0xFFA800)
    @State private var textColor: Color = .white
    @State private var buttonText: String = "구매하기"
    @State private var isButtonDisabled = false // 버튼 활성화 & 비활성화
    @State private var showPointsText = true // 포인트 텍스트 활성화 & 비활성화
    
    
    var body: some View {
        VStack {
            Button(action: {
                showingAlert = true
            }) {
                VStack {
                    Text(buttonText)
                        .font(.title3)
                        .foregroundColor(textColor)
                    if showPointsText {
                        Text("450P 차감")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .bold()
                    }
                }
                .frame(width:280, height: 50)
                .foregroundColor(.white)
                .background(buttonColor)
                .cornerRadius(10)
                .shadow(radius:2, x:0, y:2)
            }
            .disabled(isButtonDisabled)
            
            // 구매확인 알림
            .alert("해당 상품을 구매하시겠습니까?",isPresented: $showingAlert) {
                
                Button("취소", role: .cancel) {
                }
                Button("확인") {
                    buttonText = "구매완료"
                    buttonColor = Color(hex: 0xDADADA)
                    textColor = .gray
                    isButtonDisabled = true
                    showPointsText = false // "450P 차감" 텍스트 숨김
                }
                
            }
        }
    }
}


#Preview {
    SBIceAmericanoView(productDetail: sbIceAmericano)
}
