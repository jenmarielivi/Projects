//
//  FootballDetailView.swift
//  football_api_swiftUI
//
//  Created by Consultant on 8/20/22.
//

import SwiftUI

struct FootballDetailView<T: FootballViewModelType>: View{
    
    @ObservedObject var footballVM: T
    let index: Int
    
    var body: some View{
        VStack{
            FootballView(footballVM: self.footballVM, index: index)
            Text(self.footballVM.football[index].name)
                .padding()
            Spacer()
            
            }
        }
    }

    struct FootballDetailView_Previews: PreviewProvider {
        static var previews: some View{
            FootballDetailView(footballVM: FootballViewModel(), index: 0)
        }
    }
    
