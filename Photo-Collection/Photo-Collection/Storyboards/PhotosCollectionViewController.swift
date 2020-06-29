//
//  PhotosCollectionViewController.swift
//  Photo-Collection
//
//  Created by Jeff Kang on 6/27/20.
//  Copyright © 2020 Jeff Kang. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    
    let themeHelper = ThemeHelper()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        themePreference == "Dark" ? (collectionView.backgroundColor = .darkGray) : (collectionView.backgroundColor = .lightGray)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "SelectThemeSegue":
            if let destinationVC = segue.destination as? ThemeSelectionViewController {
                destinationVC.themeHelper = themeHelper
            }
        case "ViewPhotoDetailSegue":
            if let destinationVC = segue.destination as? PhotoDetailViewController {
                if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                    destinationVC.themeHelper = themeHelper
                    destinationVC.photoController = photoController
                    destinationVC.photo = photoController.photos[indexPath.item]
                }
            }
        case "AddPhotoDetailSegue":
            if let destinationVC = segue.destination as? PhotoDetailViewController {
                destinationVC.themeHelper = themeHelper
                destinationVC.photoController = photoController
            }
        default:
            return
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { fatalError("Cell is not a PhotoCollectionViewCell") }
        
        let photo = photoController.photos[indexPath.row]
        cell.photo = photo
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
