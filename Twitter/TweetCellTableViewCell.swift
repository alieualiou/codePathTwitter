//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Mohamed Bah on 3/1/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImaheView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(_isFavorited: true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(_isFavorited: false)
            }, failure: { (Error) in
                print("Unfavorite did not succeed: \(Error)")
            })
        }
        
    }
    
    
    @IBAction func retweet(_ sender: Any) {
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    func setFavorite(_isFavorited:Bool){
        favorited = _isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for:UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named: "favor-icon"), for:UIControl.State.normal)
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
