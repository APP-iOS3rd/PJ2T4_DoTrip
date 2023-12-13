//
//  TourData.swift
//  Dotrip
//
//  Created by Hee on 12/12/23.
//

import Foundation

// 행사정보 조회
struct SearchFestival: Decodable {
    let response: Response
}

struct Response: Decodable {
    let body: Body
}

struct Body: Decodable {
    let items: Items
    let pageNo: Int
    let numOfRows: Int
}

struct Items: Decodable {
    let item: [Item]
}

struct Item: Decodable, Hashable, Identifiable {
    var id = UUID()
    let contentid: String
    let contenttypeid: String
    let title: String
    let addr1: String
    let addr2: String
    let eventstartdate: String?
    let eventenddate: String?
    let firstimage: String?
    let firstimage2: String?
    let mapx: String
    let mapy: String
    
    enum CodingKeys: String, CodingKey {
        //        case id
        case contentid = "contentid"
        case contenttypeid = "contenttypeid"
        case title = "title"
        case addr1 = "addr1"
        case addr2 = "addr2"
        case eventstartdate = "eventstartdate"
        case eventenddate = "eventenddate"
        case firstimage = "firstimage"
        case firstimage2 = "firstimage2"
        case mapx = "mapx"
        case mapy = "mapy"
    }
}

// 키워드 검색 (사용X)
struct SearchKeyword: Decodable {
    let response: KeyResponse
}

struct KeyResponse: Decodable {
    let body: KeyBody
}

struct KeyBody: Decodable {
    let items: KeyItems
    let pageNo: Int
    let numOfRows: Int
}

struct KeyItems: Decodable {
    let item: [KeyItem]
}

struct KeyItem: Decodable, Hashable, Identifiable {
    var id = UUID()
    let contentid: String
    let contenttypeid: String
    let title: String
    let addr1: String
    let addr2: String
    let firstimage: String?
    let firstimage2: String?
    let mapx: String
    let mapy: String
    
    enum CodingKeys: String, CodingKey {
        //        case id
        case contentid = "contentid"
        case contenttypeid = "contenttypeid"
        case title = "title"
        case addr1 = "addr1"
        case addr2 = "addr2"
        case firstimage = "firstimage"
        case firstimage2 = "firstimage2"
        case mapx = "mapx"
        case mapy = "mapy"
    }
}


struct RegionInfo: Decodable {
    let response: RegiResponse
}

struct RegiResponse: Decodable {
    let body: RegiBody
}

struct RegiBody: Decodable {
    let items: RegiItems
}

struct RegiItems: Decodable {
    let item: [RegiItem]
}

struct RegiItem: Decodable, Hashable {
    let code: String
    let name: String
}

// 입장료, 개장시간 등
struct EventInfo: Decodable {
    let response: InfoResponse
}

struct InfoResponse: Decodable {
    let body: InfoBody
}

struct InfoBody: Decodable {
    let items: InfoItems
}

struct InfoItems: Decodable {
    let item: [InfoItem]
}

struct InfoItem: Decodable, Hashable {
    let contentid: String
    let eventstartdate: String
    let eventenddate: String
    let playtime: String
    let usetimefestival: String
}

// 행사소개 등

struct IntroData: Decodable {
    let response: IntroResponse
}

struct IntroResponse: Decodable {
    let body: IntroBody
}

struct IntroBody: Decodable {
    let items: IntroItems
}

struct IntroItems: Decodable {
    let item: [IntroItem]
}

struct IntroItem: Decodable, Hashable {
    let contentid: String
    let infotext: String
}


// 입장료, 개장시간 등 (사용X)
struct KeyEventInfo: Decodable {
    let response: KeyInfoResponse
}

struct KeyInfoResponse: Decodable {
    let body: KeyInfoBody
}

struct KeyInfoBody: Decodable {
    let items: KeyInfoItems
}

struct KeyInfoItems: Decodable {
    let item: [KeyInfoItem]
}

struct KeyInfoItem: Decodable, Hashable {
    let contentid: String
    let restdate: String
    let expguide: String
    let usetime: String
}
