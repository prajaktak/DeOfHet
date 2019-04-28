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
    @IBOutlet weak var deButton: UIButton!
    @IBOutlet weak var hetButton: UIButton!
    var allObjects:NSMutableArray =  NSMutableArray()
    var objects:NSMutableArray = NSMutableArray()
    var selectedObject:NSDictionary!
    var correctAnswer:Int = 0
    @IBOutlet var progressView: [UIView]!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.SetIntialArrayOfObjects()
        self.DisplayRandomObject()
        
        //Button layout
        self.SetButtonLayoutParameter(btn: deButton)
        self.SetButtonLayoutParameter(btn: hetButton)
    }
    
    func SetButtonLayoutParameter(btn:UIButton){
//        btn.layer.borderWidth = 1.0
//        btn.layer.borderColor = UIColor.blue.cgColor
        btn.layer.cornerRadius = 15.0
    }
    
    func resetAnswerCounter(){
        correctAnswer = 0
    }
    
    func SetIntialArrayOfObjects(){
        if let URL = Bundle.main.url(forResource: "Objects", withExtension: "plist") {
            if let ObjectsPlist = NSArray(contentsOf: URL)  {
                allObjects = NSMutableArray(array: ObjectsPlist)
            }
        }
        
        objects =  getRandomObjects()
    }
    func getRandomObjects()-> (NSMutableArray){
        return allObjects.getElements(maximumNumberOfWords)
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
    func showResult(){
        self.scoreLabel.text = "\(correctAnswer) / \(maximumNumberOfWords)"
        self.resultView.isHidden = false
    }
    
//    func ShowAlert() {
//        let alert = UIAlertController(title: "Result", message: "You did great! You solved \(correctAnswer) questions correct", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Restrat", style: .default, handler: { (action) in
//            self.resetAnswerCounter()
//            self.SetIntialArrayOfObjects()
//            self.DisplayRandomObject()
//        }))
//        alert.addAction(UIAlertAction(title: "Go to Table", style: .default, handler: {(action) in
//            self.navigationController?.popViewController(animated: true)
//        }))
//        self.present(alert, animated: true, completion: nil)
//    }
    func ShowAlert(message:String) {
        let alert = UIAlertController(title: "Oops!!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            self.UpdateObjectArrayAndUI()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func UpdateObjectArrayAndUI () {
        objects.remove(selectedObject)
        if(objects.count > 0){
            self.DisplayRandomObject()
            self.UpdateUi()
        }else{
            //self.ShowAlert()
            self.showResult()
        }
    }
    func UpdateUi() {
        for i in 0 ..< ((maximumNumberOfWords - objects.count)+1){
            
            progressView[i].backgroundColor =  UIColor.init(red: 26.0/255.0, green: 58.0/255.0, blue: 110.0/255.0, alpha: 1.0)
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
             self.UpdateObjectArrayAndUI()
        }else{
           self.ShowAlert(message: "The correct Answer was Het.")
        }
       
    }
    
    @IBAction func HetSelected(_ sender: Any) {
        if(selectedObject["IsHet"] as! Bool == true){
            correctAnswer+=1
             self.UpdateObjectArrayAndUI()
        }else{
            self.ShowAlert(message: "The correct Answer was De.")
        }
        
    }
    @IBAction func NextRound(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
}
