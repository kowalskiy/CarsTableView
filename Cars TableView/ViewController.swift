//
//  ViewController.swift
//  Cars TableView
//
//  Created by Kacper Kowalski on 03.07.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

@IBOutlet weak var tableView: UITableView!
    
    let myDataArray: [String] = ["First Row", "Second Row", "Third Row", "Fourth Row", "Fifth Row"]
    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red, UIColor.brown]
    let cellReuseIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    tableView.delegate = self
    tableView.dataSource = self

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CarDetailsCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CarDetailsCell
        
        cell.brandLabel.text = self.myDataArray[indexPath.row]
        cell.ImageView?.backgroundColor = self.colors[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped cell number \(indexPath.row).")
    }

}


