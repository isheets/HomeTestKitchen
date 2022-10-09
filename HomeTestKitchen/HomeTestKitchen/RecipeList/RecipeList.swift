//
//  RecipeList.swift
//  HomeTestKitchen
//
//  Created by Isaac Sheets on 10/9/22.
//

import ComposableArchitecture
import Foundation
import SwiftUI

enum RecipeList {
  struct State: Equatable {
    var greeting: String = "Welcome to Home Test Kitchen! What's cookin good lookin?"
  }

  enum Action: Equatable {
    case buttonTapped
  }

  struct Environment {}

  static let reducer = Reducer<
    RecipeList.State,
    RecipeList.Action,
    RecipeList.Environment
  > { state, action, environment in
      .none
  }
}

struct RecipeListView: View {
  let store: Store<RecipeList.State, RecipeList.Action>

  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        Text(viewStore.greeting)
          .padding(.top, 32)
          .padding(.horizontal, 32)

        Spacer()

        Button(action: { viewStore.send(.buttonTapped) }) {
          Text("Nothing much")
        }
        .padding(.bottom, 32)
      }
    }
  }
}

struct Previews_RecipeList_Previews: PreviewProvider {
  static var previews: some View {
    RecipeListView(
      store: Store(
        initialState: RecipeList.State(),
        reducer: RecipeList.reducer,
        environment: RecipeList.Environment()
      )
    )
  }
}
