//
//  QuestionDataModel.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 23.10.2021.
//

import Foundation

class QuestionDataModel {
    var question: Question
    var isLoading = false
    
    private var questionRequest: APIRequest<QuestionResource>?
    private var imageRequest: ImageRequest?
    
    init(question: Question) {
        self.question = question
    }
    
    func loadQuestion() {
        guard !isLoading else { return }
        isLoading = true
        
        let resource = QuestionResource(id: question.id)
        let request = APIRequest(resource: resource)
        self.questionRequest = request
        request.execute { [weak self] questions, _ in
            guard let question = questions?.first else { return }
            self?.question = question
            self?.loadOwnerAvatar()
        }
    }
}

private extension QuestionDataModel {
    func loadOwnerAvatar() {
        guard let url = question.owner?.profileImageURL else { return }
        let imageRequest = ImageRequest(url: url)
        self.imageRequest = imageRequest
        imageRequest.execute { [weak self] image, _ in
            self?.question.owner?.profileImage = image
            self?.isLoading = false
        }
    }
}
