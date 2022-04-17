//
//  DBLaunch+CoreDataProperties.swift
//  SpaceXApp
//
//  Created by ayaz on 17.04.2022.
//
//

import Foundation
import CoreData


extension DBLaunch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBLaunch> {
        return NSFetchRequest<DBLaunch>(entityName: "DBLaunch")
    }

    @NSManaged public var rocket: String?
    @NSManaged public var success: Bool
    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var date: String?

}

extension DBLaunch : Identifiable {

}
