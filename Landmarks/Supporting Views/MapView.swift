/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that hosts an `MKMapView`.
*/

import SwiftUI
import MapKit

/**
 declare UIViewRepresentable conformance for the MapView type.
 
 UIViewRepresentable protocol has two requirements:
 makeUIView(context: ) method that creates an MKMapView, and an
 updateUIView(_:context:) method that configures the view and responds to any changes.
 */
struct MapView: UIViewRepresentable {
    /**
     A coordinate property
     */
    var coordinate: CLLocationCoordinate2D
    /**
     Replace the body property with a makeUIView(context:) method that creates and returns an empty MKMapView.
     */
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    /**
     updateUIView(_:context:) method that sets the map view’s region to the correct coordinates to center the map on Turtle Rock.
     */
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011_286, longitude: -116.166_868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
