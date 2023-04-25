//
//  CardViewTableViewCell.swift
//  AppMusicBF
//
//  Created by Igor Fortti on 08/03/23.
//

import UIKit

class CardViewTableViewCell: UITableViewCell {

    static let identifier: String = "CardViewTableViewCell"
    
    lazy var cardView: CustomCardView = {
        let v = CustomCardView(mode: .card)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
        setupConstraints()
    }
    
    public func setupCell(data: CardViewModel) {
        cardView.setupView(data: data)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        contentView.addSubview(cardView)
    }
    
    fileprivate func setupConstraints() {
        cardView.pin(to: self)
    }
}
