//
//  AppFactory.swift
//  OddsTask
//
//  Created by Özgü Ataseven on 19.05.2025.
//

import UIKit
import FirebaseAuth

final class AppFactory {

    private let dependencyContainer: DependencyContainer

    private lazy var loginFactory = LoginFactory(dependencyContainer: dependencyContainer)
    private lazy var registerFactory = RegisterFactory(dependencyContainer: dependencyContainer)
    private lazy var sportListFactory = SportListFactory(dependencyContainer: dependencyContainer)
    private lazy var oddEventListFactory = OddEventListFactory(dependencyContainer: dependencyContainer)
    private lazy var oddEventDetailFactory = OddEventDetailFactory(dependencyContainer: dependencyContainer)
    private lazy var basketFactory = BasketFactory(dependencyContainer: dependencyContainer)

    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
    }

    func initialViewController() -> UIViewController {
        if Auth.auth().currentUser != nil {
            return sportListFactory.makeSportListViewController()
        } else {
            return loginFactory.makeLoginViewController()
        }
    }

    func loginViewController() -> UIViewController {
        return loginFactory.makeLoginViewController()
    }

    func registerViewController() -> UIViewController {
        return registerFactory.makeRegisterViewController()
    }

    func sportListViewController() -> UIViewController {
        return sportListFactory.makeSportListViewController()
    }

    func oddListViewController(sportKey: String) -> UIViewController {
        return oddEventListFactory.makeOddEventListViewController(sportKey: sportKey)
    }
    
    func oddEventDetailViewController(sportKey: String, eventId: String)-> UIViewController {
        return oddEventDetailFactory.makeOddEventDetailViewController(sportKey: sportKey, eventId: eventId)
    }
    
    func basketViewController() -> UIViewController {
        return basketFactory.makBasketViewController()
    }
}
