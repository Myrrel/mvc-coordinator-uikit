//
//  Coordinator.swift
//  mvc-uikit
//
//  Created by Harlock on 11/03/2024.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController? {get set}
    
    func start()
}
