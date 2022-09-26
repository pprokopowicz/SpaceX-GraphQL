//
//  LaunchDetailsViewModelImpl.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation
import Combine

final class LaunchDetailsViewModelImpl: LaunchDetailsViewModel {
    
    // MARK: - Property
    
    @Published private(set) var viewState: ViewState<String>
    
    private let launchId: String
    private var didViewAppear: Bool
    private var cancellable: AnyCancellable?
    
    // MARK: - Dependency
    
    private let launchDetailsUseCase: LaunchDetailsUseCase
    
    // MARK: - Init
    
    init(
        launchId: String,
        launchDetailsUseCase: LaunchDetailsUseCase
    ) {
        self.launchId = launchId
        self.launchDetailsUseCase = launchDetailsUseCase
        
        self.viewState = .empty
        self.didViewAppear = false
    }
    
    // MARK: - Action
    
    func handle(action: LaunchDetailsAction) {
        switch action {
        case .viewDidAppear:
            guard !didViewAppear else { return }
            didViewAppear = true
            fetchData()
        }
    }
    
    private func fetchData() {
        viewState = .loading
        cancellable = launchDetailsUseCase.execute(id: launchId)
            .receive(on: RunLoop.main)
            .sink { [weak self] data in
                guard let self else { return }
                self.viewState = .content(data.missionName)
            } onFailure: { error in
                print(error.localizedDescription)
            } onFinish: { [weak self] in
                self?.cancellable = nil
            }
    }
    
}
