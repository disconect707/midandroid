//
//  DIContainer.swift
//  MidtermProject
//
//  Created by dias on 30.04.2025.
//

import SwiftUI   // ваш модуль с ItemRepository

enum DI {
  static func makeItemListVM() -> ItemListViewModel {
    let repository = ItemRepository()
    return ItemListViewModel(repo: repository)
  }
}
