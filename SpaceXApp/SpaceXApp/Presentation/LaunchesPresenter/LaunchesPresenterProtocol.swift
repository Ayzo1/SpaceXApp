import Foundation

protocol LaunchesPresenterProtocol {
	
	var view: LaunchesViewProtocol? { get set }
	func getLaunchDescription(for index: Int) -> (name: String, date: String, isSuccess: Bool)
	func getLaunchesCount() -> Int 
}
