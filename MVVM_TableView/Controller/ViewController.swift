//
//  ViewController.swift
//  MVVM_TableView
//
//  Created by Kirill Drozdov on 06.03.2022.
//

import UIKit

class ViewController: UIViewController {

  var size = UIScreen.main.bounds
  var tableView: UITableView!

  var viewModel = QuestionViewModel()
  var questionData: DataModel?



  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    view.backgroundColor = .orange

    viewModel.getAllTheQuestion { [weak self] in 
      self?.questionData = self?.viewModel.questionModel
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
    }
    makeTable()
  }

  private func makeTable()
  {
    tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
    tableView.dataSource = self
    self.view.addSubview(tableView)
  }

}


extension ViewController : UITableViewDataSource
{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.questionData?.data?.questions?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let identifier = "identifier"
    var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
    if cell == nil {
      cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: identifier)
      cell?.textLabel?.text = questionData?.data?.questions?[indexPath.row].question
    }
    return cell!

  }

}


