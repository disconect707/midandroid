//
//  ItemCD+CoreDataProperties.swift
//  MidtermProject
//
//  Created by dias on 30.04.2025.
//
//

import Foundation
import CoreData


extension ItemCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemCD> {
        return NSFetchRequest<ItemCD>(entityName: "ItemCD")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?

}

extension ItemCD : Identifiable {

}
