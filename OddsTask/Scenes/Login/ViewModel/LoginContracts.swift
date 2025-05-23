//
//  LoginContracts.swift
//  OddsTask
//
//  Created by Özgü Ataseven on 17.05.2025.
//

import Combine

protocol LoginViewModelProtocol: AnyObject {

    // MARK: - Inputs
    var email: String { get set }
    var password: String { get set }
    
    // MARK: - Outputs
    var emailValidationMessagePublisher: AnyPublisher<String?, Never> { get }
    var passwordValidationMessagePublisher: AnyPublisher<String?, Never> { get }
    var isFormValidPublisher: AnyPublisher<Bool, Never> { get }
    var loadingPublisher: AnyPublisher<Bool, Never> { get }
    var alertPublisher: AnyPublisher<Alert, Never> { get }
    var routeSportListPublisher: AnyPublisher<Void, Never> { get }

    // MARK: - Actions
    func login()
    func registerTapped()
}
