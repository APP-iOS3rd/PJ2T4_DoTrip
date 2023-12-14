//
//  SBIceAmericanoView.swift
//  Dotrip
//
//  Created by 이현호 on 12/13/23.
//

import SwiftUI

struct SBIceAmericanoView: View {
    
    var body: some View {
        
        VStack(alignment: .center) {
            Image("SBIceAmericano")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("아이스 아메리카노")
                .font(.title3)
                .bold()
                .padding(2)
            //구매버튼
            BuyingButton()
            Divider()
                .frame(maxWidth:.infinity)
                .padding(.top, 20)
            ScrollView {
                SBIceAmericanoDetailView()
            }
        }
        .navigationTitle("구매하기")
    }
}

// 상세정보
struct SBIceAmericanoDetailView: View {
    var body: some View {
        VStack (alignment:.leading, spacing: 20) {
            Text("아이스 카페 아메리카노 T (4,500원)")
                .font(.headline)
            
            Text("스타벅스의 깔끔한 맛을 자랑하는 커피로, 스타벅스 파트너들이 가장 좋아하는 커피입니다.")
            
            Text("이용안내")
                .font(.headline)
            
            Text("- 상기 이미지는 연출된 것으로 실제와 다를 수 있습니다.")
            Text("- 본 상품은 매장 재고 상황에 따라 동일 상품으로 교환이 불가능할 수 있습니다.")
            Text("- 동일 상품 교환이 불가한 경우 동일 가격 이상의 다른 상품으로 교환이 가능합니다.(차액 발생 시 차액 지불) 만약 다른 상품으로 교환을 원치 않을 경우 매장에서 환불 요청 접수가 가능하며, 접수는 고객센터로 문의주시기 바랍니다.")
            Text("- 스타벅스 앱의 사이렌 오더를 통해서도 주문 및 결제가 가능합니다. (일부 MD제외)")
            Text("- 미군부대 매장, 워터파크 입점 매장 등 일부 매장에서는 사용이 불가합니다.")
            Text("- 해당 쿠폰과 스타벅스 카드의 복합결제 거래는 스타벅스 카드의 고유 혜택인 Free Extra 및 별 적립은 적용 대상이 아닌 점 이용에 참고하시기 바랍니다.")
            Text("- 정식 판매처 외의 장소나 경로를 통하여 구매하거나, 기타의 방법으로 보유하신 쿠폰은 정상적인 사용 (환불, 재전송 등 포함)이 금지되거나 제한될 수 있으니 주의하시기 바랍니다.")
            
            
        }
        .padding()
    }
}

// 구매하기 버튼
struct BuyingButton: View {
    @State private var showingAlert = false
    @State private var showPurchaseCompletedAlert = false
    
    var body: some View {
        VStack {
            Button(action: {
                showingAlert = true
            }) {
                VStack {
                    Text("구매하기")
                        .font(.title3)
                    Text("450P 차감")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .bold()
                }
                .frame(width:280, height: 50)
                .foregroundColor(.white)
                .background(Color(hex: 0xFFA800))
                .cornerRadius(10)
                .shadow(radius:2, x:0, y:2)
                
            }
            
            // 구매확인 알림
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("구매 확인"),
                    message: Text("해당 상품을 구매하시겠습니까?"),
                    primaryButton: .default(
                        Text("확인"),
                        action: {
                            showPurchaseCompletedAlert = true
                        }
                    ),
                    secondaryButton: .default(Text("취소"))
                )
            }
            
//            // 구매완료 알림
//            .alert(isPresented: $showPurchaseCompletedAlert) {
//                Alert(
//                    title: Text("구매 완료"),
//                    message: Text("구매가 완료되었습니다."),
//                    dismissButton: .default(Text("확인"))
//                )
//            }
        }
    }
}


#Preview {
    SBIceAmericanoView()
}
