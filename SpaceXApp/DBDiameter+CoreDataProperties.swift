//
//  DBDiameter+CoreDataProperties.swift
//  SpaceXApp
//
//  Created by ayaz on 17.04.2022.
//
//

import Foundation
import CoreData


extension DBDiameter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBDiameter> {
        return NSFetchRequest<DBDiameter>(entityName: "DBDiameter")
    }

    @NSManaged public var meters: Double
    @NSManaged public var feet: Double
    @NSManaged public var rocket: DBRocket?

}

extension DBDiameter : Identifiable {

}
