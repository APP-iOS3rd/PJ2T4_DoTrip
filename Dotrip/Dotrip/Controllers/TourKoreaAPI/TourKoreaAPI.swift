//
//  TourKoreaAPI.swift
//  Dotrip
//
//  Created by Hee on 12/10/23.
//

import Foundation

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

struct Item: Decodable, Hashable {
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
}

class TourKoreaAPI: ObservableObject {
    
    static let shared = TourKoreaAPI()
    private init() {}
    
    @Published var posts = [Item]()
    
    // plist 파일에서 API키 불러오기
    private var apikey: String? {
        get { GetAPIKey("API_KEY", "TourKoreaAPIKey") }
    }
    
    func feachData() {
        guard let apikey = apikey else { return }
        
        /**
         eventStartDate = 행사 시작일
         areaCode = 지역코드
         sigunguCode = 시군구코드
         serviceKey = API Key
         */
        
        let urlString =
"https://apis.data.go.kr/B551011/KorService1/searchFestival1?numOfRows=10&MobileOS=IOS&MobileApp=DoTrip&_type=json&arrange=A&eventStartDate=\(20231201)&areaCode=\(39)&sigunguCode=&serviceKey=\(apikey)"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        // dataTask() 메서드의 with: 매개변수에 url 또는 request 객체를 가지고 통신
        let task = session.dataTask(with: url) { data, response, error in
            
            // 에러가 났다면
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // 정상적으로 값이 오지 않았을 때 처리
                self.posts = []
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let json = try JSONDecoder().decode(SearchFestival.self, from: data)
//                print(json)

                DispatchQueue.main.async {
                    self.posts = json.response.body.items.item
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
