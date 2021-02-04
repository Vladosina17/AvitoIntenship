//
//  Model.swift
//  internshipAvito
//
//  Created by Влад Барченков on 22.01.2021.
//

import Foundation

struct Model: Decodable {
    var status: String
    var result: Result
}

struct Result: Decodable {
    var title: String
    var actionTitle: String
    var selectedActionTitle: String
    var list: [List]
}

struct List: Decodable  {
    var id: String
    var title: String
    var description: String?
    var icon: [String : String]
    var price: String
    var isSelected: Bool
}

