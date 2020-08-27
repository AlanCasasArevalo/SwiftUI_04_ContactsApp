

import SwiftUI

struct AddFormView: View {
    
    @Environment(\.managedObjectContext) var context

    @Environment(\.presentationMode) var presentation

    @State private var name = ""
    @State private var surname = ""
    @State private var phone = ""
    
    var body: some View {
        VStack {
            TextField("Nombre:", text: self.$name)
                .padding(10)
            TextField("Apellido:", text: self.$surname)
                .padding(10)
            TextField("Telefono:", text: self.$phone)
                .padding(10)
                .keyboardType(.phonePad)
            
            Button(action: {
                self.save()
                print("Se ha salvado el contacto")
                self.presentation.wrappedValue.dismiss()
            }) {
                Spacer()
                Image(systemName: "person.crop.circle.badge.plus")
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .background(Color(.darkGray))
            Spacer()
        }
        .navigationBarTitle("Agregar contacto")
    }
}

extension AddFormView {
    func save () {
        let contact = Contacts.init(context: context)
        contact.name = self.name
        contact.surname = self.surname
        contact.phone = self.phone
        contact.initials = setInitials(name: contact.name, surname: contact.surname)
        
        do {
            try self.context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func setInitials (name: String, surname: String) -> String {
        var initials = ""
        initials = "\(name.first?.uppercased() ?? "")\(surname.first?.uppercased() ?? "")"
        return initials
    }
}

struct AddFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddFormView()
    }
}
