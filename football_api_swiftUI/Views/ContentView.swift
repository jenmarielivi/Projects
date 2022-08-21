//
//  ContentView.swift
//  football_api_swiftUI
//
//  Created by Consultant on 8/20/22.
//

import SwiftUI

struct ContentView<T: FootballViewModelType>: View {
    
    @ObservedObject var FootballListVM: T
    
    
    var body: some View {
        NavigationView{
            VStack {
            
            Text("Football Teams")
            
        
            List{
          
                ForEach(0..<self.FootballListVM.football.count, id: \.self){ index in
                    NavigationLink(destination: FootballDetailView(footballVM: self.FootballListVM, index: index)){
                        FootballView(footballVM: self.FootballListVM, index: index)
                            .onAppear(){
                                self.FootballListVM.requestImagesIfNeeded(index: index)
                            }
                    }
                }
                if self.FootballListVM.isLoading{
                    ProgressView()
                }
            }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(FootballListVM: FootballViewModel())
    }
}
