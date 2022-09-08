//
//  PWCellPeriodCube.swift
//  NewMet
//
//  Created by Артем Галушкин on 07.09.2022.
//

import SwiftUI

struct PWCellPeriodCube: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("1 YEAR")
                .font(.caption2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("$99.99")
                .fontWeight(.bold)
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: 34, alignment: .leading)
            
            Text("$8.33/month\nFree 7 Day Trial")
                .font(.caption2)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 9)
        .padding(.leading, 15)
        .padding(.trailing, 9)
        .frame(width: 122, height: 123)
        .background(Color(red: 0.20, green: 0.47, blue: 0.97))
        
        //.background(Color(red: 0.10, green: 0.10, blue: 0.10))
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
    }
}

struct PWCellPeriodCube_Previews: PreviewProvider {
    static var previews: some View {
        PWCellPeriodCube()
    }
}
