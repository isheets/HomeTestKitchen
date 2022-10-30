//
//  Recipe.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 10/9/22.
//

import Foundation

struct Recipe: Equatable, Identifiable, Hashable {
  let id: String
  let created: Date
  var title: String
}
