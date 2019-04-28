//
//  ViewController.swift
//  DeOfHet
//
//  Created by Prajakta Kulkarni on 23/02/2019.
//  Copyright © 2019 Prajakta Kulkarni. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{


    @IBOutlet weak var letsPracticeButton: UIButton!
    @IBOutlet weak var ArticleCollectionView: UICollectionView!
    let itemsPerRow  = 3
    let cellPadding = 0
    let cellHeight:CGFloat = 50
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
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
        // Do any additional setup after loading the view, typically from a nib.
        ArticleCollectionView.register(UINib(nibName: "ArticleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ArticleCollectionViewCell")
        ArticleCollectionView.layer.borderWidth = 1.0
        ArticleCollectionView.layer.borderColor = UIColor.gray.cgColor
        let rows = ceilf(Float(articleArray.count / itemsPerRow))
        collectionViewHeight.constant = CGFloat(rows) * cellHeight
        
        //Button layout
//        letsPracticeButton.layer.borderWidth = 1.0
//        letsPracticeButton.layer.borderColor = UIColor.blue.cgColor
        letsPracticeButton.layer.cornerRadius = 15.0
    }
    
    //MARK: - Collection view delegates
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCollectionViewCell", for: indexPath) as! ArticleCollectionViewCell
        let cellText = articleArray[indexPath.row]
        
        if (indexPath.row == 0){
            cell.setup(aType: .empty, value: cellText)
        }else if(indexPath.row <= 3 || indexPath.row % 3 == 0){
           cell.setup(aType: .title, value: cellText)
        }else {
            cell.setup(aType: .value, value: cellText)
        }
        return cell
    }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize  {
        let paddingSpace =  cellPadding * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - CGFloat(paddingSpace)
        let widthPerItem = availableWidth / CGFloat(itemsPerRow)
        
        return CGSize(width: widthPerItem, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

