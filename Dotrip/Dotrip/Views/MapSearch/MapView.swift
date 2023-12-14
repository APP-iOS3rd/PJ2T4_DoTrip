
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


//요것도 추가함
class NavigationManager: ObservableObject {
    @Published var stackPath: NavigationPath?

    //요거 수정해야함 case 추가
    enum NavigationPath {
        case MapDetailView
        case MapMissionDetailView
        case EventDetailView
        // Add more navigation paths as needed
    }
}


struct MapView: View {
    
    @State var listState = true
    @State var network = TourKoreaAPI.shared
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.55, longitude: 127),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    let dummyPlace = Item(contentid: "", contenttypeid: "", title: "", addr1: "", addr2: "", eventstartdate: "", eventenddate: "", firstimage: "", firstimage2: "", mapx: "0", mapy: "0")
    
    @State var selectedPlace: Item?
    
    
    @State var showSheet: Bool = false
    @State var detents: PresentationDetent = .medium
    
    @StateObject private var navigationManager = NavigationManager()
    @StateObject private var modalManager = NavigationManager()
    
    
    @State var contID : String = ""
    
    @State var contyID : String = ""
    
    @State var cont : Item?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(coordinateRegion: $region,
                    annotationItems: network.posts,
                    annotationContent: { location in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(location.mapy)!, longitude: Double(location.mapx)!) ) {
                        if location == selectedPlace {
                            CustomMapMarkerView(pinColor: .red)
                                .onTapGesture {
                                    if showSheet == false {
                                        selectedPlace = dummyPlace
                                    }
                                    showSheet.toggle()
                                    detents = .medium
                                }
                        } else if showSheet == false {
                            CustomMapMarkerView(pinColor: .blue)
                                .onTapGesture {
                                    
                                    //여기 추가
                                    modalManager.stackPath = .MapMissionDetailView
                                    if showSheet == false {
                                        selectedPlace = location
                                    }
                                    showSheet.toggle()
                                    detents = .medium
                                }
                        }
                    }
                })
                .sheet(isPresented: $showSheet) {
                    ModalView(detents: $detents, listState: $listState, network: $network, navigationManager: navigationManager, modalManager: modalManager, contID: $contID, contyID: $contyID, cont: $cont)
                    // 높이 선택 값 바인딩
                        .presentationDetents([.medium, .large], selection: $detents)
                }
                NavigationLink(
                    destination: EventDetailView(data: cont ?? dummyPlace, contentId: contID, contentTypeId: contyID),
                    tag: .EventDetailView,
                    selection: $navigationManager.stackPath
                ) {
                    EmptyView()
                }
                .hidden()
            }
            .ignoresSafeArea()
            .onAppear {
                showSheet = true
                network.tourData(params: ["20231201", "20231231", "39", "", "제주"])
                
                //위치 변경
//                region = MKCoordinateRegion(
//                    center: CLLocationCoordinate2D(latitude: Double(network.posts[0].mapy)!, longitude: Double(network.posts[0].mapx)!),
//                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            }
        }
        .environmentObject(navigationManager)
    }
    
//    @ViewBuilder
//    func destinationView() -> some View {
//        switch navigationManager.stackPath {
//        case .MapDetailView:
//            MapDetailView(contentId: "", contentTypeId: "", cont: $cont)
//        case .MapMissionDetailView:
//            MapDetailView(contentId: "", contentTypeId: "")
//        // Add more cases for additional navigation paths
//        default:
//            EmptyView()
//        }
//    }
}


struct ModalView: View {
    @Binding var detents: PresentationDetent
    
    @Binding var listState : Bool
    @Binding var network : TourKoreaAPI
    //요것도 필요
    @ObservedObject var navigationManager: NavigationManager
    @ObservedObject var modalManager: NavigationManager
    
    @Binding var contID : String
    
    @Binding var contyID : String
    
    @Binding var cont : Item?
    
    @ObservedObject var missionStore = MissionStore(missions: missionData)
    
    @State var mission : Mission?
    
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
            MapList(listState: $listState, network: $network, mission: $mission, navigationManager: navigationManager, modalManager: modalManager, contId: $contID, contyId: $contyID, cont: $cont)
            
            // 이부분 추가
            NavigationLink(
                destination: MapDetailView(contentId: contID, contentTypeId: contyID, cont: $cont, navigationManager: navigationManager),
                tag: .MapDetailView,
                selection: $modalManager.stackPath
            ) {
                EmptyView()
            }
            .hidden()
            NavigationLink(
                destination: MapMissionDetailView(missions: $mission),
                tag: .MapMissionDetailView,
                selection: $modalManager.stackPath
            ) {
                EmptyView()
            }
            .hidden()
            
        }
        .background(.white)
        // 이부분도 추가
        .environmentObject(modalManager)
    }
    
    // 이것도 추가
    @ViewBuilder
    func destinationView() -> some View {
        switch navigationManager.stackPath {
        case .MapDetailView:
            MapDetailView(contentId: "", contentTypeId: "", cont: $cont, navigationManager: navigationManager)
 
        default:
            EmptyView()
        }
    }
}



struct CustomMapMarkerView : View {
    var pinColor : Color
    
    var body: some View {
            VStack(spacing: 0) {
                Image(systemName: "map.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(6)
                    .background(pinColor)
                    .cornerRadius(36)
                
                Image(systemName: "triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(pinColor)
                    .frame(width: 10, height: 10)
                    .rotationEffect(Angle(degrees: 180))
                    .offset(y: -3)
                    .padding(.bottom, 40)
            }
        }
}

#Preview{
    MapView()
}
