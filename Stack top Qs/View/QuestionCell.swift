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
    func setupCell(title: String, tags: [String], date: Date, score: Int, answersCount: Int, viewsCount: Int) {
        self.title.text = title
        self.tags.text = tagsString(tags: tags)
        self.date.text = date.formattedDate
        self.score.text = String(score)
        self.answersCount.text = String(answersCount)
        self.viewCount.text = viewsCount.thousandsFormatting
    }
    
    private func tagsString(tags: [String]) -> String {
        tags[0] + tags.dropFirst().reduce("") { $0 + ", " + $1 }
    }
}
