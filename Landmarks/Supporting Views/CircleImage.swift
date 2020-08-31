/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that clips an image to a circle and adds a stroke and shadow.
*/

import SwiftUI

struct CircleImage: View {
    /**
     Stored image property to CircleImage.
     
     This is a common pattern when building views using SwiftUI. Your custom views will often wrap and encapsulate a series of modifiers for a particular view.
     */
    var image: Image
    var body: some View {
        /**
         clipShape(Circle()) to apply the circular clipping shape to the image.
         The Circle type is a shape that you can use as a mask, or as a view by giving the circle a stroke or fill.
        Create another circle with a white stroke, and then add it as an overlay to give the image a border.
         */
        image
            .clipShape(Circle())
            .overlay(
            Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
