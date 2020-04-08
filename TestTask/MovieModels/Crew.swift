//
//  Crew.swift
//  TestTask
//
//  Created by Javelink on 4/8/20.
//  Copyright © 2020 Javelink. All rights reserved.
//

import Foundation

struct Crew: Codable {
    let creditID, department: String
    let gender, id: Int
    let job, name: String
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case creditID = "credit_id"
        case department, gender, id, job, name
        case profilePath = "profile_path"
    }
}
