//  ItemRepository.swift
//  MidtermProject
//
//  Created by dias on 30.04.2025.
//

import Foundation
import CoreData

final class ItemRepository: ItemRepositoryProtocol {
    private let ctx = CoreDataStack.shared.context

    func fetchAll() -> [Item] {
        let req: NSFetchRequest<ItemCD> = ItemCD.fetchRequest()
        let cds = (try? ctx.fetch(req)) ?? []
        return cds.compactMap { cd in
            guard let id = cd.id, let title = cd.title else { return nil }
            return Item(id: id, title: title)
        }
    }

    func add(_ item: Item) {
        let cd = ItemCD(context: ctx)
        cd.id = item.id
        cd.title = item.title
        CoreDataStack.shared.save()
    }

    func delete(_ item: Item) {
        let req: NSFetchRequest<ItemCD> = ItemCD.fetchRequest()
        req.predicate = NSPredicate(format: "id == %@", item.id as CVarArg)
        if let cd = (try? ctx.fetch(req))?.first {
            ctx.delete(cd)
            CoreDataStack.shared.save()
        }
    }
}
