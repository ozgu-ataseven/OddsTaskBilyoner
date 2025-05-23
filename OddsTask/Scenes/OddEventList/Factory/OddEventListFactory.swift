//
//  OddEventListFactory.swift
//  OddsTask
//
//  Created by Özgü Ataseven on 19.05.2025.
//

import UIKit

protocol OddEventListFactoryProtocol {
    func makeOddEventListViewController(sportKey: String) -> UIViewController
}

final class OddEventListFactory: OddEventListFactoryProtocol {
    private let dependencyContainer: DependencyContainer

    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
    }

    func makeOddEventListViewController(sportKey: String) -> UIViewController {
        let viewModel = OddEventListViewModel(dependencyContainer: dependencyContainer, sportKey: sportKey)
        let viewController = OddEventListViewController(viewModel: viewModel)
        return viewController
    }
}
