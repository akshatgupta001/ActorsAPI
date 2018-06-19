//
//  secondVC.swift
//  gitHubAPI
//
//  Created by Akshat Gupta on 19/06/18.
//  Copyright © 2018 Akshat Gupta. All rights reserved.
//

import UIKit

class secondVC: UIViewController {

    
    @IBOutlet weak var URLSTRING: UILabel!
    
    var url : String!
    var actorName : String!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        let urlcode = URL(string: url)
//        let data = NSData(contentsOf: urlcode!)
//        imageView.image = UIImage(data: (data as Data?)!)
            }
    
    override func viewDidAppear(_ animated: Bool) {
        URLSTRING.text = actorName
        if let imgURL = URL(string: url){
            if let data = NSData(contentsOf: imgURL){
                imageView.image = UIImage(data: data as Data)
            }
        }
    }

  
    
    @IBAction func backpressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
