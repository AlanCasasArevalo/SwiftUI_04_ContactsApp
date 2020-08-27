
import SwiftUI

struct ContentView: View {
    
    @FetchRequest(fetchRequest: Contacts.performRequest()) var contacts: FetchedResults<Contacts>
    
    var body: some View {
        NavigationView {
            VStack {
                List (self.contacts) { contact in
                    NavigationLink (destination: DetailView()) {
                        ContactCell(contactResult: self.mapContactIntoContactResult(contact: contact))
                    }
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

extension ContentView {
    func mapContactIntoContactResult (contact: Contacts) -> ContactResult {
        let initials = contact.initials 
        
        let contactResult = ContactResult(name: contact.name, surname: contact.surname, initials: initials, phone: contact.phone)
        return contactResult
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
