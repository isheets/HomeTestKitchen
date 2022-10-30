//
//  Recipe.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 10/9/22.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct RecipeCellView: View {
  let title: String

  var body: some View {
    HStack {
      Text(self.title)
        .padding(.all, 8)
    }
  }
}
