//
//  Football_ViewModel.swift
//  football_api_swiftUI
//
//  Created by Consultant on 8/20/22.
//

import Foundation
import Combine

protocol FootballViewModelType: ObservableObject{
    var football: [DataValue] { get }
    var isLoading: Bool { get }
    func requestImagesIfNeeded(index: Int)
    
}

class FootballViewModel: FootballViewModelType{
    
    private let networkService: NetworkService
    private var subs = Set<AnyCancellable>()
    @Published var football: [DataValue] = []
    var currentPage = 0
    @Published var isLoading: Bool = false
    
    init(network: NetworkService = NetworkManager()) {
        self.networkService = network
        self.requestImagesIfNeeded(index: 0)
    }
    
    
    func requestImagesIfNeeded(index: Int) {
        guard index == (self.football.count - 1) || self.football.isEmpty else { return }
        self.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.requestImages()
        }
    }
    
    func requestImages(){
        self.networkService.getModel(url: NetworkParams.FottballList(self.currentPage + 1).url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
                print("kfladfj;saldkj")
            } receiveValue: { [weak self] (page: Football) in
                guard let result = page as? Football else{return}
                
                print(result)
                self?.football.append(contentsOf: result.data)
//                self?.currentPage = page.page
                self?.isLoading = false
                print("kfladfjkfkndfnnkfld;laslk;dfks;k")

            }.store(in: &self.subs)
    }
}
