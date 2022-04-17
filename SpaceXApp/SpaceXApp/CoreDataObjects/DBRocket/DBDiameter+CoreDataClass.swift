//
//  DBDiameter+CoreDataClass.swift
//  SpaceXApp
//
//  Created by ayaz on 17.04.2022.
//
//

import Foundation
import CoreData

@objc(DBDiameter)
public class DBDiameter: NSManagedObject, Decodable {
	
	required convenience public init(from decoder: Decoder) throws {
		guard let codingUserInfoContext = CodingUserInfoKey.context else {
			fatalError()
		}
		guard let context = decoder.userInfo[codingUserInfoContext] as? NSManagedObjectContext else { fatalError() }
		guard let entity = NSEntityDescription.entity(forEntityName: "DBDiameter", in: context) else { fatalError() }

		self.init(entity: entity, insertInto: context)

		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.meters = try container.decodeIfPresent(Double.self, forKey: .meters) ?? 0
		self.feet = try container.decodeIfPresent(Double.self, forKey: .feet) ?? 0
		
	}
	
	enum CodingKeys: String, CodingKey {
		case meters = "meters"
		case feet = "feet"
	}
}
