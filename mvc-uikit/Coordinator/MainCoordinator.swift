//
//  MainCoordinator.swift
//  mvc-uikit
//
//  Created by Harlock on 11/03/2024.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    func start() {
       let vc = CharacterListViewController()
       vc.coordinator = self
       navigationController?.pushViewController(vc, animated: false)
   }
       
    func showDetailView(model: CharacterModel) {
        let vc = CharacterDetailViewController(model: model)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
