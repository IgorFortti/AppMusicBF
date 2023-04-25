//
//  DetailTableViewCellScreen.swift
//  AppMusicBF
//
//  Created by Igor Fortti on 09/03/23.
//

import UIKit

class DetailTableViewCellScreen: UIView {

    lazy var thumbImage: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "demo")
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        return img
    }()
    
    lazy var title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Teste Nome"
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textColor = .black
        return l
    }()
    
    lazy var subTitle: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Sub Titulo"
        l.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        l.textColor = .lightGray
        return l
    }()
    
    lazy var likeBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "love")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .lightGray
        return btn
    }()
    
    lazy var moreBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .lightGray
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(thumbImage)
        addSubview(title)
        addSubview(subTitle)
        addSubview(likeBtn)
        addSubview(moreBtn)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            thumbImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            thumbImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            thumbImage.heightAnchor.constraint(equalToConstant: 60),
            thumbImage.widthAnchor.constraint(equalToConstant: 60),
            
            title.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 15),
            title.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            title.trailingAnchor.constraint(equalTo: likeBtn.leadingAnchor, constant: -15),
            
            subTitle.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 15),
            subTitle.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            subTitle.trailingAnchor.constraint(equalTo: likeBtn.leadingAnchor, constant: -15),
            
            likeBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            likeBtn.trailingAnchor.constraint(equalTo: moreBtn.leadingAnchor, constant: -20),
            likeBtn.heightAnchor.constraint(equalToConstant: 35),
            likeBtn.widthAnchor.constraint(equalToConstant: 35),
            
            moreBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            moreBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            moreBtn.heightAnchor.constraint(equalToConstant: 35),
            moreBtn.widthAnchor.constraint(equalToConstant: 35),
        ])
    }
}
