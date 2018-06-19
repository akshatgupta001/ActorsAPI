//
//  ViewController.swift
//  gitHubAPI
//
//  Created by Akshat Gupta on 18/06/18.
//  Copyright © 2018 Akshat Gupta. All rights reserved.
//

import UIKit
protocol urlDelegate {
    func didPassUrl(url: String)
}


class ViewController:  UIViewController{
    
    
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var DOB: UILabel!
    @IBOutlet weak var Height: UILabel!
    @IBOutlet weak var Country: UILabel!
    var actorURL : String!
    
    @IBOutlet weak var Spouse: UILabel!
    var search : NSDictionary?
    var actorArray: NSArray = []
    
    
    @IBAction func imgPressed(_ sender: Any) {
        
           
       
        performSegue(withIdentifier: "showImage", sender: self)
    }
    
   
    @IBAction func searchPressed(_ sender: UIButton) {
        if username.text != nil {
            downloadActors(name: username.text!)
            self.Name.text = search?.value(forKey: "name") as? String
            self.DOB.text = search?.value(forKey: "dob") as? String
            self.Height.text = search?.value(forKey: "height") as? String
            self.DOB.text = search?.value(forKey: "dob") as? String
            self.Country.text = search?.value(forKey: "country") as? String
            self.Description.text = search?.value(forKey: "description") as? String
            self.Spouse.text = search?.value(forKey: "spouse")as? String
            self.actorURL = search?.value(forKey: "image") as? String
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImage"{
            if let VC = segue.destination as? secondVC {
                VC.url = actorURL
                VC.actorName = self.Name.text
                
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let jsonobj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary{
                //print(jsonobj!.value(forKey : "actors")!)
                self.actorArray = (jsonobj!.value(forKey: "actors")! as? NSArray)!
                    
                }
                
            
            
    }.resume()
        
        
        
    }
    
    func downloadActors(name : String){
        
        
                    for actor in actorArray {
                        if let actorDict = actor as? NSDictionary {
                            if actorDict.value(forKey: "name") as? String == name {
                                self.search = actorDict
                            }
                        }
                   
            }
            
        }
        
    
    
    
    
}

