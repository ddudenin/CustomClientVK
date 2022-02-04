//
//  MainCoordinator.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 18.12.2021.
//

import UIKit
import SwiftUI
import Combine

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

class MainCoordinator: Coordinator {
    
    private let loginViewModel: LoginViewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        let loginView = VKLoginWebView()
        let loginViewController = UIHostingController(rootView: loginView)
        self.navigationController = UINavigationController(rootViewController: loginViewController)
    }
    
    func start() {
        self.loginViewModel.$isUserAuthorized
            .subscribe(on: RunLoop.main)
            .sink { [weak self] isAuthorized in
                guard let self = self else { return }
                if !isAuthorized {
                    self.navigationController.popToRootViewController(animated: true)
                } else {
                    let mainTabBarView = UIHostingController(rootView: MainTabBarView())
                    self.navigationController.pushViewController(mainTabBarView, animated: true)
                }
            }
            .store(in: &cancellables)
    }
}
