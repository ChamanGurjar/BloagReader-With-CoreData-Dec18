//
//  ViewController.swift
//  BolgReaderWithCoreData
//
//  Created by Chaman Gurjar on 27/12/18.
//  Copyright © 2018 Chaman Gurjar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private lazy var context = appDelegate.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        saveDataInCoreData()
    }
    
    private func saveDataInCoreData() {
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("Chaman", forKey: "username")
        newUser.setValue("12345", forKey: "password")
        newUser.setValue(25, forKey: "age")
        
        do {
            try context.save()
            print("Saved")
        } catch  {
            print("Error in saving data in core data")
        }
    }
    
    
}

