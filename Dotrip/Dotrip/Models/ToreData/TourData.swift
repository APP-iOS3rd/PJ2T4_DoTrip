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
    let eventstartdate: String
    let eventenddate: String
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
