//
//  PointDetail.swift
//  Dotrip
//
//  Created by Hee on 12/14/23.
//

import SwiftUI

struct PointDetail: View {
    var body: some View {
        ScrollView {
            ExtractedView(date: "2023-12-01", store: "롯데리아 5,000원 상품권", point: "50 포인트 적립", usePoint: "-500P")
                .padding(.bottom, -7)
            ExtractedView(date: "2023-12-05", store: "투썸플레스 아메리카노R", point: "40 포인트 적립", usePoint: "-450P")
                .padding(.bottom, -7)
            ExtractedView(date: "2023-12-11", store: "도서문화상품권 10,000원", point: "100 포인트 적립", usePoint: "-1000P")
                .padding(.bottom, -7)
            ExtractedView(date: "2023-12-16", store: "롯데리아 5,000원 상품권", point: "50 포인트 적립", usePoint: "-500P")
                .padding(.bottom, -7)
            ExtractedView(date: "2023-12-22", store: "투썸플레스 아메리카노R", point: "40 포인트 적립", usePoint: "-450P")
                .padding(.bottom, -7)
            ExtractedView(date: "2023-12-31", store: "도서문화상품권 10,000원", point: "100 포인트 적립", usePoint: "-1000P")
                .padding(.bottom, -7)
        }
    }
}

struct ExtractedView: View {
    
    var date: String
    var store: String
    var point: String
    var usePoint: String
    
    var body: some View {

            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 2,height: 60)
                    Circle()
                        .frame(width: 8, height: 8)
                }
                .padding(.trailing, 10)
                .foregroundColor(Color(hex: 0xDADADA))
                
                HStack(alignment: .top) {
                    Text(date)
                        .font(.system(size: 12))
                    
                    Text(store)
                        .font(.system(size: 14))
                }
                
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(Color(hex: 0xDADADA))
                        .cornerRadius(20)
                        .frame(width: 60, height: 25)
                    Text(usePoint)
                        .font(.caption)
                }
            }
            .padding(.horizontal, 10)
        }
}

#Preview {
    PointDetail()
}
