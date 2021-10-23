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

}
