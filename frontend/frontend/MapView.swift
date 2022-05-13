//
//  MapView.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 5/2/22.
//

import MapKit
import SwiftUI

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    var color: Color?
    var tint: Color { color ?? .red }
    let id = UUID()
}

struct MapView: View {
   
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: MapDefaults.latitude, longitude: MapDefaults.longitude),
        span: MKCoordinateSpan(latitudeDelta: MapDefaults.zoom, longitudeDelta: MapDefaults.zoom))
    
    let annotationItems = [MyAnnotationItem(
                            coordinate: CLLocationCoordinate2D(
                                latitude: MapDefaults.latitude,
                                longitude: MapDefaults.longitude)),
                           MyAnnotationItem(
                            coordinate: CLLocationCoordinate2D(
                                latitude: 42.1827419,
                                longitude: -75.92),
                            color: .yellow),
                           MyAnnotationItem(
                            coordinate: CLLocationCoordinate2D(
                                latitude: 42.0543,
                                longitude: -75.899),
                            color: .blue)]
    
    private enum MapDefaults {
        static let latitude = 42.098
        static let longitude = -75.9180
        static let zoom = 0.5
    }
    
    
    var body: some View {
        VStack {
//            Text("lat: \(region.center.latitude), long: \(region.center.longitude). Zoom: \(region.span.latitudeDelta)")
//            .font(.caption)
//            .padding()
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                annotationItems: annotationItems) { item in
                MapMarker(coordinate: item.coordinate)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

//, showsUserLocation: true, userTrackingMode: .constant(.follow))
   // .frame(width: 400, height: 300


