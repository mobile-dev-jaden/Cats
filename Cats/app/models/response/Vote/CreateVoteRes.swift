//
//  CreateVoteRes.swift
//  Cats
//
//  Created by 김태호 on 2022/07/22.
//

import Foundation

struct CreateVoteRes: Codable, Identifiable {
    let message: String
    let id: Int
}
