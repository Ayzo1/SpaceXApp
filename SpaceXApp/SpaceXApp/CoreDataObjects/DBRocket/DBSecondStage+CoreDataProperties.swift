//
//  DBSecondStage+CoreDataProperties.swift
//  SpaceXApp
//
//  Created by ayaz on 17.04.2022.
//
//

import Foundation
import CoreData


extension DBSecondStage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBSecondStage> {
        return NSFetchRequest<DBSecondStage>(entityName: "DBSecondStage")
    }

    @NSManaged public var burnTime: Double
    @NSManaged public var engines: Int32
    @NSManaged public var fuelAmountTons: Double
    @NSManaged public var rocket: DBRocket?

}

extension DBSecondStage : Identifiable {

}
