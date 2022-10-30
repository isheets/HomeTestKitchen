//
//  RecipeDetails.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 10/9/22.
//

import SwiftUI

import ComposableArchitecture
import Foundation
import SwiftUI

enum RecipeDetail {

  enum Action: Equatable {
    case didTapEdit
  }

  static let reducer = Reducer<
    Recipe,
    RecipeDetail.Action,
    Void
  > { state, action, environment in
    .none
  }
}

struct RecipeDetailView: View {
  let store: Store<Recipe, RecipeDetail.Action>

  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      NavigationView {
        VStack {
          Text(viewStore.id)
          Text(viewStore.created.description)
        }
      }
      .navigationTitle(viewStore.title)
      .navigationViewStyle(.columns)
    }
  }
}

struct RecipeDetailView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeDetailView(store: .init(
      initialState: .init(id: "id", created: .now, title: "Soooup"),
      reducer: .empty,
      environment: RecipeDetail.reducer
    ))
  }
}
