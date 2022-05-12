//
//  MapTry.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 5/12/22.
//

import SwiftUI
import MapKit


struct MapTry: View {

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.0987, longitude: 75.9180), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
  /*
    var body: some View {
        NavigationView {
          Map(coordinateRegion: $region, annotationItems: places) { place in
            MapAnnotation(coordinate: place.coordinate) {
              NavigationLink {
                LocationDetailsView(place: place)
              } label: {
                PlaceAnnotationView(title: place.location)
              }
            }
          }
          .ignoresSafeArea(edges: .bottom)
          .navigationTitle("Custom Annotation")
          .navigationBarTitleDisplayMode(.inline)
        }
      }
    */
  var body: some View {
      
    NavigationView {
     ForEach(users, id: \.self) { user in
         ForEach(user.posts, id: \.self) { post in
             if post.post_type == "public" {
                Map(coordinateRegion: $region, annotationItems: post) {post in MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: post.latitude, longitude: post.longitude)){
                        NavigationLink{
                            LocationDetailsView(post: post)
                        }label:{
                            PlaceAnnotationView(title: post.location)
                        }
        
     } //label: {
     //    PlaceAnnotationView(title: post.location)
     //  }
             }
         }
     }
}/*
        Map(coordinateRegion: $region, annotationItems: places)
        {place in MapAnnotation(coordinate: place.coordinate){
            NavigationLink(destination: place.location){
            } label: {
            PlaceAnnotationView(title: place.location)
          }
        }
      }
      .ignoresSafeArea(edges: .bottom)
      .navigationTitle("Custom Annotation")
      .navigationBarTitleDisplayMode(.inline)
    }
  }*/
    
        }
  }
}
struct MapTry_Previews: PreviewProvider {
  static var previews: some View {
      MapTry()
  }
}
