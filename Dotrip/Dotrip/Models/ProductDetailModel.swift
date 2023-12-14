//
//  ProductDetailModel.swift
//  Dotrip
//
//  Created by 이현호 on 12/14/23.
//

import Foundation
import SwiftUI

class ProductDetailModel: ObservableObject {
    var imageName: String
    var title: String
    var description: String
    var price: String
    var details: [String] // 새로운 속성 추가

    init(imageName: String, title: String, description: String, price: String, details: [String]) {
        self.imageName = imageName
        self.title = title
        self.description = description
        self.price = price
        self.details = details
    }
}

let sbIceAmericano = ProductDetailModel(
    imageName: "SBIceAmericano",
    title: "아이스 아메리카노",
    description: "스타벅스의 깔끔한 맛을 자랑하는 커피로, 스타벅스 파트너들이 가장 좋아하는 커피입니다.",
    price: "4,500원",
    details: [
        "이용안내",
        "- 상기 이미지는 연출된 것으로 실제와 다를 수 있습니다.",
        "- 본 상품은 매장 재고 상황에 따라 동일 상품으로 교환이 불가능할 수 있습니다.",
        "- 동일 상품 교환이 불가한 경우 동일 가격 이상의 다른 상품으로 교환이 가능합니다.(차액 발생 시 차액 지불) 만약 다른 상품으로 교환을 원치 않을 경우 매장에서 환불 요청 접수가 가능하며, 접수는 고객센터로 문의주시기 바랍니다.",
        "- 스타벅스 앱의 사이렌 오더를 통해서도 주문 및 결제가 가능합니다. (일부 MD제외)",
        "- 미군부대 매장, 워터파크 입점 매장 등 일부 매장에서는 사용이 불가합니다.",
        "- 해당 쿠폰과 스타벅스 카드의 복합결제 거래는 스타벅스 카드의 고유 혜택인 Free Extra 및 별 적립은 적용 대상이 아닌 점 이용에 참고하시기 바랍니다.",
        "- 정식 판매처 외의 장소나 경로를 통하여 구매하거나, 기타의 방법으로 보유하신 쿠폰은 정상적인 사용 (환불, 재전송 등 포함)이 금지되거나 제한될 수 있으니 주의하시기 바랍니다."
    ]
)
