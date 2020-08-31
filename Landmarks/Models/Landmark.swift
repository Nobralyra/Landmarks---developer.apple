/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

/**
 Landmark.swift declares a Landmark structure that stores all of the landmark information the app needs to display, and imports an array of landmark data from landmarkData.json.
 
 Hashable, Codeable and Identifiable is a protocol
 *Codeable = is a type alias for the Encodable and Decodable protocols
 
 Since the Landmark type already has the id property required by Identifiable protocol, there’s no more work to do.
 */
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

struct Landmark_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
