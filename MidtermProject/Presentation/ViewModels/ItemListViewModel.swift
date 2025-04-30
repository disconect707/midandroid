//
//  ItemListViewModel.swift
//  MidtermProject
//
//  Created by dias on 30.04.2025.
//

import Foundation
import Combine

final class ItemListViewModel: ObservableObject {
  @Published private(set) var items: [Item] = []
  private let repo: ItemRepositoryProtocol

  init(repo: ItemRepositoryProtocol) {
    self.repo = repo
    load()
  }

  func load() {
    items = repo.fetchAll()
  }

  func add(_ item: Item) {
    repo.add(item)
    load()
  }

  func delete(_ item: Item) {
    repo.delete(item)
    load()
  }

  func remove(at offsets: IndexSet) {
    offsets
      .map { items[$0] }
      .forEach(delete)
  }
}
