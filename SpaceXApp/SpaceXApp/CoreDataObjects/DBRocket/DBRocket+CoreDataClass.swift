//
//  DBRocket+CoreDataClass.swift
//  SpaceXApp
//
//  Created by ayaz on 17.04.2022.
//
//

import Foundation
import CoreData

@objc(DBRocket)
public class DBRocket: NSManagedObject, Decodable {
	
	required convenience public init(from decoder: Decoder) throws {
		guard let codingUserInfoContext = CodingUserInfoKey.context else {
			fatalError()
		}
		guard let context = decoder.userInfo[codingUserInfoContext] as? NSManagedObjectContext else { fatalError() }
		guard let entity = NSEntityDescription.entity(forEntityName: "DBRocket", in: context) else { fatalError() }

		self.init(entity: entity, insertInto: context)

		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(String.self, forKey: .id)
		self.name = try container.decodeIfPresent(String.self, forKey: .name)
		self.country = try container.decodeIfPresent(String.self, forKey: .country)
		self.firstFlight = try container.decodeIfPresent(String.self, forKey: .firstFlight)
		self.launchCost = try container.decodeIfPresent(Int32.self, forKey: .launchCost) ?? 0
		self.diameter = try container.decodeIfPresent(DBDiameter.self, forKey: .diameter)
		self.height = try container.decodeIfPresent(DBHeight.self, forKey: .height)
		self.mass = try container.decodeIfPresent(DBMass.self, forKey: .mass) 
		self.payloads = NSSet(array: try (container.decodeIfPresent([DBPayload].self, forKey: .payloads) ?? [DBPayload]()))
		self.firstStage = try container.decodeIfPresent(DBFirstStage.self, forKey: .firstStage)
		self.secondStage = try container.decodeIfPresent(DBSecondStage.self, forKey: .secondStage)
		self.images = try container.decodeIfPresent([String].self, forKey: .images)
	}
	
	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case height = "height"
		case diameter = "diameter"
		case mass = "mass"
		case firstStage = "first_stage"
		case secondStage = "second_stage"
		case payloads = "payload_weights"
		case launchCost = "cost_per_launch"
		case country = "country"
		case firstFlight = "first_flight"
		case images = "flickr_images"
	}
}
