//
//  PWCellView.swift
//  NewMet
//
//  Created by Артем Галушкин on 07.09.2022.
//

import SwiftUI

struct PWCellView: View {
    var strImageName: String
    var strTitle: String
    var strDescription: String
    var body: some View {
        HStack(alignment: .top) {
            Image(strImageName)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(strTitle)
                    .fontWeight(.semibold)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .foregroundColor(.black)
                
                Text(strDescription)
                    .font(.footnote)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.black)
            }
        }
    }
}

struct PWCellView_Previews: PreviewProvider {
    static var previews: some View {
        PWCellView(strImageName: "AppIcon", strTitle: "test", strDescription: "description")
    }
}
