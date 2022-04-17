//
//  DBPayload+CoreDataProperties.swift
//  SpaceXApp
//
//  Created by ayaz on 17.04.2022.
//
//

import Foundation
import CoreData


extension DBPayload {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBPayload> {
        return NSFetchRequest<DBPayload>(entityName: "DBPayload")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var kg: Int32
    @NSManaged public var lb: Int64
    @NSManaged public var rocket: DBRocket?

}

extension DBPayload : Identifiable {

}

