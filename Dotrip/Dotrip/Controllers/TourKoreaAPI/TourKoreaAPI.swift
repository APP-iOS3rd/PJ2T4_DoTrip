//
//  TourKoreaAPI.swift
//  Dotrip
//
//  Created by Hee on 12/10/23.
//

import Foundation

class TourKoreaAPI: ObservableObject {
    static let shared = TourKoreaAPI()
    private init() {}
    
    @Published var posts = [Item]()
    @Published var Keywordposts = [KeyItem]()
    @Published var totalCount: Int = 0
    
    // plist 파일에서 API키 불러오기
    private var apikey: String? {
        get { GetAPIKey("API_KEY", "TourKoreaAPIKey") }
    }
    
    private var regionData = [RegiItem]()
    
    // 지역코드 조회 API
    func feachData(stringAddr: String, params: [String]) {
        
        let addr1 = params[2]
        
        guard let apikey = apikey else { return }

        let urlString =
        "https://apis.data.go.kr/B551011/KorService1/areaCode1?numOfRows=35&MobileOS=IOS&MobileApp=DoTrip&areaCode=\(addr1)&_type=json&serviceKey=\(apikey)"
        
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
                self.regionData = []
                print("IntroductionAPI Error")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let json = try JSONDecoder().decode(RegionInfo.self, from: data)

                DispatchQueue.main.async {
                    self.regionData = json.response.body.items.item
                    self.click(params: params) // feachData 완료 후 tourData 호출
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // 지역정보API에서 불러온 데이터 중 '시/군/구' 명만 잘라서 코드값을 찾아내고 다음 API실행

    func click(params: [String]) {
        var params = params
        let addr = params[3]

        if addr.count != 0 {
            let addrCode = regionData.map{$0}.filter{ $0.name == addr }.map{ $0.code }

            // 시군구 잘못 입력 시 ""로 대체
            params[3] = addrCode.count == 0 ? "" : addrCode[0]
        } else {
            params[3] = ""
        }

        totalCount = 0
        tourData(params: params)
        getTourismKeywords(params: params)
    }
    
    // 행사정보 조회
    func tourData(params: [String]) {
        guard let apikey = apikey else { return }
        
        let startDate = params[0]
        let endDate = params[1]
        let addr1 = params[2]
        let addr2 = params[3]
        
        let urlString =
        "https://apis.data.go.kr/B551011/KorService1/searchFestival1?numOfRows=50&MobileOS=IOS&MobileApp=DoTrip&_type=json&arrange=A&eventStartDate=\(startDate)&eventEndDate=\(endDate)&areaCode=\(addr1)&sigunguCode=\(addr2)&serviceKey=\(apikey)"
        
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
                
                DispatchQueue.main.async {
                    self.posts = json.response.body.items.item
                    self.totalCount += Int(json.response.body.numOfRows)
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // 관광키워드 조회
    func getTourismKeywords(params: [String]) {
        
        let addr1 = params[2]
        let addr2 = params[3]
        // 국문 키워드 인코딩 필요
        let keyword = params[4].addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard let apikey = apikey else { return }

        let urlString =
        "https://apis.data.go.kr/B551011/KorService1/searchKeyword1?numOfRows=10&MobileOS=IOS&MobileApp=DoTrip&_type=json&arrange=Q&keyword=\(keyword ?? "")&contentTypeId=12&areaCode=\(addr1)&sigunguCode=\(addr2)&serviceKey=\(apikey)"
        
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
                let json = try JSONDecoder().decode(SearchKeyword.self, from: data)
                print(json)
                
                DispatchQueue.main.async {
                    self.Keywordposts = json.response.body.items.item
                    self.totalCount += Int(json.response.body.numOfRows)
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
