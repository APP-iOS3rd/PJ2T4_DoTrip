//
//  File.swift
//  Dotrip
//
//  Created by 김혜란 on 12/13/23.
//

import SwiftUI
import ExpandableText


struct EventDetailView2: View {
    
    @StateObject var eventInfo = EventInfoAPI.shared
    @StateObject var eventIntro = IntroductionAPI.shared
    @StateObject var network = TourKoreaAPI.shared
    @State private var showMoreText = false
    @State private var sampleText: String?
    @State private var sampleImage: String?
        
    
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
                
//                Image(systemName: "personalhotspot")
//                    .frame(width: 350, height: 200)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.black, lineWidth: 2)
//                            .padding()
//                    )
                
                VStack(alignment: .leading, spacing: 10) {
                    AsyncImage(url: URL(string: sampleImage ?? "" )) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding()
                
                    VStack(alignment: .leading, spacing: 10) {
                        ScrollView {
                            ExpandableText(text: sampleText ?? "")
                                .font(.system(size: 14))
                                .foregroundColor(.primary)
                                .lineLimit(4)
                                .expandButton(TextSet(text: "더보기", font: .system(size: 14), color: .blue))
                                .collapseButton(TextSet(text: "접기", font: .system(size: 14), color: .blue))
                                .expandAnimation(.easeOut)
                                .padding(.horizontal, 24)
                            
                        }
                    }
                    Spacer() // 텍스트를 오른쪽으로 이동시키기 위한 Spacer
                    
                }.padding()
                
                
                Button("미션 하러 가기") {}
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
            if let firstPost = eventIntro.posts.first { sampleText = firstPost.infotext }
//            if let network = TourKoreaAPI.shared { sampleImage = network.posts }
        }
        .navigationTitle("행사 정보")
    }
}

#Preview {
    //    EventDetailView2()
    EventDetailView2(contentId: "3021116", contentTypeId: "15")
}

