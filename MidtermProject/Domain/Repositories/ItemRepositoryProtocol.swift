//
//  ItemRepositoryProtocol.swift
//  MidtermProject
//
//  Created by dias on 30.04.2025.
//

import Foundation
protocol ItemRepositoryProtocol {
  func fetchAll() -> [Item]
  func add(_ item: Item)
  func delete(_ item: Item)        // ← добавьте эту строку

}
