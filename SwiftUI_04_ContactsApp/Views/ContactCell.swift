//
//  ContactCell.swift
//  SwiftUI_04_ContactsApp
//
//  Created by Everis on 26/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import SwiftUI

struct ContactCell: View {
    var body: some View {
        HStack  {
            Text("AM")
                .padding(30)
                .background(Color(.darkGray))
                .clipShape(Circle())
                .font(.system(.largeTitle, design: .rounded))
                .foregroundColor(.white)
                .padding()
            VStack (alignment: .leading, spacing: 10) {
                Text("Nombre")
                .font(.system(.title, design: .rounded))

                Text("Apellido")
                .font(.system(.headline, design: .rounded))

                Text("Telefono")
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
        ContactCell()
    }
}
