//
//  NYTimeArticleVC.swift
//  NYT PRO
//
//  Created by Abdelrahman on 8/14/20.
//  Copyright © 2020 abdelrahman. All rights reserved.
//

import UIKit

class NYTimeArticleVC: UIViewController {
    
    var articleArray:[NYArtile] = []
    @IBOutlet weak var articleTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleTableView.accessibilityIdentifier = "table--articleTableView"
        if helper.isInternetAvailable()
        {
        self.getNYArticleApiCall()
        }
        else
        {
            helper.ShowCommomAlert(title: "Error", WithMessage: "Internet Not Available", showOnview: self)

        }


    }
    
    
    func getNYArticleApiCall(){
          
           NYTimesMostViewedAPI.nyTimesMostViewedGETAPI(section: "all-sections", period: 7, viewControler: self)
           
          
       }
       
       func reloadTableView(articleArray:[NYArtile])  {
           
           self.articleArray = articleArray
           self.articleTableView.delegate = self
           self.articleTableView.dataSource = self
           self.articleTableView.reloadData()
       }

}
extension NYTimeArticleVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let articleDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "NYTimeArticleDetailVC") as! NYTimeArticleDetailVC
        articleDetailVC.atricleModel = self.articleArray[indexPath.row]
        self.navigationController?.pushViewController(articleDetailVC, animated: true)
    }
    
    
    
}

extension NYTimeArticleVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return articleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.articleTableView.dequeueReusableCell(withIdentifier: "NYTimesTableViewCell") as! NYTimesTableViewCell
      
        
        cell.articleTitleLabel.text = articleArray[indexPath.row].title
        cell.byLabel.text = articleArray[indexPath.row].byline
       cell.dateLabel.text = articleArray[indexPath.row].published_date
        if let urlString =  articleArray[indexPath.row].imageThumbnail
        {
            cell.thumbnailImageView.sd_setImage(with:URL(string: urlString) , completed: nil)
        }
        
        
        return cell
    }
    
 
}
