//
//  QuestionViewModel.swift
//  MVVM_TableView
//
//  Created by Kirill Drozdov on 06.03.2022.
//

import Foundation

class QuestionViewModel
{

  private var sourceURL = URL(string: "https://quiz-68112-default-rtdb.firebaseio.com/quiz.json")!
  var questionModel: DataModel?

  func getAllTheQuestion(comletion: @escaping ()->())
  {
    URLSession.shared.dataTask(with: sourceURL) { [weak self] data, response, error in
      if let data = data {
        let jsonDecoder = JSONDecoder()
        let finalMo = try! jsonDecoder.decode(DataModel.self, from: data)

        self?.questionModel = finalMo
        comletion()
      }

    }.resume()
  }

}
