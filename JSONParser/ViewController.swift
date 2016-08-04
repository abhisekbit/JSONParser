//
//  ViewController.swift
//  JSONParser
//
//  Created by Abhisek Das on 04/08/16.
//  Copyright © 2016 Abhisek Das. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ParseJsonFromFile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func ParseJsonFromFile() {
        
        if let path = NSBundle.mainBundle().pathForResource("AgendaJson", ofType: "json")
        {
            
            //Get Raw JsonData
            do {
                let jsonData = try NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
                //print (jsonData)
                
                let parsedJsonResult : AnyObject!
                
                do {
                parsedJsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)
                    
                    //print(parsedJsonResult)
                    let DayDictionary = parsedJsonResult["Day"] as? [[String:AnyObject]]
                    
                    print(DayDictionary!.count)
                    
                    let EventArray = DayDictionary![0]["Event"] as? [[String:AnyObject]]
                    
                    print(EventArray![2])
                    
                    let Objective = EventArray![2]["Objective"] as? String
                    
                    print(Objective!)
                    
                    
                    
                    
                }
                catch {
                    print("Error in Parsing JSON Data")
                }
                
                
                
            }
            catch {
                print("Error in getting JSON Data")
            }
            
            
            
            
            
        }
    }
    


}

