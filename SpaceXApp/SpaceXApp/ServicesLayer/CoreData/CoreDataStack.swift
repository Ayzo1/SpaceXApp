import Foundation
import CoreData

final class CoreDataStack: CoreDataStackProtocol {
	
	private var viewContext: NSManagedObjectContext {
		container.viewContext
	}
	private var backgroundContext: NSManagedObjectContext {
		container.newBackgroundContext()
	}
		
	private lazy var container: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "SpaceXDataModel")
		container.loadPersistentStores { [weak self] storeDescription, error in
			if let error = error {
				print(error.localizedDescription)
			} else {
				print(storeDescription.description)
			}
		}
		return container
	}()
	
	init() {
		
	}
	
	func fetch<T>(fetchRequest: NSFetchRequest<T>) -> [T] {
		var dbChannels = [T]()
		do {
			dbChannels = try container.viewContext.fetch(fetchRequest)
		} catch {
			print(error.localizedDescription)
		}
		return dbChannels
	}
	
	func performSave (
		_ block: @escaping (NSManagedObjectContext) -> Void,
		successSave: @escaping () -> Void) {
		let context = backgroundContext
		context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
		context.perform {
			block(context)
			if context.hasChanges {
				do {
					try self.performSave(in: context)
					successSave()
				} catch {
					print(error.localizedDescription)
				}
			}
		}
	}
	
	private func performSave (in context: NSManagedObjectContext) throws {
		try context.save()
		if let parent = context.parent {
			try performSave(in: parent)
		}
	}
}
