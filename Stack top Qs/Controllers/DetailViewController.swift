//
//  DetailViewController.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 24.10.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var question: Question!
    
    private var dataModel: QuestionDataModel!
    private var questionView: QuestionView! {
        guard isViewLoaded else { return nil }
        return (view as! QuestionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Details"
        
        dataModel = QuestionDataModel(question: question)
        configureDelegation()
        dataModel.loadQuestion()
    }
}

extension DetailViewController {
    private func configureDelegation() {
        dataModel.delegate = self
    }
}

// MARK: - Question Data Model Delegate

extension DetailViewController: QuestionDataModelDelegate {
    func updateQuestionView() {
        questionView.question = dataModel.question
        questionView.updateViewContent()
    }
}
