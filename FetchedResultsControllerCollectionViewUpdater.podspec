Pod::Spec.new do |s|
  s.name             = 'FetchedResultsControllerCollectionViewUpdater'
  s.version          = '0.1.0'
  s.summary          = 'Painless UICollectionView updating from NSFetchedResultsController'

  s.description      = <<-DESC
    A simple way to deal with the abcense of beginUpdates() and endUpdates() methods in UICollectionView.
    Provides an implementation of NSFetchedResultsControllerDelegate for updating UICollectionView contents.
                       DESC

  s.homepage         = 'https://github.com/agarmash/FetchedResultsControllerCollectionViewUpdater'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Artem Garmash' => 'a.garmash.dev@gmail.com' }
  s.source           = { :git => 'https://github.com/agarmash/FetchedResultsControllerCollectionViewUpdater.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/agarmash_'

  s.ios.deployment_target = '8.0'
  s.swift_versions = '5.0'

  s.source_files = 'FetchedResultsControllerCollectionViewUpdater/Classes/**/*'
  s.frameworks = 'UIKit', 'CoreData'
end
