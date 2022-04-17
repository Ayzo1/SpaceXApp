//
//  DBHeight+CoreDataProperties.swift
//  SpaceXApp
//
//  Created by ayaz on 17.04.2022.
//
//

import Foundation
import CoreData


extension DBHeight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBHeight> {
        return NSFetchRequest<DBHeight>(entityName: "DBHeight")
    }

    @NSManaged public var feet: Double
    @NSManaged public var meters: Double
    @NSManaged public var rocket: DBRocket?

}

extension DBHeight : Identifiable {

}
