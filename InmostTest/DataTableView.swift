//
//  DataTableView.swift
//  InmostTest
//
//  Created by alex-babich on 08.09.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import UIKit
import Alamofire

struct CocktailData: Decodable {
    var strDrink: String
    var strDrinkThumb: String
    var idDrink: String
}


struct Cocktails: Decodable {
  let all: [CocktailData]
  
  enum CodingKeys: String, CodingKey {
    case all = "drinks"
  }
}

class DataTableView: UITableViewController {
    
    var data: [CocktailData] = []
      
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailCell", for: indexPath) as! CocktailTableCell
        
        cell.itemText?.text = data[indexPath.row].strDrink
        cell.itemImage?.loadImge(withUrl: URL(string: data[indexPath.row].strDrinkThumb)!)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

class CocktailTableCell: UITableViewCell {
    
    @IBOutlet weak var itemText: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
}


extension DataTableView {
    func fetchData() {
            
        print("fetchData")
        
        AF.request("https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Ordinary%20Drink").validate().responseDecodable(of: Cocktails.self) { (response) in
          guard let cocktails = response.value else { return }
          self.data = cocktails.all
          self.tableView.reloadData()
        }
        
        print(data)
    }
}
