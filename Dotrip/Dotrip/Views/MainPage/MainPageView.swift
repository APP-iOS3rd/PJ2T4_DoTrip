//
//  MainPageView.swift
//  Dotrip
//
//  Created by Hee on 12/11/23.
//

import SwiftUI

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"
    return formatter
}

var start = Date.now
var end = Date.now

struct startDateModalView: View {
    
    @Environment(\.presentationMode) var presentation
    @Binding var startDate: String
    @Binding var changeColor: [Color]
    @State private var selectedStartDate = Date.now
    @Binding var max: Date
    
    var body: some View {
        
        VStack {
            Text("출발일자")
                .font(.largeTitle)
            DatePicker("", selection: $selectedStartDate, in: Date()...max, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(maxHeight: 400)
            
            Button(action: {
                start = selectedStartDate
                startDate = dateFormatter.string(from: selectedStartDate)
                changeColor[0] = .black
                presentation.wrappedValue.dismiss()
            }) {
                Text("날짜 선택").bold()
                    .foregroundColor(.white)
            }
            .frame(width: 150, height: 30, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 40))
            .font(.system(size: 16))
        }
    }
}
struct endDateModalView: View {
    
    @Environment(\.presentationMode) var presentation
    @Binding var endDate: String
    @Binding var changeColor: [Color]
    @Binding  var selectedEndDate: Date
    @Binding var min: Date
    
    var body: some View {
        
        VStack {
            Text("복귀일자")
                .font(.largeTitle)
            
            DatePicker("", selection: $selectedEndDate, in: min..., displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(maxHeight: 400)
            
            Button(action: {
                end = selectedEndDate
                endDate = dateFormatter.string(from: selectedEndDate)
                changeColor[1] = .black
                presentation.wrappedValue.dismiss()
            }) {
                Text("날짜 선택").bold()
                    .foregroundColor(.white)
            }
            .frame(width: 150, height: 30, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 40))
            .font(.system(size: 16))
        }
    }
}


struct CityModalView: View {
    @Binding var cities: [String]
    @Binding var areaCode: Int?
    @Binding var selectedCity: String?
    @Binding var selectedBorough: String?
    @Binding var viewSelected: String
    @Binding var changeColor: [Color]
    
    @State private var seouls = ["서울 전체", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"]
    @State private var busans = ["부산 전체", "강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"]
    @State private var kangwons = ["강원 전체", "강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"]
    @State private var jejus = ["제주 전체", "남제주군", "북제주군", "서귀포시", "제주시"]
    @State private var jeonnams = ["전남 전체", "강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"]
    @State private var jeonbuks = ["전북 전체", "고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"]
    @State private var daejeons = ["대전 전체", "대덕구", "동구", "서구", "유성구", "중구"]
    @State private var daegus = ["군위군", "남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"]
    @State private var kwangjus = ["광주 전체", "광산구", "남구", "동구", "북구", "서구"]
    @State private var ulsans = ["울산 전체", "남구", "동구", "북구", "울주군", "중구"]
    @State private var chungbuks = ["충북 전체", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군", "청원군", "청주시", "충주시"]
    @State private var chungnams = ["충남 전체", "계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "예산군", "천안시", "청양군", "태안군", "홍성군"]
    @State private var gyeongbuks = ["경북 전체", "경산시", "경주시", "고령군", "구미시", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"]
    @State private var gyeongnams = ["경남 전체", "거제시", "거창군", "고성군", "김해시", "남해군", "마산시", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "진해시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"]
    @State private var incheons = ["인천 전체", "강화군", "계양구", "남동구", "동구", "미추홀구", "부평구", "서구", "연수구", "옹진군", "중구"]
    @State private var gyeonggis = ["경기 전체", "가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"]
    @State private var areaCodeDict = ["서울":1, "인천":2, "대전":3, "대구":4,"부산":6, "울산":7, "광주":5, "경기도":31, "충청남도":34, "충청북도":33, "경상남도":36, "경상북도":35, "전라남도":38, "전라북도":37, "제주도":39, "세종특별자치시":8]
    @State private var saejong = ["세종특별자치시"]
    
    
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            
            NavigationSplitView {
                List(cities, id:\.self, selection: $selectedCity) { city in
                    Text(city).tag(city)
                }
            } detail: {
                if selectedCity == "서울" {
                    List(seouls, id:\.self, selection: $selectedBorough) { seoul in
                        Text(seoul)
                    }
                } else if selectedCity == "인천" {
                    List(incheons, id:\.self, selection: $selectedBorough) { incheon in
                        Text(incheon)
                    }
                } else if selectedCity == "대전" {
                    List(daejeons, id:\.self, selection: $selectedBorough) { daejeon in
                        Text(daejeon)
                    }
                } else if selectedCity == "대구" {
                    List(daegus, id:\.self, selection: $selectedBorough) { daegu in
                        Text(daegu)
                    }
                } else if selectedCity == "부산" {
                    List(busans, id:\.self, selection: $selectedBorough) { busan in
                        Text(busan)
                    }
                } else if selectedCity == "울산" {
                    List(ulsans, id:\.self, selection: $selectedBorough) { ulsan in
                        Text(ulsan)
                    }
                } else if selectedCity == "광주" {
                    List(kwangjus, id:\.self, selection: $selectedBorough) { kwangju in
                        Text(kwangju)
                    }
                } else if selectedCity == "경기도" {
                    List(gyeonggis, id:\.self, selection: $selectedBorough) { gyeonggi in
                        Text(gyeonggi)
                    }
                } else if selectedCity == "충청남도" {
                    List(chungnams, id:\.self, selection: $selectedBorough) { chungnam in
                        Text(chungnam)
                    }
                } else if selectedCity == "충청북도" {
                    List(chungbuks, id:\.self, selection: $selectedBorough) { chungbuk in
                        Text(chungbuk)
                    }
                } else if selectedCity == "경상남도" {
                    List(gyeongnams, id:\.self, selection: $selectedBorough) { gyeongnam in
                        Text(gyeongnam)
                    }
                } else if selectedCity == "경상북도" {
                    List(gyeongbuks, id:\.self, selection: $selectedBorough) { gyeongbuk in
                        Text(gyeongbuk)
                    }
                } else if selectedCity == "전라남도" {
                    List(jeonnams, id:\.self, selection: $selectedBorough) { jeonnam in
                        Text(jeonnam)
                    }
                } else if selectedCity == "전라북도" {
                    List(jeonbuks, id:\.self, selection: $selectedBorough) { jeonbuk in
                        Text(jeonbuk)
                    }
                } else if selectedCity == "제주도"{
                    List(jejus, id:\.self, selection: $selectedBorough) { jeju in
                        Text(jeju)
                    }
                } else {
                    List(saejong, id:\.self, selection: $selectedBorough) { sj in
                        Text(sj)
                    }
                }
            }
            Button(action: {
                if (selectedCity != "" && selectedCity != nil && selectedBorough != "" && selectedBorough != nil) {
                    areaCode = areaCodeDict[selectedCity!] ?? nil
                    viewSelected = selectedCity! + "-" + selectedBorough!
                    changeColor[2] = .black
                    
                } else {
                    viewSelected = "지역을 선택해주세요"
                    changeColor[2] = .lightgray
                    areaCode = nil
                }
                presentation.wrappedValue.dismiss()
            }) {
                Text("지역 선택완료").bold()
                    .foregroundColor(.white)
            }
            .frame(width: 150, height: 30, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 40))
            .font(.system(size: 16))
            Spacer()
        }
    }
}
struct MainPageView: View {
    
    @State var startDate: String = "출발일자"
    @State var endDate: String = "복귀일자"
    @State private var changeColor: [Color] = [.lightgray, .lightgray, .lightgray]
    @State private var cities = ["서울", "인천", "대전", "대구","부산", "울산", "광주", "경기도", "충청남도", "충청북도", "경상남도", "경상북도", "전라남도", "전라북도", "제주도", "세종특별자치시"]
    
    @State private var selectedEndDate = Date.now
    @State var areaCode: Int? = nil
    
    @State private var selectedCity: String?
    @State private var selectedBorough: String?
    @State private var viewSelected: String = "지역을 선택해주세요"
    @State private var showStartCalendar: Bool = false
    @State private var showEndCalendar: Bool = false
    @State private var showCity: Bool = false
    @State private var max = Date.now
    @State private var min = Date.now
    @State private var isActiveSearch: Bool = false
    @State private var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("DoTrip")
                    .frame(width:350, alignment: .leading)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 20)
                
                HStack {
                    Button(action: {
                        showStartDate()
                        max = selectMax()
                    }, label: {
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                        Text(startDate)
                            .foregroundColor(changeColor[0])
                    })
                    .frame(width:165, height:25, alignment: .leading)
                    .padding(3)
                    .background(.white)
                    .sheet(isPresented: self.$showStartCalendar) {
                        startDateModalView(startDate: $startDate, changeColor: $changeColor, max: $max)
                    }
                    
                    Button(action: {
                        showEndDate()
                        min = selectMin()
                        selectedEndDate = min
                    }, label: {
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                        Text(endDate)
                            .foregroundColor(changeColor[1])
                    })
                    .frame(width:165, height:25, alignment: .leading)
                    .padding(3)
                    .background(.white)
                    .sheet(isPresented: self.$showEndCalendar) {
                        endDateModalView(endDate: $endDate, changeColor: $changeColor,selectedEndDate: $selectedEndDate, min: $min)
                    }
                }
                .cornerRadius(5)
                .shadow(radius: 3)
                .padding(3)
                
                HStack {
                    Button(action: showCities, label: {
                        Image(systemName: "map")
                            .foregroundColor(.black)
                        Text(viewSelected)
                            .foregroundColor(changeColor[2])
                    })
                    .padding(3)
                    .sheet(isPresented: self.$showCity) {
                        CityModalView(cities: $cities, areaCode: $areaCode, selectedCity: $selectedCity, selectedBorough: $selectedBorough, viewSelected: $viewSelected, changeColor: $changeColor)
                    }
                }
                .frame(width:350, height:30, alignment: .leading)
                .background(.white)
                .cornerRadius(5)
                .shadow(radius: 3)
                .padding(3)
                
                HStack{
                    NavigationLink(
                        destination: MapView(params: [startDate, endDate, "\(areaCode ?? 1)", selectedBorough ?? ""]),
                        isActive: $isActiveSearch) {
                            Button(action: {
                                if startDate == "출발일자" || endDate == "복귀일자" || viewSelected == "지역을 선택해주세요" {
                                    showingAlert = true
                                } else {
                                    isActiveSearch = true
                                }
                            }) {
                            HStack{
                                Image(systemName: "magnifyingglass")
                                Text("검색")
                            }
                            .frame(width:70, height: 30)
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                        }
                            .alert("날짜와 지역을 선택해주세요.",isPresented: $showingAlert) {
                                Button("확인") {
                                 
                                }
                            }
                    }
        }
        .frame(width:350, alignment: .trailing)
        
        Text("추천 여행지")
            .bold()
            .frame(width: 350, alignment: .leading)
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<3) {_ in
                    Text("여행 추천")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .frame(width: 355, height: 200)
                        .background(Color.yellow)
                        .cornerRadius(25)
                }
            }
        }
        
        Text("미션투어로 혜택 찾기")
            .bold()
            .frame(width:350, height:30, alignment: .leading)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<6) {_ in
                    Text("미션")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .frame(width: 120, height: 120)
                        .background(Color.yellow)
                        .cornerRadius(25)
                }
            }
        }
        Spacer()
    }
}
    .padding()
}
func showStartDate() {
    showStartCalendar = true
}

func showEndDate() {
    showEndCalendar = true
}

func showCities() {
    showCity = true
}
    func selectMax() -> Date {
        if dateFormatter.string(from: end) != dateFormatter.string(from: Date.now) {
            return end
        }
        else {
            return Calendar.current.date(byAdding: .year, value: 10, to: Date.now)!
        }
    }
    func selectMin() -> Date {
        return start
    }

}

#Preview {
    MainPageView()
}
