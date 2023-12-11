//
//  MissionDataLoad.swift
//  Dotrip

//  json 데이터 디코딩
//  Created by 유지인 on 12/11/23.
//

import UIKit
import SwiftUI

var missionData: [Mission] = loadJson("missionData.json")


// JSON 파일을 로드하는 표준 방식

// T는 제네릭인데 어떤 타입이 들어오던지 다 처리 하겠다 그리고 T는 Decodable하다. 결과는 그 T 타입으로 배출하겠다.
func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // file데이터를 불러오는 코드
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else { fatalError("\(filename) no found.")}
    
    do {
        // 불러온 파일데이터에서 데이터를 뽑는 코드
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        //데이터를 JSON으로 변환시켜 리턴시키는 코드
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
