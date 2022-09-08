//
//  PWCellPeriodLong.swift
//  NewMet
//
//  Created by Артем Галушкин on 07.09.2022.
//

import SwiftUI

struct PWCellPeriodLong: View {
    let strPeriod: String
    let strPrice: String
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text(strPeriod) //"1 week"
            .fontWeight(.bold)
            .font(.title3)
            .foregroundColor(.black)

            Text(strPrice)
            .fontWeight(.bold)
            .font(.title3)
            .multilineTextAlignment(.trailing)
            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
            .foregroundColor(.black)
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
        .padding(.vertical, 16)
        //.frame(width: 333)
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(pwDivider, lineWidth: 2))
        .padding(.horizontal, 16)
    }
}

struct PWCellPeriodLong_Previews: PreviewProvider {
    static var previews: some View {
        PWCellPeriodLong(strPeriod: "1 week", strPrice: "100")
    }
}
