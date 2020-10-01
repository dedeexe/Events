import SwiftUI
import MapKit

struct LocationViewModel {
    let latitude: Double
    let longitude: Double
}

struct LocationView: UIViewRepresentable {
    
    let viewModel: LocationViewModel
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinates = CLLocationCoordinate2D(latitude: viewModel.latitude, longitude: viewModel.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 1.5, longitudeDelta: 1.5)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        uiView.setRegion(region, animated: false)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(viewModel: .init(latitude: 35.682107, longitude: 139.818452))
    }
}
