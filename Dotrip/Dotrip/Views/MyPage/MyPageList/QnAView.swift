//
//  QnAView.swift
//  Dotrip
//
//  Created by 이현호 on 12/10/23.
//

import SwiftUI



struct QnAView: View {
    struct ListItem: Identifiable {
        var id: Int
        var title: String
        var content: String
        var isExpanded: Bool = false
    }
    
    @State private var listItems: [ListItem] = [
        ListItem(id: 0, title: "Q. DoTrip은 뭔가요?", content: "‘DoTrip’은 사용자가 다양한 지역의 관광 명소를 여행하면서 재미있는 미션을 수행하고, 이로 인해 특별한 경험과 보상을 얻을 수 있는 서비스입니다."),
        ListItem(id: 1, title: "Q. 포인트는 어떻게 사용 하나요?", content: "미션 수행을 통해 포인트를 얻어 '포인트교환'에서 각종 혜택과 보상을 얻을 수 있습니다."),
        ListItem(id: 2, title: "Q. 미션 수행 완료는 어떻게 하나요?", content: "미션시작 버튼을 눌러 미션을 진행하고, 주어진 미션을 완수하면 자동적으로 완료됩니다.")
    ]
    
    var body: some View {
        NavigationStack {
            List(listItems) { listItem in
                ListItemView(listItem: listItem, onTap: {
                    if let index = listItems.firstIndex(where: { $0.id == listItem.id }) {
                        listItems[index].isExpanded.toggle()
                    }
                })
//                .listRowSeparator(.hidden)
            }
            .padding(.top, 30)
            .listStyle(.plain)
            .navigationTitle("자주 묻는 질문")
        }
    }
}

struct ListItemView: View {
    var listItem: QnAView.ListItem
    var onTap: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text(listItem.title)
                    .padding(.leading, 10)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundStyle(Color(hex: 0xCCCCCC))
            }
            .contentShape(Rectangle())
            .onTapGesture {
                onTap()
            }
            
            if listItem.isExpanded {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: 0xF4F4F4))
                        .shadow(radius: 2, x: 0, y: 2)
                    
                    Text(listItem.content)
                        .foregroundColor(Color(hex: 0x777777))
                        .padding()
                }
                .padding()
            }
        }
    }
}


#Preview {
    QnAView()
}
