//
//  CharacterDetailViewController.swift
//  mvc-uikit
//
//  Created by Harlock on 10/03/2024.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    var model: CharacterModel
    var coordinator: MainCoordinator?
    
    init(model: CharacterModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let detailView = CharacterDetailView()
        detailView.configure(model)
        view = detailView
    }
}
