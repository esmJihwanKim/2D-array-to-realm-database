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

group1: [["James", "01012345678"], ["Lawson", "01024681012"], ["Coe", "01036912151"],
["Josh", "01048121416"], ["Chambers", "01051015202"], ["Ciaran", "01061218202"]]
 
group2: [["Jihwan", "01112345678"], ["John", "01124681012"], ["Chris", "01136912151"],
["Jo", "01148121416"], ["Kevin", "01151015202"], ["Kelly", "01161218202"]]
 
 
*/



import UIKit
import RealmSwift

class MainVC: UIViewController {
    
    var recruitGroups : Results<RecruitGroup>?
    let realm = try! Realm()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        load()
    }

    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let firstRecruitGroup = RecruitGroup()
        firstRecruitGroup.title = "Australian Friends"
        importAndSaveData(contactDataArray: Data.group1, newRecruitGroup: firstRecruitGroup)
        
        
        let secondRecruitGroup = RecruitGroup()
        secondRecruitGroup.title = "Korean Friends"
        importAndSaveData(contactDataArray: Data.group2, newRecruitGroup: secondRecruitGroup)
    }
}


extension MainVC {
    
    func load() {
        recruitGroups = realm.objects(RecruitGroup.self)
    }
    
    func importAndSaveData(contactDataArray: [[Any]], newRecruitGroup: RecruitGroup) {
        do {
            try realm.write {
                
                for i in 0..<contactDataArray.count {
                    let newPerson = Person()
                    let personalInfo = contactDataArray[i]
                    newPerson.name = personalInfo[0] as? String ?? "No Value"
                    newPerson.phoneNumber = personalInfo[1] as? String ?? "No Value"
                    newRecruitGroup.people.append(newPerson)
                }
                
                
                for i in 0..<recruitGroups!.count{
                    if recruitGroups![i].title == newRecruitGroup.title {
                        //same title exists, abandon
                        print("The same form exists")
                        return
                    }
                }
                
                
                realm.add(newRecruitGroup)
                print("Added :: -----------------")
                print(newRecruitGroup)
                print("--------------------------")
                
            }
            
        } catch {
            print(error.localizedDescription)
        }

    }

}





