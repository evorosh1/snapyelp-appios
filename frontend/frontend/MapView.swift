//
//  MapTry2.swift
//  frontend
//
//  Created by Destiny Walcott on 5/12/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.098, longitude: -75.9180), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @State var displayPost = false
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: places) {place in
            MapAnnotation(coordinate: place.coordinate) {
                if place.post.post_type == "public" {
                    Button(action: {
                        displayPost.toggle()
                    }, label: {
                        PlaceAnnotationView(title: place.post.location)
                    })
                    .sheet(isPresented: $displayPost) {
                        MapItemView(user: place.user, post: place.post)
                    }
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
