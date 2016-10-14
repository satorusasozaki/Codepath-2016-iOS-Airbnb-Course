//
//  ViewController.swift
//  TumblrFeed
//
//  Created by Satoru Sasozaki on 10/11/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//

import UIKit
import AFNetworking

class PhotoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    static let apiKey = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
    let url = URL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(apiKey)")
    //var photosArray: [String]?
    
    var response: AnyObject?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        getPhotos()
        tableView.rowHeight = 320
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(photosArray?.count)
        return (photosArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoTableViewCell") as! PhotoTableViewCell
        if (photosArray?.count)! > 0 {
            let urlString = photosArray?[indexPath.row]
            let url = URL(string: urlString!)
            cell.photoImageView.setImageWith(url!)
            print(urlString)
        }
        return cell
    }
    
    func getPhotos() {
        let request = URLRequest(url: url!)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate:nil,
            delegateQueue:OperationQueue.main
        )
        
        let task : URLSessionDataTask = session.dataTask(with: request,completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options:[]) as? NSDictionary {
                    response = responseDictionary.object(forKey: "response") as! NSDictionary
                    //let posts = response.object(forKey: "posts") as! [NSDictionary]
                    
                    //post[0] should return dictionary
                    
                    //look for "photos" key which will return a dictionary
                    
                    //look for original_size_url
                    
                    
                    //                    for post in posts {
//                        let photoUrl = post["image_permalink"] as! String
//                        self.photosArray!.append(photoUrl)
//                    }
//                    print(self.photosArray!.count)
                    self.tableView.reloadData()

                }
            }
        });
        task.resume()
    }
}

