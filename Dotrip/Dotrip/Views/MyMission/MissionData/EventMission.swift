//
//  EventMission.swift
//  Dotrip
//
//  Created by 김혜란 on 12/15/23.
//

import UIKit
import SwiftUI


struct EventMission {    // 미션 데이터 배열 선언
    var missionData: [Mission] = []

    init() {
        // 미션 데이터 초기화
        let eventMission1 = Mission(id: "1", name: "청계천 모전교에서 빛과 함께 사진찍기", address: "서울 종로구 관수동 모전교 일대", description: "청계천 광장에서 아름다운 빛과 함께 사진을 찍어주세요!", image: "청계천 빛")
        let eventMission2 = Mission(id: "2", name: "오색 찬란한 빛과 산책하며 사진찍기", address: "서울 관악구 별빛내린천 일대", description: "별빛 터널과 함께 사진을 찍어주세요!", image: "관악별빛")
        let eventMission3 = Mission(id: "3", name: "광화문광장 마켓에서 구매 1회하기!", address: "서울 종로구 세종대로 일대", description: "광화문광장에서 구매한 물품을 자랑해주세요!", image: "광화문 광장마켓")
        let eventMission4 = Mission(id: "4", name: "난타 관람하고 관람인증하기", address: "서울 마포구 양화로16길 29 홍익몰", description: "난타 공연 관람하고 관람권 사진을 찍어주세요!", image: "난타")

        missionData = [eventMission1, eventMission2, eventMission3, eventMission4]
    }
}
