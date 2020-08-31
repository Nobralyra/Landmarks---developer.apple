//
//  LandmarkList.swift
//  Landmarks
//
//  Created by admin on 31/08/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        /**
         Navigation capabilities to a list by embedding it in a NavigationView, and then nesting each row in a NavigationLink to set up a transtition to a destination view.
         */
        NavigationView {
            /**
            A list that displays the elements of collection by passing the collection of data and a closure that provides a view for each element in the collection.
            The list transforms each element in the collection into a child view by using the supplied closure.
             
            Lists work with identifiable data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
             
            You do not need a id parameter becauce Landmark.swift han the declared the Identifiable protocol and just use collections of Landmark elements directly.
            Does not work - do not know why!!!
            */
            List(landmarkData, id: \.id) {
                /**
                 Complete the dynamically-generated list by returning a LandmarkRow from the closure.
                 This creates one LandmarkRow for each element in the landmarkData array.
                 
                 NavigationLink = wrapped the returned row in a NavigationLink, specifying the LandmarkDetail view as the destination.
                 pass the current landmark to the destination LandmarkDetail.
                 */
                landmark in NavigationLink(destination: LandmarkDetail(landmark: landmark)) { LandmarkRow(landmark: landmark)
                }
            }
            /**
             Call the navigationBarTitle(_:) modifier method to set the title of the navigation bar when displaying the list.
             */
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        /**
         Added code to the LandmarkList_Previews preview provider to render previews of the list view at different device sizes. By default, previews render at the size of the device in the active scheme. You can change the preview device by calling the previewDevice(_:) modifier method.
         
         Within the list preview, embed the LandmarkList in a ForEach instance, using an array of device names as the data.
         ForEach operates on collections the same way as the list, which means you can use it anywhere you can use a child view, such as in stacks, lists, groups, and more. When the elements of your data are simple value types — like the strings you’re using here — you can use \.self as key path to the identifier.
         */
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) {
            deviceName in LandmarkList()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            /**
             previewDisplayName(_:) modifier to add the device names as labels for the previews.
             */
            .previewDisplayName(deviceName)
        }
        
        
    }
}

/**
 /**
  The List type can display a platform-specific list of views. The elements of the list can be static or dynamically generated. You can even mix static and dynamically generated views.
  */
 List {
     /**
      The list is provided with LandmarkRow instances with the first two landmarks as the list’s children.
      The preview shows the two landmarks rendered in a list style that’s appropriate for iOS.
      */
     LandmarkRow(landmark: landmarkData[0])
     LandmarkRow(landmark: landmarkData[1])
 }
 */
