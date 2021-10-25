//
//  UserView.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 24.10.2021.
//

import UIKit

class UserView: UIView {
    
    var user: User?
    private var userImage: UIImage {
        return user?.profileImage ?? UIImage(systemName: "person.crop.circle.badge.questionmark")!
    }
    
    // MARK: Subviews
    private var hStack: UIStackView!
    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    private var reputationLabel: UILabel!
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    // MARK: setup view
    private func setupViews() {
        hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.spacing = 16.0
        
        imageView = UIImageView()
        imageView.contentMode = .left
        imageView.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
        imageView.layer.cornerRadius = 8.0
        hStack.addArrangedSubview(imageView)
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.alignment = .leading
        vStack.spacing = 4.0
        
        nameLabel = UILabel()
        nameLabel.font = .preferredFont(forTextStyle: .headline)
        vStack.addArrangedSubview(nameLabel)
        
        reputationLabel = UILabel()
        reputationLabel.font = .preferredFont(forTextStyle: .caption1)
        vStack.addArrangedSubview(reputationLabel)
        
        hStack.addArrangedSubview(vStack)
        self.addSubview(hStack)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: self.topAnchor),
            hStack.leftAnchor.constraint(equalTo: self.leftAnchor),
            hStack.rightAnchor.constraint(equalTo: self.rightAnchor),
            hStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func updateViewContent() {
        imageView.image = userImage
        nameLabel.text = user?.name ?? ""
        reputationLabel.text = user?.reputation?.thousandsFormatting ?? ""
    }
}
