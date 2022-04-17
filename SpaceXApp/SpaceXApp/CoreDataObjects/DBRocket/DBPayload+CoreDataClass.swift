//
//  DBPayload+CoreDataClass.swift
//  SpaceXApp
//
//  Created by ayaz on 17.04.2022.
//
//

import Foundation
import CoreData

@objc(DBPayload)
public class DBPayload: NSManagedObject, Decodable {

	required convenience public init(from decoder: Decoder) throws {
		guard let codingUserInfoContext = CodingUserInfoKey.context else {
			fatalError()
		}
		guard let context = decoder.userInfo[codingUserInfoContext] as? NSManagedObjectContext else { fatalError() }
		guard let entity = NSEntityDescription.entity(forEntityName: "DBPayload", in: context) else { fatalError() }

		self.init(entity: entity, insertInto: context)

		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(String.self, forKey: .id)
		self.name = try container.decodeIfPresent(String.self, forKey: .name)
		self.kg = try container.decodeIfPresent(Int32.self, forKey: .kg) ?? 0
		self.lb = try container.decodeIfPresent(Int64.self, forKey: .lb) ?? 0
	}
	
	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case kg = "kg"
		case lb = "lb"
	}
}

extension CodingUserInfoKey {
	static let context = CodingUserInfoKey(rawValue: "context")
}
