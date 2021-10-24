//
//  ViewController.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 22.10.2021.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataModel = QuestionsDataModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Top questions"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configure()
        
        dataModel.fetchTopQuestions()
    }
}

extension QuestionsViewController {
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        dataModel.delegate = self
    }
}

// MARK: - Table View Data Source

extension QuestionsViewController: UITableViewDataSource {
    
    private func tags(question: Question) -> String {
        question.tags[0] + question.tags.dropFirst().reduce("") { $0 + ", " + $1 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath) as! QuestionTableViewCell
        
        let question = dataModel.questions[indexPath.row]
        cell.configureCell(title: question.title,
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
    func updateQuestionsPresentation() {
        self.tableView.reloadData()
    }
}

