import CoreData
import UIKit

/// NSFetchedResultsControllerDelegate implementation for updating UICollectionView
final public class CollectionViewUpdaterDelegate: NSObject {

    private let collectionView: UICollectionView

    private var sectionChanges = [(type: NSFetchedResultsChangeType, sectionIndex: Int)]()
    private var itemChanges = [(type: NSFetchedResultsChangeType, indexPath: IndexPath?, newIndexPath: IndexPath?)]()

    /// Returns the name for a given section.
    /// Passed to `controller(_:sectionIndexTitleForSectionName:)` when set
    public var sectionIndexTitleForSectionName: ((_ sectionName: String) -> String?)?

    public init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
}

extension CollectionViewUpdaterDelegate: NSFetchedResultsControllerDelegate {

    public func controller(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>,
        didChange sectionInfo: NSFetchedResultsSectionInfo,
        atSectionIndex sectionIndex: Int,
        for type: NSFetchedResultsChangeType
    ) {
        sectionChanges.append((type, sectionIndex))
    }

    public func controller(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>,
        didChange anObject: Any,
        at indexPath: IndexPath?,
        for type: NSFetchedResultsChangeType,
        newIndexPath: IndexPath?
    ) {
        itemChanges.append((type, indexPath, newIndexPath))
    }

    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        collectionView.performBatchUpdates({

            for change in self.sectionChanges {
                switch change.type {
                case .insert:
                    self.collectionView.insertSections([change.sectionIndex])
                case .delete:
                    self.collectionView.deleteSections([change.sectionIndex])
                default: break
                }
            }

            for change in self.itemChanges {
                switch change.type {
                case .insert:
                    self.collectionView.insertItems(at: [change.newIndexPath!])
                case .delete:
                    self.collectionView.deleteItems(at: [change.indexPath!])
                case .update:
                    self.collectionView.reloadItems(at: [change.indexPath!])
                case .move:
                    self.collectionView.deleteItems(at: [change.indexPath!])
                    self.collectionView.insertItems(at: [change.newIndexPath!])
                default:
                    break
                }
            }

            self.sectionChanges.removeAll()
            self.itemChanges.removeAll()
        })
    }

    public func controller(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>,
        sectionIndexTitleForSectionName sectionName: String
    ) -> String? {
        guard let transformer = sectionIndexTitleForSectionName else { return sectionName }
        return transformer(sectionName)
    }
}
