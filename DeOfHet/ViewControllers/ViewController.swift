//
//  ViewController.swift
//  DeOfHet
//
//  Created by Prajakta Kulkarni on 23/02/2019.
//  Copyright © 2019 Prajakta Kulkarni. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{


    @IBOutlet weak var ArticleCollectionView: UICollectionView!
    let itemsPerRow  = 3
    let cellPadding = 0
    let cellHeight:CGFloat = 50
    
    let articleArray = ["","definiet","indefiniet",
                        "de-woord","de cursus","een cursus",
                        "het-woord","het cafe","een cafe",
                        "diminutief","het rondje","een rondje",
                        "pluralis","de cafes","cafes"]
    
    
    //MARK: - Class Methods
    @IBAction func GotoNextPage(_ sender: UIButton) {
    }
    
    //MARK: - ViewController delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        ArticleCollectionView.register(EmptyCollectionViewCell.self, forCellWithReuseIdentifier: "emptyCell")
        ArticleCollectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: "TitleCell")
        ArticleCollectionView.register(ExampleCollectionViewCell.self, forCellWithReuseIdentifier: "ExampleCell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - Collection view delegates
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imgView = UIImageView(image: UIImage(named: "border"))
        
        if (indexPath.row == 0){
            let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "emptyCell", for: indexPath)as! EmptyCollectionViewCell
            imgView.frame = collectionViewCell.frame
            collectionViewCell.backgroundView?.addSubview(imgView)
            return collectionViewCell
            
        }else if(indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 6 || indexPath.row == 9 || indexPath.row == 12){
            let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "titleCell", for: indexPath)as! TitleCollectionViewCell
            collectionViewCell.titleLabel.text = articleArray[indexPath.row]
            imgView.frame = collectionViewCell.frame
            collectionViewCell.addSubview(imgView)
            return collectionViewCell
        }else {
            let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "exampleCell", for: indexPath)as! ExampleCollectionViewCell
            collectionViewCell.exampleLabel.text = articleArray[indexPath.row]
            imgView.frame = collectionViewCell.frame
            collectionViewCell.addSubview(imgView)
            return collectionViewCell
        }
        
    }
  
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize  {
        let paddingSpace =  cellPadding * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - CGFloat(paddingSpace)
        let widthPerItem = availableWidth / CGFloat(itemsPerRow)
        
        return CGSize(width: widthPerItem, height: cellHeight)
    }

}


