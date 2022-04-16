import Foundation

protocol RocketsPresenterProtocol {
	
	var view: RocketsViewProtocol? { get set }
	func getRocketInfo(for index: Int) -> (firstLaunch: String, country: String, launchCost: String)
	func getFirstStageInfo(for index: Int) -> (engiensCount: String, massOfFuel: String, burnTime: String)
	func getSecondStageInfo(for index: Int) -> (engiensCount: String, massOfFuel: String, burnTime: String)
	func getImageURL(for index: Int) -> URL?
	func getPagesCount() -> Int
	func getRocketName(for index: Int) -> String
	func getRocketId(for index: Int) -> String
	func getCharacteristicsCount() -> Int
	func getCharacterictics(for rocketIndex: Int, characteristicIndex: Int) -> (value: String, name: String)
}
