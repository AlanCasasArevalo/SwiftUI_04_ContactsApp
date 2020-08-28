//
//  ContactEdit.swift
//  SwiftUI_04_ContactsApp
//
//  Created by Everis on 27/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import SwiftUI

struct ContactEdit: View {

    @Environment(\.managedObjectContext) var context
    
    @Environment(\.presentationMode) var presentation
    
    var contact: Contacts
    
    @State private var name = ""
    @State private var surname = ""
    @State private var phone = ""
    
    var body: some View {
        VStack {
            TextField(contact.name, text: self.$name)
                .padding(10)
            TextField(contact.surname, text: self.$surname)
                .padding(10)
            TextField(contact.phone, text: self.$phone)
                .padding(10)
                .keyboardType(.phonePad)
            
            Button(action: {
                self.save()
                print("Se ha salvado el contacto")
                self.presentation.wrappedValue.dismiss()
            }) {
                Spacer()
                Image(systemName: "person.crop.circle.badge.checkmark")
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .background(Color(.darkGray))
            Spacer()
        }
        .onAppear{
            self.name = self.contact.name
            self.surname = self.contact.surname
            self.phone = self.contact.phone
        }
        .navigationBarTitle("Editar contacto")
    }
}

extension ContactEdit {
    func save () {
        contact.name = self.name
        contact.surname = self.surname
        contact.phone = self.phone
        contact.initials = setInitials(name: contact.name, surname: contact.surname)
        
        do {
            try self.context.save()
            print("Guardado correctamente")
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

struct ContactEdit_Previews: PreviewProvider {
    static var previews: some View {
        ContactEdit(contact: Contacts())
    }
}
