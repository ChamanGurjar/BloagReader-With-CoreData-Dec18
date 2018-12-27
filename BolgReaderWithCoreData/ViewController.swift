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
        
        fetchDataFromCoreData()
    }
    
    private func saveDataInCoreData() {
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("Abhijeet", forKey: "username")
        newUser.setValue("12345", forKey: "password")
        newUser.setValue(1, forKey: "age")
        
        do {
            try context.save()
            print("Saved")
        } catch  {
            print("Error in saving data in core data")
        }
    }
    
    private func fetchDataFromCoreData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
            let results =  try context.fetch(request)
            
            if !results.isEmpty {
                for result in results as! [NSManagedObject] {
                    let userName = result.value(forKey: "username") as? String
                    print(userName ?? "No userName found for the key")
                }
            } else {
                print("No saved result found in Core Data")
            }
            
        } catch  {
            print("Error occurred when fetching data from Core Data")
        }
    }
    
    
}

