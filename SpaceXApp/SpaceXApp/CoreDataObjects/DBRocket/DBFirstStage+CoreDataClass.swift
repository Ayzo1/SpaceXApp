//
//  DBFirstStage+CoreDataClass.swift
//  SpaceXApp
//
//  Created by ayaz on 17.04.2022.
//
//

import Foundation
import CoreData

@objc(DBFirstStage)
public class DBFirstStage: NSManagedObject, Decodable {
	
	required convenience public init(from decoder: Decoder) throws {
		guard let codingUserInfoContext = CodingUserInfoKey.context else {
			fatalError()
		}
		guard let context = decoder.userInfo[codingUserInfoContext] as? NSManagedObjectContext else { fatalError() }
		guard let entity = NSEntityDescription.entity(forEntityName: "DBFirstStage", in: context) else { fatalError() }

		self.init(entity: entity, insertInto: context)

		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.engines = try container.decodeIfPresent(Int32.self, forKey: .engines) ?? 0
		self.burnTime = try container.decodeIfPresent(Double.self, forKey: .burnTime) ?? 0
		self.fuelAmountTons = try container.decodeIfPresent(Double.self, forKey: .fuelAmountTons) ?? 0
		
	}
	
	enum CodingKeys: String, CodingKey {
		case engines = "engines"
		case fuelAmountTons = "fuel_amount_tons"
		case burnTime = "burn_time_sec"
	}
}
