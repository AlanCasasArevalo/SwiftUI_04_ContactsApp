
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ContactCell()
                }
                NavigationLink (destination: AddFormView()) {
                    Spacer()
                    Image(systemName: "person.crop.circle.badge.plus")
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color(.darkGray))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
