//
//  DetailViewController.swift
//  CellTest
//
//  Created by JUN? on 2021/04/25.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgView:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var cellLabel:UILabel!
    
    
    var cellInfo:CellInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let cellInfo = self.cellInfo {
            imgView.image = cellInfo.image
            nameLabel.text = cellInfo.name
            cellLabel.text = "\(cellInfo.cell)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
