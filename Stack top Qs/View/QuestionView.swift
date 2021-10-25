//
//  QuestionView.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 24.10.2021.
//

import UIKit

class QuestionView: UIView {

    var question: Question?

    // MARK: Subviews
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    private var body: UILabel!
    private var userView: UserView!

    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupScrollView()
        setupViews()
    }

    // MARK: setup views
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)

        setupScrollViewConstraints()
    }

    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    private func setupViews() {
        body = UILabel()
        body.numberOfLines = 0
        body.sizeToFit()
        body.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(body)
        
        userView = UserView()
        userView.sizeToFit()
        userView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(userView)
        
        setupViewsConstraints()
    }
    
    private func setupViewsConstraints() {
        NSLayoutConstraint.activate([
            body.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            body.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            body.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            
            userView.topAnchor.constraint(equalTo: body.bottomAnchor, constant: 20),
            userView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            userView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    

    func updateViewContent() {
        body.text = question?.body
        userView.user = question?.owner
        userView.updateViewContent()
    }

}
