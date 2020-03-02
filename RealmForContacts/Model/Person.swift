//
//  Person.swift
//  RealmForContacts
//
//  Created by Jihwan Kim on 2020/03/01.
//  Copyright © 2020 LogicLead. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var phoneNumber: String = ""
    
    var parentCategory = LinkingObjects(fromType: RecruitGroup.self, property: "people")

}
