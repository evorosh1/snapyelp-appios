//
//  MapView.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 5/2/22.
//

import MapKit
import SwiftUI


struct MapView: View {
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7, longitude: -79), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))

    var body: some View {
        NavigationView{
            VStack{
            Map(coordinateRegion: $region)
                Button(action: {
                    withAnimation {
                    region.span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
                    }
                }, label: {
                    Text("Zoom In")
                        .bold()
                        .frame(width: 250, height: 50, alignment: .center)
                        .background(Color.green)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                })
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
