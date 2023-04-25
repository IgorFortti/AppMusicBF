//
//  DetailTableViewCell.swift
//  AppMusicBF
//
//  Created by Igor Fortti on 09/03/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    static let identifier: String = "DetailTableViewCell"
    
    lazy var screen: DetailTableViewCellScreen = {
        let screen = DetailTableViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configScreen()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }
    
    public func setupCell(data: CardListModel) {
        screen.thumbImage.image = UIImage(named: data.listImage ?? "")
        screen.title.text = data.listTitle
        screen.subTitle.text = data.listSubtitle
    }
}
