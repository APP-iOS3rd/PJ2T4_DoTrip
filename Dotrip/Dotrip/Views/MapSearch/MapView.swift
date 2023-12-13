
//
//  ContentView.swift
//  MapTest
//
//  Created by jonghyun baik on 12/10/23.
//

import SwiftUI
import MapKit

struct Place : Identifiable {
    var id: UUID = UUID()
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

struct MapView: View {
    
    @State var listState = true
    @State var network = TourKoreaAPI.shared
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 33.3040, longitude: 126.2934),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    @State private var places = [
        Place(contentid: "1", contenttypeid: "1", title: "제주공항", addr1: "제주시", addr2: "", eventstartdate: "231122", eventenddate: "231125", firstimage: "", firstimage2: "", mapx: "126.2934", mapy: "33.3040"),
        Place(contentid: "2", contenttypeid: "2", title: "제주시당", addr1: "제주시 애월읍", addr2: "", eventstartdate: "231121", eventenddate: "231128", firstimage: "", firstimage2: "", mapx: "126.292", mapy: "33.3048")
    ]
    @State private var places2 = [
        Place(contentid: "1", contenttypeid: "1", title: "제주공항", addr1: "제주시", addr2: "", eventstartdate: "231122", eventenddate: "231125", firstimage: "", firstimage2: "", mapx: "126.293", mapy: "33.3045"),
        Place(contentid: "2", contenttypeid: "2", title: "제주시당", addr1: "제주시 애월읍", addr2: "", eventstartdate: "231121", eventenddate: "231128", firstimage: "", firstimage2: "", mapx: "126.2924", mapy: "33.3048")
    ]
    
    @State private var selectedPlace: Item?
    @State private var selectedPlaceforTest: Place?
    
    
    @State var showSheet: Bool = false
    @State var detents: PresentationDetent = .medium
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region,
                annotationItems: (listState ? places : places2),
                annotationContent: { location in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(location.mapy)!, longitude: Double(location.mapx)!) ) {
                    CustomMapMarkerView()
                        .onTapGesture {
                            selectedPlaceforTest = location
                            showSheet.toggle()
                            detents = .medium
                        }
                }
            }
            )
            .sheet(isPresented: $showSheet) {
                ModalView(detents: $detents, listState: $listState, network: $network)
                // 높이 선택 값 바인딩
                    .presentationDetents([.medium, .large], selection: $detents)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            showSheet = true
        }
    }
}


struct ModalView: View {
    
    @Binding var detents: PresentationDetent
    
    @Binding var listState : Bool
    @Binding var network : TourKoreaAPI
    
    var body: some View {
        NavigationStack {
            HStack{
                Spacer()
                Button(action: {
                    listState = true
                }, label: {
                    Text("미션")
                        .font(.title3)
                        .foregroundStyle(.black)
                })
                Spacer()
                Divider()
                    .frame(height: 20)
                Spacer()
                Button(action: {
                    listState = false
                }, label: {
                    Text("행사")
                        .font(.title3)
                        .foregroundStyle(.black)
                })
                Spacer()
            }
            .padding(.top, 30)
            MapList(listState: $listState, network: $network)
        }
        .background(.white)
    }
}


struct MapList : View {
    
    @Binding var listState : Bool
    @Binding var network : TourKoreaAPI
        
        var body: some View {
            VStack {
                if listState {
                    List {
                        ForEach(network.posts, id: \.self) { data in
                            NavigationLink(destination: EventDetailView(contentId: data.contentid, contentTypeId: data.contenttypeid)) {
                                HStack {
                                    AsyncImage(url: URL(string: data.firstimage ?? "")) { img in
                                        img.image?.resizable()
                                    }
                                    .frame(width: 80, height: 80)
                                    .scaledToFit()
                                    
                                    VStack(alignment: .leading) {
                                        Text(data.title)
                                        Text("\(data.addr1) \(data.addr2)")
                                    }
                                    
                                }
                            }
                        }
                    }
                } else {
                    List {
                    }
                    
                }
            }
            .onAppear() {
                network.feachData(stringAddr: "서울시 종로구")
            }
        }
}


struct CustomMapMarkerView : View {
    var body: some View {
            VStack(spacing: 0) {
                Image(systemName: "map.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(36)
                
                Image(systemName: "triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.blue)
                    .frame(width: 10, height: 10)
                    .rotationEffect(Angle(degrees: 180))
                    .offset(y: -3)
                    .padding(.bottom, 40)
            }
        }
}

#Preview(body: {
    MapView()
})
