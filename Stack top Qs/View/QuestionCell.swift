//
//  QuestionTableViewCell.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 23.10.2021.
//

import UIKit

class QuestionCell: UITableViewCell {
    
    static let identifier = "QuestionCell"

    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var tags: UILabel!
    @IBOutlet private weak var date: UILabel!
    
    @IBOutlet private weak var score: UILabel!
    @IBOutlet private weak var answersCount: UILabel!
    @IBOutlet private weak var viewCount: UILabel!
    
    
    /// Sets cell data values
    func setupCell(question: Question) {
        self.title.text = question.title
        self.tags.text = tagsString(tags: question.tags)
        self.date.text = question.date.formattedDate
        self.score.text = String(question.score)
        self.answersCount.text = String(question.answerCount)
        self.viewCount.text = question.viewCount.thousandsFormatting
    }
    
    private func tagsString(tags: [String]) -> String {
        tags[0] + tags.dropFirst().reduce("") { $0 + ", " + $1 }
    }
}
