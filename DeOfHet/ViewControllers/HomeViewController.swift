//
//  HomeViewController.swift
//  DeOfHet
//
//  Created by Prajakta Kulkarni on 21/04/2019.
//  Copyright © 2019 Prajakta Kulkarni. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var leftLineView: UIView!
    @IBOutlet weak var rightLineView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        leftLineView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/7)
        rightLineView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/7)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
