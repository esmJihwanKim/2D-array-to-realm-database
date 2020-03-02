//
//  ViewController.swift
//  RealmForContacts
//
//  Created by Jihwan Kim on 2020/03/01.
//  Copyright © 2020 LogicLead. All rights reserved.
//

/*
Imports data through REST and saves them in the Realm database.
Imported data is hard-coded for simulation
The contacts data is received in two-dimensional array
1. Need to be able to save Groups that have the following contacts information
2. Show the database results in multiple tableViews

Group 1:
[[James, 01012345678], [Lawson, 01024681012], [Coe, 01036912151], [Josh, 01048121416], [Chambers, 01051015202], [Ciaran, 01061218202]]

Group 2:
[[Jihwan, 01112345678], [John, 01124681012], [Chris, 01136912151], [Jo, 01148121416], [Max, 01151015202], [Jason, 01161218202]]
 
 ... and more groups
*/



import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var recruitGroups : Results<RecruitGroup>?
    var people: Results<Person>?
    
    let realm = try! Realm()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let firstRecruitGroup = RecruitGroup()
        firstRecruitGroup.title = "Australian Friends"
        importAndSaveData(contactDataArray: Data.group1, recruitGroup: firstRecruitGroup)
        
        
        let secondRecruitGroup = RecruitGroup()
        secondRecruitGroup.title = "Korean Friends"
        importAndSaveData(contactDataArray: Data.group2, recruitGroup: secondRecruitGroup)
    }
}


extension ViewController {
    
    
    func importAndSaveData(contactDataArray: [[Any]], recruitGroup: RecruitGroup) {
        
        
        
        do {
            try realm.write {
                for i in 0..<contactDataArray.count {
                    let newPerson = Person()
                    let personalInfo = contactDataArray[i]
                    newPerson.name = personalInfo[0] as? String ?? "No Value"
                    newPerson.phoneNumber = personalInfo[1] as? String ?? "No Value"
                    print(newPerson.name, newPerson.phoneNumber)
                    
                    recruitGroup.people.append(newPerson)
                    
                }
                
                
                print(recruitGroup)
                realm.add(recruitGroup)
            }
            
        } catch {
            print(error.localizedDescription)
        }

    }

}





