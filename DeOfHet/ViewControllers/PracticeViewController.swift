//
//  PracticeViewController.swift
//  DeOfHet
//
//  Created by Prajakta Kulkarni on 23/02/2019.
//  Copyright © 2019 Prajakta Kulkarni. All rights reserved.
//

import UIKit

class PracticeViewController: UIViewController {

    @IBOutlet weak var objectImageView: UIImageView!
    @IBOutlet weak var objectNameLabel: UILabel!
    var objects:NSMutableArray = NSMutableArray()
    var selectedObject:NSDictionary!
    var correctAnswer:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.SetIntialArrayOfObjects()
        self.DisplayRandomObject()
    }
    
    func SetIntialArrayOfObjects(){
        if let URL = Bundle.main.url(forResource: "Objects", withExtension: "plist") {
            if let ObjectsPlist = NSArray(contentsOf: URL)  {
                objects = NSMutableArray(array: ObjectsPlist)
            }
        }
    }
    func getRandomObject()-> (NSDictionary){
        return objects[Int.random(in: 0..<objects.count)] as! NSDictionary
    }
    
    func DisplayRandomObject(){
        let Object =  getRandomObject()
        objectNameLabel.text = Object["Name"] as? String
        objectImageView.image = UIImage(named: Object["ImageLink"] as! String)
        selectedObject = Object
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Result", message: "You did great! You solved \(correctAnswer) questions correct", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restrat", style: .default, handler: { (action) in
            self.SetIntialArrayOfObjects()
            self.DisplayRandomObject()
        }))
        alert.addAction(UIAlertAction(title: "Go to Table", style: .default, handler: {(action) in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func UpdateObjectArrayAndUI () {
        objects.remove(selectedObject)
        if(objects.count > 0){
            self.DisplayRandomObject()
        }else{
            self.showAlert()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func DeSelected(_ sender: Any) {
        if(selectedObject["IsDe"] as! Bool == true){
            correctAnswer+=1
        }
        self.UpdateObjectArrayAndUI()
    }
    
    @IBAction func HetSelected(_ sender: Any) {
        if(selectedObject["IsHet"] as! Bool == true){
            correctAnswer+=1
        }
        self.UpdateObjectArrayAndUI()
    }
}
