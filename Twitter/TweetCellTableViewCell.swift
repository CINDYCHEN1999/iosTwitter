//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Cindy on 11/2/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    var favorited: Bool = false

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var btRetweet: UIButton!
    
    @IBOutlet weak var btFav0: UIButton!
    
    var tweetID:Int = -1
    

    
    @IBAction func btFav0Act(_ sender: Any) {
        let result = !favorited
        if (result){
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {
                self.setFav(true)
            }, failure: { (error) in
                print("cannot fav: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {
                self.setFav(false)
            }, failure: { (error) in
                print("cannot unfav: \(error)")
            })
        }
    }
    
    func setFav(_ faved: Bool) {
        favorited = faved
        if (favorited) {
            btFav0.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            btFav0.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func btRetweetAct(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetID: tweetID, success: {
            self.setRe(true)
            
        }, failure: { (error) in
            print("cannot retweet \(error)")
        })
    }
    
    func setRe(_ retweeted: Bool) {
        if(retweeted) {
            btRetweet.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            btRetweet.isEnabled = false
        } else {
            btRetweet.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            btRetweet.isEnabled = true
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
