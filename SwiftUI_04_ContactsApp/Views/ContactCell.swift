//
//  ContactCell.swift
//  SwiftUI_04_ContactsApp
//
//  Created by Everis on 26/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import SwiftUI

struct ContactCell: View {
    
    var contactResult: Contacts
    
    var body: some View {
        HStack  {
            Text(contactResult.initials)
                .padding(30)
                .background(Color(.darkGray))
                .clipShape(Circle())
                .font(.system(.largeTitle, design: .rounded))
                .foregroundColor(.white)
                .padding()
            VStack (alignment: .leading, spacing: 10) {
                Text(contactResult.name)
                .font(.system(.title, design: .rounded))

                Text(contactResult.surname)
                .font(.system(.headline, design: .rounded))

                Text(contactResult.phone)
                .font(.system(.caption, design: .rounded))
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20, antialiased: true)
    }
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell(contactResult: Contacts())
    }
}
