//
//  QuestionsDataModel.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 23.10.2021.
//

import Foundation

protocol QuestionsDataModelDelegate {
    func updateQuestionsView()
}

class QuestionsDataModel {
    private(set) var questions: [Question] = []
    private(set) var isLoading = false
    
    private var request: APIRequest<QuestionResource>?
    
    var delegate: QuestionsDataModelDelegate? //
    
    func fetchTopQuestions() {
        guard !isLoading else { return }
        isLoading = true
        let resource = QuestionResource()
        let request = APIRequest(resource: resource)
        self.request = request
        request.execute { [weak self] questions, error in
            if let error = error {
                print("error: \(error.kind)")
                if let description = error.description {
                    print("> description: \(description)")
                }
                // ?
            }
            
            self?.questions = questions ?? []
            self?.isLoading = false
            self?.delegate?.updateQuestionsView()
        }
    }
}
