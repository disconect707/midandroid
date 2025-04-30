//
//  FetchItemsUseCase.swift
//  MidtermProject
//
//  Created by dias on 30.04.2025.
//

import Foundation
final class FetchItemsUseCase {
  private let repo: ItemRepositoryProtocol
  init(repo: ItemRepositoryProtocol) { self.repo = repo }
  func execute() -> [Item] { repo.fetchAll() }
}
