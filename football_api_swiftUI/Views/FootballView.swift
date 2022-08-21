////
////  FootballView.swift
////  football_api_swiftUI
////
////  Created by Consultant on 8/20/22.
////
//

import SwiftUI

struct FootballView<T: FootballViewModelType>: View {
    
    @ObservedObject var footballVM: T
    let index: Int
    
    var body: some View {
        HStack {
            AsyncImage(url: NetworkParams.FootballImages(self.footballVM.football[index].logos.logo ).url) { realImage in
                realImage
                    .resizable()
                    .frame(width: 150, height: 200, alignment: .center)
            } placeholder: {
                ProgressView()
                    .frame(width: 150, height: 200, alignment: .center)
            }
                .padding([.top, .bottom, .trailing], 8)
            Text(footballVM.football[index].name)
                .padding([.top, .bottom, .trailing], 8)
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 0))
    }
    
}

struct FootballView_Previews: PreviewProvider {
    static var previews: some View {
        FootballDetailView(footballVM:  FootballViewModel(), index: 0)
    }
}

