//
//  DetailView.swift
//  SwiftUI_04_ContactsApp
//
//  Created by Everis on 26/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentation

    var contact: Contacts
    
    var body: some View {
        VStack  {
            Text(contact.initials)
                .padding(50)
                .background(Color(.darkGray))
                .clipShape(Circle())
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding()
            VStack (alignment: .leading, spacing: 8) {
                Text(contact.name)
                    .font(.system(.title, design: .rounded))
                
                Text(contact.surname)
                    .font(.system(.headline, design: .rounded))
                
                Text(contact.phone)
                    .font(.system(.largeTitle, design: .rounded))
            }
            
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "phone.fill")
                        .modifier(CustomCircularButtonModifier(backgroundColor: .green))
                }
                
                NavigationLink(destination: ContactEdit(contact: contact)) {
                    Image(systemName: "pencil")
                        .modifier(CustomCircularButtonModifier(backgroundColor: Color(.systemGray2)))
                }
            }
            Spacer()
        }
    }
}

struct CustomCircularButtonModifier: ViewModifier {
    
    var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding(30)
            .background(backgroundColor)
            .clipShape(Circle())
            .foregroundColor(.white)
            .font(.system(.largeTitle))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(contact: Contacts())
    }
}
