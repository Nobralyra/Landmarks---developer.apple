//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by admin on 31/08/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    /**
     landmark is a stored property of LandmarkRow.
     When you add the landmark property, the preview stops working, because the LandmarkRow type needs a landmark instance during initialization.
     */
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        /**
         A Group returns multiple previews from a preview provider.
         Group is a container for grouping view content. Xcode renders the group’s child views as separate previews in the canvas.
         */
        Group {
            /**
            In the previews static property of LandmarkRow_Previews, add the landmark parameter to the LandmarkRow initializer, specifying a specific element of the landmarkData array.
             */
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
               
        }
        /**
        previewLayout(_:) gets call on the the outside of the group’s child declarations.
        A view’s children inherit the view’s contextual settings, such as preview configurations.
        previewLayout(_:) modifier to set a size that approximates a row in a list.
        */
       .previewLayout(.fixed(width: 300, height: 70))
    }
}
