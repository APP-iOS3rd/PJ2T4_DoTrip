//
//  PointExchangeView.swift
//  Dotrip
//
//  Created by 이현호 on 12/13/23.
//

import SwiftUI

struct PointExchangeView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    Text("상점")
                        .frame(width:350, alignment: .leading)
                        .font(.title)
                        .bold()
                        .padding(.top,20)
                    Spacer()
                    HStack {
                        Spacer()
                        ZStack {
                            Rectangle()
                                .fill(Color(hex: 0xFFF0DF))
                                .frame(height: geometry.size.width * 0.62)
                            PointCard(geometry: geometry)
                        }
                        Spacer()
                    }
                    GridButtons()
                    Spacer()
                }
            }
        }
    }
}

// 포인트 카드 상세뷰
struct PointCard: View {
    var geometry: GeometryProxy
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.47)
                .shadow(radius: 2, x: 0, y: 2)
                .overlay(
                    VStack() {
                        // 보유 포인트
                        RightContent(geometry: geometry)
                        Divider()
                        NavigationLink(destination: PointHistoryView()) {
                            // 전체 영역 클릭을 위한 VStack
                            VStack {
                                HStack() {
                                    Spacer()
                                    Text("포인트 사용 내역")
                                        .foregroundStyle(.black)
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(Color(hex: 0xFFA800))
                                }
                                .padding()
                            }
                        }
                    }
                )
        }
    }
}

// 포인트교환 카테고리 버튼
struct GridButtons: View {
    struct Item {
        var imageName: String
        var labelText: String
        var view: AnyView
    }
    
    let items: [Item] = [
            Item(imageName: "ConvenienceStore", labelText: "편의점", view: AnyView(ConvenienceStoreView())),
            Item(imageName: "Cafe", labelText: "카페", view: AnyView(CafeView())),
            Item(imageName: "FastFood", labelText: "패스트푸드", view: AnyView(FastFoodView())),
            Item(imageName: "Theater", labelText: "영화관", view: AnyView(TheaterView())),
            Item(imageName: "Leisure", labelText: "취미/여가", view: AnyView(LeisureView())),
            Item(imageName: "DiscountCoupon", labelText: "할인권", view: AnyView(DiscountView())),
            Item(imageName: "Gift", labelText: "선물", view: AnyView(GiftView())),
            Item(imageName: "Voucher", labelText: "상품권", view: AnyView(VoucherView())),
            Item(imageName: "Hotel", labelText: "여행/숙박", view: AnyView(HotelView())),
        ]
    
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))],spacing: 20) {
            ForEach(items, id: \.imageName) { item in
                NavigationLink(destination: item.view) {
                    VStack {
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding()
                        
                        // 포인트교환 아이템 카테고리 글꼴색
                        Text(item.labelText)
                            .foregroundStyle(Color(hex: 0x7E7E7E))
                            .font(.caption)
                    }
                }
            }
        }
        .padding()
        .padding(.bottom,60)
    }
}

#Preview {
    PointExchangeView()
}
