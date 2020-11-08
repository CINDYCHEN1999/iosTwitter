//
//  TweetViewController.swift
//  Twitter
//
//  Created by Cindy on 11/8/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tvTweet: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tvTweet.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bbCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func bbTweet(_ sender: Any) {
        if (!tvTweet.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tvTweet.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("error posting \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
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

}
