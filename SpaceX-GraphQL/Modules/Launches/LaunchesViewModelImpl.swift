//
//  LaunchesViewModel.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Combine

final class LaunchesViewModelImpl: LaunchesViewModel {
    
    // MARK: - Constant
    
    private enum Constant {
        static let limit: Int = 20
    }
    
    // MARK: - NavigationProvider
    
    var navigationPublisher: AnyPublisher<NavigationDirection, Never> { navigationSubject.eraseToAnyPublisher() }
    var navigationSubject: PassthroughSubject<NavigationDirection, Never> = PassthroughSubject<NavigationDirection, Never>()
    
    // MARK: - Property
    
    @Published private(set) var viewState: ViewState<LaunchesScreenItem>
    
    private var didViewAppear: Bool
    private var launches: [PastLaunch]
    private var currentOffset: Int
    private var cancellable: AnyCancellable?
    
    // MARK: - Dependency
    
    private let pastLaunchesUseCase: PastLaunchUseCase
    
    // MARK: - Init
    
    init(pastLaunchesUseCase: PastLaunchUseCase) {
        self.pastLaunchesUseCase = pastLaunchesUseCase
        
        self.didViewAppear = false
        self.viewState = .empty
        self.launches = []
        self.currentOffset = 0
    }
    
    // MARK: - Action handling
    
    func handle(action: LaunchesAction) {
        switch action {
        case .viewDidAppear:
            guard !didViewAppear else { return }
            didViewAppear = true
            fetchData(loading: true)
        case .nextPage:
            fetchData(loading: false)
        case .launch(let launch):
            navigationSubject.sendPush(.launchDetails(id: launch.id))
        }
    }
    
    private func fetchData(loading: Bool) {
        guard cancellable == nil else { return }
        if loading {
            viewState = .loading
        }
        
        cancellable = pastLaunchesUseCase.execute(limit: Constant.limit, offset: currentOffset)
            .receive(on: RunLoop.main)
            .sink { [weak self] data in
                guard let self else { return }
                self.currentOffset += data.count
                self.launches += data
                self.feedView()
            } onFailure: { error in
                print(error.localizedDescription)
            } onFinish: { [weak self] in
                self?.cancellable = nil
            }
    }
    
    private func feedView() {
        let launchItems = launches.map { LaunchListItem(id: $0.id, missionName: $0.missionName) }
        let item = LaunchesScreenItem(pastLaunches: launchItems, hasMoreItems: currentOffset % Constant.limit == 0)
        viewState = .content(item)
    }
    
}
