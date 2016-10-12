//
//  ViewController.swift
//  TumblrFeed
//
//  Created by Satoru Sasozaki on 10/11/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let printResponse: (NSDictionary) -> (Void) = { response in
            print(response)
        }
        APIManager.get(closure: printResponse)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

