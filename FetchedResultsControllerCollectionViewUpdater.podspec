#
# Be sure to run `pod lib lint FetchedResultsControllerCollectionViewUpdater.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FetchedResultsControllerCollectionViewUpdater'
  s.version          = '0.1.0'
  s.summary          = 'Painless UICollectionView updating from NSFetchedResultsController'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

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
  
  # s.resource_bundles = {
  #   'FetchedResultsControllerCollectionViewUpdater' => ['FetchedResultsControllerCollectionViewUpdater/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
