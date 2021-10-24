//
//  ViewController.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 22.10.2021.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    private var dataModel = QuestionsDataModel()
    
    private var questionsView: QuestionsView! {
        guard isViewLoaded else { return nil }
        return (view as! QuestionsView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Top questions"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureDelegation()
        dataModel.fetchTopQuestions()
    }
}

extension QuestionsViewController {
    private func configureDelegation() {
        questionsView.tableView.delegate = self
        questionsView.tableView.dataSource = self
        dataModel.delegate = self
    }
}

// MARK: - Table View Data Source

extension QuestionsViewController: UITableViewDataSource {
    
    private func tags(question: Question) -> String {
        question.tags[0] + question.tags.dropFirst().reduce("") { $0 + ", " + $1 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionCell.identifier, for: indexPath) as! QuestionCell
        
        let question = dataModel.questions[indexPath.row]
        cell.setupCell(title: question.title,
                           tags: question.tags,
                           date: question.date,
                           score: question.score,
                           answersCount: question.answerCount,
                           viewsCount: question.viewCount)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.questions.count
    }
}

// MARK: - Table View Delegate

extension QuestionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ...
    }
}

extension QuestionsViewController: QuestionsDataModelDelegate {
    func updateQuestionsView() {
        self.questionsView.tableView.reloadData()
    }
}

