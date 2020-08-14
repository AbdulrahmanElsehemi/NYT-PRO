//
//  NYTimeArticleDetailVC.swift
//  NYT PRO
//
//  Created by Abdelrahman on 8/14/20.
//  Copyright © 2020 abdelrahman. All rights reserved.
//

import UIKit

class NYTimeArticleDetailVC: UIViewController {

    
    var atricleModel:NYArtile?
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var abstractLabel: UILabel!
    
    @IBOutlet weak var byline: UILabel!
    
    @IBOutlet weak var date: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        guard let atricleModel = self.atricleModel else {return}
        
            if let imageString = atricleModel.largeImage
            {
            imageView.sd_setShowActivityIndicatorView(true)
            imageView.sd_setIndicatorStyle(.gray)
            imageView.sd_setImage(with:URL(string: imageString) , completed: nil)
            }
        
            abstractLabel.text = atricleModel.abstract
            byline.text = atricleModel.byline
            date.text = atricleModel.published_date
    }
    



}
