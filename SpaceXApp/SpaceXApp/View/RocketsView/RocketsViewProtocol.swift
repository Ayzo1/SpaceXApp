import Foundation

protocol RocketsViewProtocol: AnyObject {
	
	func updateValues()
	func reloadCollectionViewCell(indexPaths: [IndexPath])
}
