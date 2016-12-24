//
//  ViewController.swift
//  RecoveryAttempt
//
//  Created by Student on 2016-12-19.
//  Copyright © 2016 SFDCI. All rights reserved.
//

import UIKit

class ArtworkViewController: UIViewController {
    
    let images = ImageReader()
    
    //Create types of collectionViews
    
    @IBOutlet weak var warCollectionView: UICollectionView!
    @IBOutlet weak var postWarCollectionView: UICollectionView!
    @IBOutlet weak var recentCollectionView: UICollectionView!
    @IBOutlet weak var propagandaCollectionView: UICollectionView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "old paper")!)
        
        warCollectionView.backgroundColor = UIColor.clear
        postWarCollectionView.backgroundColor = UIColor.clear
        recentCollectionView.backgroundColor = UIColor.clear
        propagandaCollectionView.backgroundColor = UIColor.clear
        
        //Set layout
        let layout = UICollectionViewFlowLayout()
        //Fiddle with this
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        //Register reuseIdentifiers
        warCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "warCell")
        postWarCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "postWarCell")
        recentCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "recentCell")
        propagandaCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "propagandaCell")
        
        //Call delegate method
        warCollectionView.delegate = self
        postWarCollectionView.delegate = self
        recentCollectionView.delegate = self
        propagandaCollectionView.delegate = self
        
        //Call dataSource method
        warCollectionView.dataSource = self
        postWarCollectionView.dataSource = self
        recentCollectionView.dataSource = self
        propagandaCollectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ArtworkViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //Creates cells for each object in the array
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == warCollectionView {
            print(images.warImages.count)
            return images.warImages.count
        } else if collectionView == postWarCollectionView {
            print(images.postWarImages.count)
            return images.postWarImages.count
        } else if collectionView == recentCollectionView {
            return images.recentImages.count
        } else {
            return images.propagandaImages.count
        }
    }
    
    //Sets up and dequeue cells using reuseIdentifier
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == warCollectionView {
            let warCell = collectionView.dequeueReusableCell(withReuseIdentifier: "warCell", for: indexPath) as! ImageCollectionViewCell
            warCell.awakeFromNib()
            return warCell
        } else if collectionView == postWarCollectionView {
            let postWarCell = collectionView.dequeueReusableCell(withReuseIdentifier: "postWarCell", for: indexPath) as! ImageCollectionViewCell
            postWarCell.awakeFromNib()
            return postWarCell
        } else if collectionView == recentCollectionView {
            let recentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentCell", for: indexPath) as! ImageCollectionViewCell
            recentCell.awakeFromNib()
            return recentCell
        } else {
            let propagandaCell = collectionView.dequeueReusableCell(withReuseIdentifier: "propagandaCell", for: indexPath) as! ImageCollectionViewCell
            propagandaCell.awakeFromNib()
            return propagandaCell
        }
    }
    
    //Check this
    //Populates cells
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == warCollectionView {
            let warCell = cell as! ImageCollectionViewCell
            warCell.collectionImageView.image = UIImage(named: images.warImages[indexPath.row].name)
        } else if collectionView == postWarCollectionView {
            let postWarCell = cell as! ImageCollectionViewCell
            postWarCell.collectionImageView.image = UIImage(named: images.postWarImages[indexPath.row].name)
        } else if collectionView == recentCollectionView {
            let recentCell = cell as! ImageCollectionViewCell
            recentCell.collectionImageView.image = UIImage(named: images.recentImages[indexPath.row].name)
        } else {
            let propagandaCell = cell as! ImageCollectionViewCell
            propagandaCell.collectionImageView.image = UIImage(named: images.propagandaImages[indexPath.row].name)
        }
    }
    
    //Sets size of cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
    
    //Segues
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == warCollectionView {
            
            self.performSegue(withIdentifier: "WarImageSegue", sender: nil)
            
            //Push information to FullImageView
            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "WarImageSegue" {
                    let newController = segue.destination as! FullImageView
                    newController.selectedName = images.warImages[indexPath.row].name
                    newController.selectedDate = images.warImages[indexPath.row].date
                    newController.selectedArtist = images.warImages[indexPath.row].author
                    //print(images.warImages[indexPath.row].name)
                    
                }
                
            }
            
        } else if collectionView == postWarCollectionView {
            
            self.performSegue(withIdentifier: "PostWarImageSegue", sender: nil)
            
            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "WarImageSegue" {
                    let newController = segue.destination as! FullImageView
                    newController.selectedName = images.postWarImages[indexPath.row].name
                    newController.selectedDate = images.postWarImages[indexPath.row].date
                    newController.selectedArtist = images.postWarImages[indexPath.row].author
                
                }
                
            }
            
        } else if collectionView == recentCollectionView {
            
            self.performSegue(withIdentifier: "RecentImageSegue", sender: nil)
            
            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "WarImageSegue" {
                    let newController = segue.destination as! FullImageView
                    newController.selectedName = images.recentImages[indexPath.row].name
                    newController.selectedDate = images.recentImages[indexPath.row].date
                    newController.selectedArtist = images.recentImages[indexPath.row].author
                }
                
            }
            
        } else {
            
            self.performSegue(withIdentifier: "PropagandaImageSegue", sender: nil)
            
            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "WarImageSegue" {
                    let newController = segue.destination as! FullImageView
                    newController.selectedName = images.propagandaImages[indexPath.row].name
                    newController.selectedDate = images.propagandaImages[indexPath.row].date
                    newController.selectedArtist = images.propagandaImages[indexPath.row].author
                }
                
            }
            
        }
        
    }
    
}
