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
//            self?.questions = TestData.Questions
            self?.isLoading = false
            self?.delegate?.updateQuestionsView()
        }
    }
}

// debug
struct TestData {
    static var Questions: [Question] = {
        let url = Bundle.main.url(forResource: "Questions", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let wrapper = try! JSONDecoder().decode(Wrapper<Question>.self, from: data)
        return wrapper.items
    }()

    static let user = User(name: "Lumir Sacharov", reputation: 2345, profileImageURL: nil)
}
