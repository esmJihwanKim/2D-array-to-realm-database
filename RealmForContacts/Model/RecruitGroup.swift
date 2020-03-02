//
//  RecruitGroup.swift
//  RealmForContacts
//
//  Created by Jihwan Kim on 2020/03/01.
//  Copyright © 2020 LogicLead. All rights reserved.
//

import Foundation
import RealmSwift

class RecruitGroup: Object {
    
    @objc dynamic var title: String = ""

    let people = List<Person>()
}
