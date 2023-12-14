//
//  PointAcqView.swift
//  Dotrip
//
//  Created by Hee on 12/14/23.
//

import SwiftUI

struct PointAcqView: View {
    var body: some View {
        ScrollView {
            ExtractedView2(date: "2023-12-01", store: "경복궁에서 사진찍기 미션", usePoint: "+100p")
                .padding(.bottom, -7)
            ExtractedView2(date: "2023-12-05", store: "남산타워에서 연인이랑 자물쇠 걸기 미션", usePoint: "+150p")
                .padding(.bottom, -7)
            ExtractedView2(date: "2023-12-11", store: "낙산사가서 무료국수 먹고오기", usePoint: "+100p")
                .padding(.bottom, -7)
            ExtractedView2(date: "2023-12-21", store: "경복궁에서 사진찍기 미션", usePoint: "+100p")
                .padding(.bottom, -7)
            ExtractedView2(date: "2023-12-24", store: "남산타워에서 연인이랑 자물쇠 걸기 미션", usePoint: "+150p")
                .padding(.bottom, -7)
            ExtractedView2(date: "2023-12-27", store: "낙산사가서 무료국수 먹고오기", usePoint: "+100p")
                .padding(.bottom, -7)
        }
    }
}

struct ExtractedView2: View {
    
    var date: String
    var store: String
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
                        .fill(Color(hex: 0xFFBB38))
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
    PointAcqView()
}
