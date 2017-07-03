//
//  CreateCarViewController.swift
//  Cars TableView
//
//  Created by Kacper Kowalski on 03.07.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit
import CoreData

class CreateCarViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var engineTextField: UITextField!
    @IBOutlet weak var saveContextButton: UIButton!


    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createCarObject(sender: AnyObject!) {
        
        if let name = brandTextField.text , name != "" {

            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Car", in: context)!
            let car = Car(entity: entity, insertInto: context)
        
        car.brand = name
        car.model = modelTextField.text
            
        context.insert(car)
            
            do {
                try context.save()
            } catch {
                print("could not save movie!")
            }
            
            self.navigationController?.popViewController(animated: true)
        }
    }

}

