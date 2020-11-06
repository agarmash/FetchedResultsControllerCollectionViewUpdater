# FetchedResultsControllerCollectionViewUpdater

[![CI Status](https://img.shields.io/travis/Artem Garmash/FetchedResultsControllerCollectionViewUpdater.svg?style=flat)](https://travis-ci.org/Artem Garmash/FetchedResultsControllerCollectionViewUpdater)
[![Version](https://img.shields.io/cocoapods/v/FetchedResultsControllerCollectionViewUpdater.svg?style=flat)](https://cocoapods.org/pods/FetchedResultsControllerCollectionViewUpdater)
[![License](https://img.shields.io/cocoapods/l/FetchedResultsControllerCollectionViewUpdater.svg?style=flat)](https://cocoapods.org/pods/FetchedResultsControllerCollectionViewUpdater)
[![Platform](https://img.shields.io/cocoapods/p/FetchedResultsControllerCollectionViewUpdater.svg?style=flat)](https://cocoapods.org/pods/FetchedResultsControllerCollectionViewUpdater)


## Description

A simple way to deal with the abcense of beginUpdates() and endUpdates() methods in UICollectionView.
Provides an implementation of NSFetchedResultsControllerDelegate for updating UICollectionView contents.

## Usage example

```swift
@IBOutlet weak var collectionView: UICollectionView!

lazy var collectionUpdaterDelegate: CollectionViewUpdaterDelegate = {
    let delegate = CollectionViewUpdaterDelegate(collectionView: collectionView)

    // Optionally add section name modifier
    delegate.sectionIndexTitleForSectionName = { sectionName in
        sectionName.uppercased()
    }

    return delegate
}()

lazy var fetchedResultsController: NSFetchedResultsController<NSManagedObject> = {
    let frc: NSFetchedResultsController<NSManagedObject>

    // FRC init and setup

    frc.delegate = collectionUpdaterDelegate
    return frc
}()

override func viewDidLoad() {
    do {
        try fetchedResultsController.performFetch()
    } catch {
        handleError(error)
    }
}
```

## Installation

FetchedResultsControllerCollectionViewUpdater is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FetchedResultsControllerCollectionViewUpdater'
```

## Author

Artem Garmash, a.garmash.dev@gmail.com

## License

FetchedResultsControllerCollectionViewUpdater is available under the MIT license. See the LICENSE file for more info.
