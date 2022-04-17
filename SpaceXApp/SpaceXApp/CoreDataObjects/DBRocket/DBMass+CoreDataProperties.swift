//
//  DBMass+CoreDataProperties.swift
//  SpaceXApp
//
//  Created by ayaz on 17.04.2022.
//
//

import Foundation
import CoreData


extension DBMass {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBMass> {
        return NSFetchRequest<DBMass>(entityName: "DBMass")
    }

    @NSManaged public var kg: Double
    @NSManaged public var lb: Double
    @NSManaged public var rocket: DBRocket?

}

extension DBMass : Identifiable {

}
