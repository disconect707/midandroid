//
//  CoreDataStack.swift
//  MidtermProject
//
//  Created by dias on 30.04.2025.
//

import Foundation
import CoreData

final class CoreDataStack {
  static let shared = CoreDataStack()

  let container: NSPersistentContainer

  private init() {
    container = NSPersistentContainer(name: "MidtermModel")
    container.loadPersistentStores { store, error in
      if let e = error { fatalError("Unresolved \(e)") }
    }
  }

  var context: NSManagedObjectContext { container.viewContext }

  func save() {
    if context.hasChanges {
      try? context.save()
    }
  }
}
