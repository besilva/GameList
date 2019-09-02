//
//  ViewController.swift
//  GameList
//
//  Created by Bernardo Silva on 30/08/19.
//  Copyright © 2019 Bernardo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel = HomeViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTablewView()
        viewModel.gameCount.bind { (count) in
            self.tableView.reloadData()
        }
    }
    
    func setupTablewView(){
        tableView.register(UINib(nibName: "GameCell", bundle: nil), forCellReuseIdentifier: "GameCell")
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.gameCount.value
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell") as? GameCell {
            cell.gameViewModel = viewModel.getGameViewModel(cellForRowAt: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Deletar") { (action, indexPAth) in
            self.viewModel.deleteGame(index: indexPath.row)
        }
        return [delete]
    }
    
}
