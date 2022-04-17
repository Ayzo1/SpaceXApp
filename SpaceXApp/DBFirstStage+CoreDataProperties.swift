//
//  DBFirstStage+CoreDataProperties.swift
//  SpaceXApp
//
//  Created by ayaz on 17.04.2022.
//
//

import Foundation
import CoreData


extension DBFirstStage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBFirstStage> {
        return NSFetchRequest<DBFirstStage>(entityName: "DBFirstStage")
    }

    @NSManaged public var engines: Int32
    @NSManaged public var burnTime: Double
    @NSManaged public var fuelAmountTons: Double
    @NSManaged public var rocket: DBRocket?

}

extension DBFirstStage : Identifiable {

}
