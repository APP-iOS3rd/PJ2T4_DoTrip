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
    
    // plist 파일에서 API키 불러오기
    private var apikey: String? {
        get { GetAPIKey("API_KEY", "TourKoreaAPIKey") }
    }
    
    private var regionData = [RegiItem]()
    
//    var addr1: String = "서울시 강서구"
    var addr2: String = ""
    var arrdCode = [String]()
    
    func feachData(stringAddr: String) {
        guard let apikey = apikey else { return }

        let urlString =
        "https://apis.data.go.kr/B551011/KorService1/areaCode1?numOfRows=35&MobileOS=IOS&MobileApp=DoTrip&areaCode=\(1)&_type=json&serviceKey=\(apikey)"
        
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
                    self.click(addr: stringAddr) // feachData 완료 후 tourData 호출
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func tourData(sigunguCode: String) {
        guard let apikey = apikey else { return }
        
        /**
         eventStartDate = 행사 시작일
         areaCode = 지역코드
         sigunguCode = 시군구코드
         serviceKey = API Key
         */
        
        let urlString =
        "https://apis.data.go.kr/B551011/KorService1/searchFestival1?numOfRows=50&MobileOS=IOS&MobileApp=DoTrip&_type=json&arrange=A&eventStartDate=\(20231225)&eventEndDate=\(20231231)&areaCode=\(1)&sigunguCode=\(sigunguCode)&serviceKey=\(apikey)"
        
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
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func click(addr: String) {
        let arr = addr.split(separator: " ")
        addr2 = String(arr[1].prefix(2))

        arrdCode = regionData.map{ $0 }.filter{ $0.name.contains(addr2) }.map{ $0.code }
        let sigungu = arrdCode[0]

        tourData(sigunguCode: sigungu)
    }
}
