//
//  HomeViewController.swift
//  AppMusicBF
//
//  Created by Igor Fortti on 08/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeViewControllerScreen?
    
    override func loadView() {
        screen = HomeViewControllerScreen()
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardViewTableViewCell.identifier, for: indexPath) as? CardViewTableViewCell
        cell?.setupCell(data: CardData[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = DetailViewController()
        VC.cardModel = CardData[indexPath.row]
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}

