//
//  CharacterListViewController.swift
//  mvc-uikit
//
//  Created by Harlock on 10/03/2024.
//

import Foundation
import UIKit

class CharacterListViewController: UIViewController {
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .yellow
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CharacterCellView.self, forCellReuseIdentifier: "CharacterCellView")
        return table
    }()
    
    var characters: [CharacterModel] = []
    var coordinator: MainCoordinator?
    let apiClient = APIClient()
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        Task {
            characters = await apiClient.getListOfCharacters().results
            
            await MainActor.run {
                self.tableView.reloadData()
            }
       }
    }
    
}
 
extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCellView", for: indexPath) as! CharacterCellView
        let item = characters[indexPath.row]
        
        cell.configure(item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showDetailView(model: characters[indexPath.row])
    }
}

