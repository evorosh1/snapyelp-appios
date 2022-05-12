//
//  LocationDetailsView.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 5/12/22.
//
/*
import SwiftUI
import MapKit

struct LocationDetailsView: View {
  let place: Place
  
  var body: some View {
    VStack(spacing: 20) {
      Text(place.location)
        .font(.title)
      
      Text(place.coordinate.description)
        .font(.title2)
    }
    .navigationTitle(place.location)
  }
}

extension CLLocationCoordinate2D: CustomStringConvertible {
  public var description: String {
    "\(latitude);\(longitude)"
  }
}

struct LocationDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    LocationDetailsView(place: places[0])
  }
}
*/
import SwiftUI
import MapKit

struct LocationDetailsView: View {
  var post: Post
  //var user: User
  
  var body: some View {
    VStack(spacing: 20) {
      Text(post.location)
        .font(.title)
      
      //Text(place.coordinate.description)
       // .font(.title2)
    }
    .navigationTitle(post.location)
  }
}

extension CLLocationCoordinate2D: CustomStringConvertible {
  public var description: String {
    "\(latitude);\(longitude)"
  }
}

struct LocationDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    LocationDetailsView(post: users[0].posts[0])
  }
}





/*
import SwiftUI
import MapKit

struct LocationDetailsView: View {
  var place = Place
  var body: some View {
  //let place = Place(name: post.location, coordinate: CLLocationCoordinate2D(latitude: post.latitude, longitude: post.longitude))
      
    VStack(spacing: 20) {
        Text(place.location)
        .font(.title)
      
        Text(place.review_text)
        .font(.title2)
    }
    .navigationTitle(place.location)
  }
}

extension CLLocationCoordinate2D: CustomStringConvertible {
  public var description: String {
    "\(latitude);\(longitude)"
  }
}

struct LocationDetailsView_Previews: PreviewProvider {
  static var previews: some View {
      LocationDetailsView(place: places[0])
  }
}
*/

