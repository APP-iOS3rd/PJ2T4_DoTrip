//
//  File.swift
//  Dotrip
//
//  Created by 김혜란 on 12/13/23.
//

import SwiftUI



struct EventDetailView2: View {
    
    @StateObject var eventInfo = EventInfoAPI.shared
    @StateObject var eventIntro = IntroductionAPI.shared
    @StateObject var network = TourKoreaAPI.shared
    @State private var showMoreText = false
    
    
    let contentId: String
    let contentTypeId: String
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
//                                Text("ContentID = \(contentId)")
//                                Text("ContentID = \(contentTypeId)")
                ForEach(eventInfo.posts, id: \.self) { result in
                    
                    HStack{
                        Text("행사 기간 : ")
                            .fontWeight(.bold)
                            .padding(.leading,10)
                        Text("\(result.eventstartdate) ~ \(result.eventenddate)")
                    }
                    .font(.system(size: 14))
                    HStack{
                        Text("개장 시간 : ")
                            .fontWeight(.bold)
                            .padding(.leading,10)
                        Text("\(result.playtime)")
                    }
                    .font(.system(size: 14))
                    HStack{
                        Text("입장료 : ")
                            .fontWeight(.bold)
                            .padding(.leading,10)
                        Text("\(result.usetimefestival)")
                    }
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                }
                .padding(2)
                
                Image(systemName: "personalhotspot")
                    .frame(width: 350, height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .padding()
                    )
                    .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(eventIntro.posts, id: \.self) { result in
                        Text("행사 소개: \(result.infotext)")
                            .font(.system(size: 14))
                            .padding()
                            .lineLimit(showMoreText ? nil : 4)
                    }
                    Spacer() // 텍스트를 오른쪽으로 이동시키기 위한 Spacer
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            showMoreText.toggle()
                        }) {
                            Text(showMoreText ? "접기" : "더보기")
                                .foregroundColor(.black)
                                .font(.system(size: 14))
                        }
                        .padding()
                    }
                }.padding()
                
                Button("미션 하러 가기") {
                    
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                
                Spacer()
                
            }
        }
        
        .padding()
        .onAppear() {
            eventInfo.feachData(contentID: contentId, contentType: contentTypeId)
            eventIntro.feachData(contentID: contentId, contentType: contentTypeId)
        }
        .navigationTitle("행사 정보")
    }
}




#Preview {
//    EventDetailView2()
    EventDetailView2(contentId: "3021116", contentTypeId: "15")
}

