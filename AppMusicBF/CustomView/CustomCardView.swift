//
//  CustomCardView.swift
//  AppMusicBF
//
//  Created by Igor Fortti on 08/03/23.
//

import UIKit

enum ViewMode {
    case full
    case card
}

class CustomCardView: UIView {
    
    var containerLeadingContraints: NSLayoutConstraint?
    var containerTopContraints: NSLayoutConstraint?
    var containerTrailingContraints: NSLayoutConstraint?
    var containerBottomContraints: NSLayoutConstraint?
    var dataModel: CardViewModel?
    
    lazy var cardContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius = 20
        return view
    }()
    
    lazy var cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .black
        return image
    }()
    
    lazy var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        return view
    }()
    
    lazy var profileBorderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var cardProfilePicture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .black
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    lazy var addProfileImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var cardCategoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var cardCategoryDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    lazy var cardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 31, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var likeAndTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var actionsView: CustomActionView = {
        let v = CustomActionView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    init(mode: ViewMode) {
        let frame = CGRect.zero
        super.init(frame: frame)
        AddSubViews()
        setupConstraints()
        updateLayout(for: mode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func AddSubViews() {
        addSubview(cardContainerView)
        cardContainerView.addSubview(cardImage)
        cardContainerView.addSubview(overlayView)
        cardContainerView.addSubview(profileBorderView)
        cardContainerView.addSubview(cardProfilePicture)
        cardContainerView.addSubview(addProfileImageButton)
        cardContainerView.addSubview(cardCategoryTitleLabel)
        cardContainerView.addSubview(cardCategoryDateLabel)
        cardContainerView.addSubview(cardTitle)
        cardContainerView.addSubview(likeAndTimeLabel)
        cardContainerView.addSubview(descriptionTitleLabel)
        cardContainerView.addSubview(actionsView)
    }
    
    private func setupConstraints() {
        containerLeadingContraints = cardContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        containerLeadingContraints?.isActive = true
        containerTopContraints = cardContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 15)
        containerTopContraints?.isActive = true
        containerBottomContraints = cardContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        containerBottomContraints?.isActive = true
        containerTrailingContraints = cardContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        containerTrailingContraints?.isActive = true
        overlayView.pin(to: cardContainerView)
        cardImage.pin(to: cardContainerView)
        NSLayoutConstraint.activate([
            profileBorderView.topAnchor.constraint(equalTo: cardContainerView.topAnchor, constant: 60),
            profileBorderView.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            profileBorderView.widthAnchor.constraint(equalToConstant: 50),
            profileBorderView.heightAnchor.constraint(equalToConstant: 50),
            
            addProfileImageButton.trailingAnchor.constraint(equalTo: profileBorderView.trailingAnchor, constant: 4),
            addProfileImageButton.bottomAnchor.constraint(equalTo: profileBorderView.bottomAnchor, constant: 4),
            addProfileImageButton.widthAnchor.constraint(equalToConstant: 20),
            addProfileImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            cardProfilePicture.centerXAnchor.constraint(equalTo: profileBorderView.centerXAnchor),
            cardProfilePicture.centerYAnchor.constraint(equalTo: profileBorderView.centerYAnchor),
            cardProfilePicture.widthAnchor.constraint(equalToConstant: 40),
            cardProfilePicture.heightAnchor.constraint(equalToConstant: 40),
            
            cardCategoryTitleLabel.topAnchor.constraint(equalTo: profileBorderView.bottomAnchor, constant: 10),
            cardCategoryTitleLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            cardCategoryDateLabel.topAnchor.constraint(equalTo: cardCategoryTitleLabel.bottomAnchor, constant: 2),
            cardCategoryDateLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            cardTitle.topAnchor.constraint(equalTo: cardCategoryDateLabel.bottomAnchor, constant: 20),
            cardTitle.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 20),
            cardTitle.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -20),
            
            likeAndTimeLabel.topAnchor.constraint(equalTo: cardTitle.bottomAnchor, constant: 10),
            likeAndTimeLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: likeAndTimeLabel.bottomAnchor, constant: 30),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 40),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -40),
            
            actionsView.bottomAnchor.constraint(equalTo: cardContainerView.bottomAnchor,constant: -20),
            actionsView.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor,constant: 20),
            actionsView.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor,constant: -20),
            actionsView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    public func updateLayout(for mode: ViewMode) {
        if mode == .full {
            containerTopContraints?.constant = 0
            containerLeadingContraints?.constant = 0
            containerTrailingContraints?.constant = 0
            containerBottomContraints?.constant = 0
            descriptionTitleLabel.isHidden = false
        } else {
            containerTopContraints?.constant = 15
            containerLeadingContraints?.constant = 30
            containerTrailingContraints?.constant = -30
            containerBottomContraints?.constant = -15
            descriptionTitleLabel.isHidden = true
        }
        actionsView.updateLayout(for: mode)
    }
    
    public func setupView(data: CardViewModel) {
        cardCategoryTitleLabel.text = data.categoryName
        cardCategoryDateLabel.text = data.categoryDate
        cardTitle.text = data.cardTitle
        likeAndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
        descriptionTitleLabel.text = data.cardDescription
        cardImage.image = UIImage(named: data.cardImage ?? "")
        cardProfilePicture.image = UIImage(named: data.categoryImage ?? "")
    }
}
