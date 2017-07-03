//
//  ViewController.swift
//  Cars TableView
//
//  Created by Kacper Kowalski on 03.07.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

@IBOutlet weak var tableView: UITableView!
    
    var cars = [Car] ()
    
    let myDataArray: [String] = ["First Row", "Second Row", "Third Row", "Fourth Row", "Fifth Row"]
    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red, UIColor.brown]
    let cellReuseIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    tableView.delegate = self
    tableView.dataSource = self
        
    }
    
    func fetchAndSetResults() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Car")
        
        do {
            let results = try context.fetch(fetchRequest)
            self.cars = results as! [Car]
        }
        catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CarDetailsCell {
            
            let car = cars[indexPath.row]
            cell.configureCell(car: car)
           // cell.ImageView?.backgroundColor = self.colors[indexPath.row]

            return cell
        } else {
            
            return CarDetailsCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
    
    // remove the item from the data model
    cars.remove(at: indexPath.row)
    
    // delete the table view row
    tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
    }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped cell number \(indexPath.row).")
    }

}


