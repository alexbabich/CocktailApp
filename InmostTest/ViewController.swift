//
//  ViewController.swift
//  InmostTest
//
//  Created by alex-babich on 08.09.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableList: UITableView!
    var dataList = [Dictionary<String, Any>]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        tableList.tableFooterView = UIView(frame: .zero)
        tableList.register(UINib(nibName: "ListItemCell", bundle: nil), forCellReuseIdentifier: "ListItemCell")
        createDataSource()
        tableList.estimatedRowHeight = 60.0
        tableList.dataSource = self
        tableList.delegate = self
    }

    func createDataSource() {
        dataList.append(["title": "ios", "value": ["Tom", "John", "Moody"]])
        dataList.append(["title": "ios2", "value": ["Tom2", "John2", "Moody2", "Tom4", "John4", "Moody4"]])
        dataList.append(["title": "ios3", "value": ["Tom3", "John3", "Moody3"]])
        dataList.append(["title": "ios4", "value": ["Tom4", "John4", "Moody4"]])
        dataList.append(["title": "ios4", "value": ["Tom4", "John4", "Moody4", "Tom4", "John4", "Moody4"]])
        dataList.append(["title": "ios4", "value": ["Tom4", "John4", "Moody4", "Tom4", "John4", "Moody4", "Tom4", "John4", "Moody4"]])
    }

}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemNames = dataList[section]["value"] as? [String] else {
            return 0
        }
        return itemNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell") as! ListItemCell
        guard let itemNames = dataList[indexPath.section]["value"] as? [String] else {
            return cell
        }
        cell.setItemTitle(itemNames[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableList.frame.size.width, height: 50.0))
        view.backgroundColor = .systemGreen
        let titleLabel = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: view.frame.width, height: 50.0))
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        if let title = dataList[section]["title"] as? String {
            titleLabel.text = title
        }
        view.addSubview(titleLabel)
        return view
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
