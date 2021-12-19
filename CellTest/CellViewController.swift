//
//  CellViewController.swift
//  CellTest
//
//  Created by JUN? on 2021/04/25.
//

import UIKit

class CellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellInfoList:[CellInfo] = [
        CellInfo(name: "advtime", cell: 1),
        CellInfo(name: "apple", cell: 2),
        CellInfo(name: "breast", cell: 3),
        CellInfo(name: "cat", cell: 4),
        CellInfo(name: "flower", cell: 5),
        CellInfo(name: "house", cell: 6),
        CellInfo(name: "iu", cell: 7),
        CellInfo(name: "screen", cell: 8),
    ]
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let cellInfo = cellInfoList[index]
                vc?.cellInfo = cellInfo
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let cellInfo = cellInfoList[indexPath.row]
        cell.imgView.image = cellInfo.image
        cell.nameLabel.text = cellInfo.name
        cell.cellLabel.text = "\(cellInfo.cell)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("-->\(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }

}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var cellLabel:UILabel!
}

struct CellInfo {
    let name:String
    let cell:Int
    
    var image:UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name:String, cell:Int) {
        self.name = name
        self.cell = cell
    }
}
