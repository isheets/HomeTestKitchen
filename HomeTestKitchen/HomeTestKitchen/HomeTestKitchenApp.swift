//
//  HomeTestKitchenApp.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 10/9/22.
//

import SwiftUI

@main
struct HomeTestKitchenApp: App {
  var body: some Scene {
    WindowGroup {
      RecipeListView(
        store: .init(
          initialState: .init(),
          reducer: RecipeList.reducer.debug(),
          environment: .live
        )
      )
    }
  }
}
