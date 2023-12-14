//
//  EventInfoAPI.swift
//  Dotrip
//
//  Created by Hee on 12/11/23.
//

import Foundation

class EventInfoAPI: ObservableObject {
    static let shared = EventInfoAPI()
    private init() {}
    
    @Published var infoPosts = [InfoItem]()
    @Published var introPosts = [IntroItem]()
    @Published var isLoading = false
    
    // plist 파일에서 API키 불러오기
    private var apikey: String? {
        get { GetAPIKey("API_KEY", "TourKoreaAPIKey") }
    }
    
    func getInfoData(contentID: String, contentType: String) {

        guard let apikey = apikey else { return }
        
        let urlString =
        "https://apis.data.go.kr/B551011/KorService1/detailIntro1?MobileOS=IOS&MobileApp=DoTrip&_type=json&contentId=\(contentID)&contentTypeId=\(contentType)&serviceKey=\(apikey)"
        
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
                self.infoPosts = []
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let json = try JSONDecoder().decode(EventInfo.self, from: data)
                
                DispatchQueue.main.async {
                    self.infoPosts = json.response.body.items.item
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getIntroData(contentID: String, contentType: String) {
        
        self.isLoading = true
        
        guard let apikey = apikey else { return }
        
        let urlString =
        "https://apis.data.go.kr/B551011/KorService1/detailInfo1?MobileOS=IOS&MobileApp=DoTrip&_type=json&contentId=\(contentID)&contentTypeId=\(contentType)&serviceKey=\(apikey)"
        
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
                self.introPosts = []
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let json = try JSONDecoder().decode(IntroData.self, from: data)
                print(json)

                DispatchQueue.main.async {
                    self.introPosts = json.response.body.items.item
                    self.isLoading = false
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
