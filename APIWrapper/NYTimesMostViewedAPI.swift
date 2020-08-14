//
//  NYTimesMostViewedAPI.swift
//  NYT PRO
//
//  Created by Abdelrahman on 8/14/20.
//  Copyright © 2020 abdelrahman. All rights reserved.
//

import Foundation
import MBProgressHUD


class NYTimesMostViewedAPI {

    class func nyTimesMostViewedGETAPI(section:String,period:Int,viewControler:NYTimeArticleVC) {
        
        let strURL = Constant.ApiPath.baseUrl+"\(section)/\(period).json?api-key=\(Constant.ApiKey.apiKey)"
        
        let hud = MBProgressHUD.showAdded(to: viewControler.view, animated: true);
         var  articleArray:[NYArtile] = []
        
        APIWrapper.requestGETURL(strURL, success: {
            (JSONResponse) -> Void in
            hud.hide(animated: true)
            
            print(JSONResponse)
            let status = JSONResponse["status"]
            if status == "OK"
            {
                
                
               
                for dictJSON in JSONResponse["results"].arrayValue {
                    
 
                   let articleModel = NYArtile(json: dictJSON )
                    
                    articleArray.append(articleModel)
                    
                   

                }
                
                DispatchQueue.main.async {
                    
                viewControler.reloadTableView(articleArray:articleArray)
                }
                
            }
                
            
            
            else {
                //helper.ShowCommomAlert(title: "Error".localized, WithMessage: "ExceptionMsg".localized, showOnview: viewController)
                
            }
            
            
        }) {
            (error) -> Void in
             hud.hide(animated: true)
            helper.ShowCommomAlert(title: "Error", WithMessage: error.localizedDescription, showOnview: viewControler)
        }
     
    }

    
   
}
