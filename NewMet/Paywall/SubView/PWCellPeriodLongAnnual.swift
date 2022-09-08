//
//  PWCellPeriodLongAnnual.swift
//  NewMet
//
//  Created by Артем Галушкин on 07.09.2022.
//

import SwiftUI

struct PWCellPeriodLongAnnual: View {
    
    let strPeriod: String
    let strPrice: String
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            Text("Most popular")
                  .foregroundColor(.white)
                  .font(.system(size: 10, weight: .semibold))
                  //.font(.largeTitle)
                  .padding(4)
                  .background(RoundedCorners(color: .blue, tl: 0, tr: 40, bl: 9, br: 0))
                  .frame(width: 76, height: 24)
                  .padding(.trailing, 16)
                  .padding(.top, -1)
            
            HStack(alignment: .top, spacing: 10) {
                Text(strPeriod) //"1 week"
                .fontWeight(.bold)
                .font(.title3)
                .foregroundColor(.black)

                Text(strPrice) //"$3.99"
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
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(pwAccent, lineWidth: 2))
            .padding(.horizontal, 16)
        }
        
       
    }
}

struct PWCellPeriodLongAnnual_Previews: PreviewProvider {
    static var previews: some View {
        PWCellPeriodLongAnnual(strPeriod: "1 week", strPrice: "1000")
    }
}
