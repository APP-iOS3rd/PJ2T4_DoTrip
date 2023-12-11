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
    var name: String
    var location: CLLocationCoordinate2D
    var color: Color
    var description : String
}

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.88571, longitude: 127.73947),
        span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
    )
    
    @State private var places = [
        Place(
            name: "장소 1",
            location: CLLocationCoordinate2D(latitude: 37.88371, longitude: 127.73947),
            color: Color.blue,
            description: "이곳은 대한민국의 얼을 느낄수 있는 곳입니다."
        ),
        Place(
            name: "장소 2",
            location: CLLocationCoordinate2D(latitude: 37.88423, longitude: 127.73974),
            color: Color.blue,
            description: "자연의 섭리를 품은 곳"
        ),
    ]
    
    @State private var selectedPlace: Place?
    
    
    @State var showSheet: Bool = false
    @State var detents: PresentationDetent = .medium
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: places) { item in
                MapAnnotation(coordinate: item.location, anchorPoint: CGPoint(x: 0.5, y: 1)) {
                    ZStack {
                        Text(item.name)
                        Circle()
                            .stroke(item.color, lineWidth: 2)
                            .foregroundColor(item.color.opacity(0.3))
                            .frame(width: 26, height: 26)
                    }
                    .onTapGesture {
                        selectedPlace = item
                        showSheet.toggle()
                        detents = .medium
                    }
                }
            }.sheet(isPresented: $showSheet) {
                ModalView(detents: $detents, places: $places)
                    // 높이 선택 값 바인딩
                    .presentationDetents([.medium, .large], selection: $detents)
            }
            .onAppear {
                showSheet = true
            }
        }
    }
}


struct ModalView: View {
    
    @Binding var detents: PresentationDetent
    
    @Binding var places : [Place]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(places) { place in
                    NavigationLink(destination: MapDetailView(place: place), label: {
                        HStack {
                            Text(place.name)
                            Text(place.description)
                                .font(.caption)
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    MapView()
}
