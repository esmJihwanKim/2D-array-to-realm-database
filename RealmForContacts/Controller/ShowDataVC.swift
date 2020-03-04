//
//  ShowDataVC.swift
//  RealmForContacts
//
//  Created by Jihwan Kim on 2020/03/02.
//  Copyright © 2020 LogicLead. All rights reserved.
//

import UIKit
import RealmSwift

class ShowDataVC: UIViewController {
   
    let realm = try! Realm()
    var recruitGroups : Results<RecruitGroup>?
    
    
    @IBOutlet weak var contactsTV: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTV.delegate = self
        contactsTV.dataSource = self
        
        let detailsNib = UINib(nibName: "DetailsTableViewCell", bundle: nil)
        contactsTV.register(detailsNib, forCellReuseIdentifier: "DetailsTableViewCell")
        load()
    }
    
    func load() {
        recruitGroups = realm.objects(RecruitGroup.self)
        contactsTV.reloadData()
    }
    
}


extension ShowDataVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recruitGroups?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell") as! DetailsTableViewCell
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator

        if let recruitGroup = recruitGroups?[indexPath.row] {
            cell.titleLabel.text = recruitGroup.title
            cell.descriptionLabel.text = "\(recruitGroup.people[0].name), \(recruitGroup.people[1].name), \(recruitGroup.people[2].name) \n and \(recruitGroup.people.count - 3) others applied"
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
}
