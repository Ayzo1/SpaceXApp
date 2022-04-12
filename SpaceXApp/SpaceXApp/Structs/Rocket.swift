import Foundation

struct Rocket: Codable {
	
	let id: String
	let name: String
	let height: Height
	let diameter: Diameter
	let mass: Mass
	let first_stage: Stage
	let second_stage: Stage
	let payload_weights: [PayloadsWeights]
	let cost_per_launch: Int
	let first_flight: String
	let country: String
	let flickr_images: [String]
}

struct PayloadsWeights: Codable {
	let id: String
	let name: String
	let kg: Int
	let lb: Int
}

struct Stage: Codable {
	let engines: Int
	let fuel_amount_tons: Double
	let burn_time_sec: Double?
}

struct Height: Codable {
	
	let meters: Double
	let feet: Double
}

struct Diameter: Codable {
	
	let meters: Double
	let feet: Double
}

struct Mass: Codable {
	
	let kg: Double
	let lb: Double
}
