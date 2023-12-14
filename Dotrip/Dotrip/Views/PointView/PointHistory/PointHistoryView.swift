//
//  MyPageListView.swift
//  Dotrip
//
//  Created by 이현호 on 12/10/23.
//

import SwiftUI

struct PointHistoryView: View {
    
    @State private var tap1 = true
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(width: 350, height: 60)
                    .shadow(radius: 2, x: 0, y: 2)
                
                HStack {
                    Text("보유 포인트: ")
                    Text("20,143P")
                        .foregroundStyle(Color.pointColor)
                        .bold()
                    Spacer()
                }
                .padding(.leading, 20)
            }
            .padding(EdgeInsets(top: 30, leading: 0, bottom: 50, trailing: 0))
            
            HStack {
                Button(action: { tap1 = true}, label: {
                    if tap1 {
                        Text("사용내역")
                            .bold()
                            .underline()
                    } else {
                        Text("사용내역")
                            .foregroundStyle(.gray)
                    }
                })
                
                Button(action: { tap1 = false}, label: {
                    if !tap1 {
                        Text("획득내역")
                            .bold()
                            .underline()
                    } else {
                        Text("획득내역")
                            .foregroundStyle(.gray)
                    }
                })
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 0))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("\("2023-12-01") ~ \("2023-12-31")")
                        .font(.system(size: 16))
                    
                    Spacer()
                    
//                    Button(action: { }, label: { Label("기간 설정", systemImage: "arrowtriangle.down.fill") })
                    Text("기간 설정")
                        .font(.system(size: 14))
                    Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .frame(width: 12, height: 10)
                }
                Rectangle()
                    .fill(Color(hex: 0xDADADA))
                    .frame(height: 2)
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 10))
            
            if tap1 {
                PointDetail()
            } else {
                PointAcqView()
            }
            
            Spacer()
        }
        .padding(20)
        .navigationTitle("포인트 내역")
    }
}

#Preview {
    PointHistoryView()
}
