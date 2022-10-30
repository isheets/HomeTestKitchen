//
//  RecipeList.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 10/9/22.
//

import ComposableArchitecture
import Foundation
import OrderedCollections
import SwiftUI

enum RecipeList {
  struct State: Equatable {
    var recipes: OrderedDictionary<Recipe.ID, Recipe> = [:]
    var selection: Recipe.ID?

    var selectedRecipe: Recipe? {
      self.selection.flatMap { self.recipes[$0] }
    }
  }

  enum Action: Equatable {
    case addRecipeTapped
    case didTapRecipe(id: Recipe.ID?)
    case detail(RecipeDetail.Action)
  }

  struct Environment {
    let randomId: () -> String
    let now: () -> Date
  }

  static let reducer = Reducer<
    RecipeList.State,
    RecipeList.Action,
    RecipeList.Environment
  > { state, action, environment in
    switch action {
    case .addRecipeTapped:
      let id = environment.randomId()
      state.recipes.updateValue(
        Recipe(
          id: id,
          created: environment.now(),
          title: "New Recipe"
        ),
        forKey: id,
        insertingAt: 0
      )
      return .none
    case .didTapRecipe(let id):
      state.selection = id
      return .none

    case .detail(_):
      return .none
    }
  }
}

struct RecipeListView: View {
  let store: Store<RecipeList.State, RecipeList.Action>

  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      NavigationView {
        List(viewStore.recipes.values.elements) { recipe in
          NavigationLink(
            isActive: viewStore.binding(
              get: { $0.selectedRecipe == recipe },
              send: { $0 ? .didTapRecipe(id: recipe.id) : .didTapRecipe(id: nil) }
            ),
            destination: {
              IfLetStore(self.store.scope(
                state: \.selectedRecipe,
                action: RecipeList.Action.detail
              )) { RecipeDetailView(store: $0) }
            }
          ) { RecipeCellView(title: recipe.title) }
        }
        .navigationTitle("Recipes")
        .navigationBarItems(
          trailing: Button("Add") {
            viewStore.send(.addRecipeTapped, animation: .default)
          }
        )
      }
      .navigationViewStyle(.columns)
    }
  }
}

struct Previews_RecipeList_Previews: PreviewProvider {
  static var previews: some View {
    RecipeListView(
      store: Store(
        initialState: RecipeList.State(recipes: ["": .init(id: "", created: .now, title: "Old Recipe")]),
        reducer: RecipeList.reducer.debug(),
        environment: .live
      )
    )
  }
}

extension RecipeList.Environment {
  static var live: Self {
    .init(
      randomId: { UUID().uuidString },
      now: { .now }
    )
  }
}
