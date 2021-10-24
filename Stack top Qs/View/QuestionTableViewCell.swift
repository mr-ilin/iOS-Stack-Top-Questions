//
//  QuestionTableViewCell.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 23.10.2021.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    static let identifier = "QuestionCell"

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var tags: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var answersCount: UILabel!
    @IBOutlet weak var viewCount: UILabel!
    
    
    /// Sets cell data values
    func configureCell(title: String, tags: [String], date: Date, score: Int, answersCount: Int, viewsCount: Int) {
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
