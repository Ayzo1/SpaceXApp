//
//  DBRocket+CoreDataProperties.swift
//  SpaceXApp
//
//  Created by ayaz on 17.04.2022.
//
//

import Foundation
import CoreData


extension DBRocket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBRocket> {
        return NSFetchRequest<DBRocket>(entityName: "DBRocket")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var launchCost: Int32
    @NSManaged public var firstFlight: String?
    @NSManaged public var country: String?
    @NSManaged public var mass: DBMass?
    @NSManaged public var height: DBHeight?
    @NSManaged public var firstStage: DBFirstStage?
    @NSManaged public var payloads: NSSet?
    @NSManaged public var secondStage: DBSecondStage?
    @NSManaged public var diameter: DBDiameter?
	@NSManaged public var images: [String]?

}

// MARK: Generated accessors for payloads
extension DBRocket {

    @objc(addPayloadsObject:)
    @NSManaged public func addToPayloads(_ value: DBPayload)

    @objc(removePayloadsObject:)
    @NSManaged public func removeFromPayloads(_ value: DBPayload)

    @objc(addPayloads:)
    @NSManaged public func addToPayloads(_ values: NSSet)

    @objc(removePayloads:)
    @NSManaged public func removeFromPayloads(_ values: NSSet)

}

extension DBRocket : Identifiable {

}
