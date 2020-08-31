/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        VStack {
            /**
             The size of the MapView with frame(width:height:).
             When you specify only the height parameter, the view automatically sizes to the width of its content. In this case, MapView expands to fill the available space.
             */
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                /**
                 These adjustments make room for the text by moving the image upwards.
                 */
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)

            /**
             Allignment: .leading = align the views by their leading edges.
             By default, stacks center their contents along their axis and provide context-appropriate spacing.
             */
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    /**
                     To direct the layout to use the full width of the device, separate the park and the state by adding a Spacer to the horizontal stack holding the two text views.
                     A spacer expands to make its containing view use all of the space of its parent view, instead of having its size defined only by its contents.
                     */
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            /**
                 .padding() modifier method to give the landmark’s name and details a little more space.
                 */
            .padding()

            /**
             Spacer() at the bottom of the outer VStack to push the content to the top of the screen.
             */
            Spacer()
        }
        /**
         call the navigationBarTitle(_:displayMode:) modifier to give the navigation bar a title when showing the detail view.
         */
            .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}
