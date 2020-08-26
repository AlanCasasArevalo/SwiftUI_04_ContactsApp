//
//  DetailView.swift
//  SwiftUI_04_ContactsApp
//
//  Created by Everis on 26/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack  {
            Text("AM")
                .padding(50)
                .background(Color(.darkGray))
                .clipShape(Circle())
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding()
            VStack (alignment: .leading, spacing: 8) {
                Text("Nombre")
                .font(.system(.title, design: .rounded))

                Text("Apellido")
                .font(.system(.headline, design: .rounded))

                Text("Tel: 666 666 666")
                .font(.system(.largeTitle, design: .rounded))
            }
            
            HStack {
                
            }            
        }
        .padding()
        .cornerRadius(20, antialiased: true)    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
