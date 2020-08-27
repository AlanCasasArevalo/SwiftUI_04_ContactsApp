
import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context

//    @FetchRequest(fetchRequest: Contacts.performRequest()) var contacts: FetchedResults<Contacts>
    
    @FetchRequest(entity: Contacts.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Contacts.initials, ascending: true)]) var contacts: FetchedResults<Contacts>

//    @FetchRequest(entity: Contacts.entity(),
//                  sortDescriptors: [NSSortDescriptor(keyPath: \Contacts.initials , ascending: true)],
//                  predicate: NSPredicate(format: "surname = %@", "Guzman")
//    ) var contacts: FetchedResults<Contacts>

    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach (self.contacts) { contact in
                        NavigationLink (destination: DetailView()) {
                            ContactCell(contactResult: self.mapContactIntoContactResult(contact: contact))
                        }
                    }
                    .onDelete { index in
                        let contactToDelete = self.contacts[index.first!]
                        self.context.delete(contactToDelete)
                        do {
                            try self.context.save()
                        } catch let error as NSError {
                            print(error.localizedDescription)
                        }
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
            .navigationBarItems(leading: EditButton())
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
