//
//  SuccesViewController.swift
//  QRReaderDemo
//
//  Created by Arun Kumar Nama on 21/9/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class SuccesViewController: UIViewController {

    var qrcodeData : Dictionary<String, Any> = [:];
    
    @IBOutlet weak var IDImage: UIImageView!
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var IDValue: UILabel!
    
    @IBOutlet weak var expDateValue: UILabel!
    
    @IBOutlet weak var type: UILabel!
    
    override func viewDidLoad() {
        
        print(self.qrcodeData);
        super.viewDidLoad();
        
        self.name.text=self.qrcodeData["name"] as? String
        self.IDValue.text=self.qrcodeData["id"] as? String
        self.expDateValue.text=self.qrcodeData["expDate"] as? String
        
            self.type.text=self.qrcodeData["type"] as? String
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func saveBase64StringToPDF(_ base64String: String) {
        
        guard
            var documentsURL = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last,
            let convertedData = Data(base64Encoded: base64String)
            else {
                //handle error when getting documents URL
                return
        }
        
        //name your file however you prefer
        documentsURL.appendPathComponent("yourFileName.pdf")
        
        do {
            try convertedData.write(to: documentsURL)
        } catch {
            //handle write error here
        }
        
        if let pdf = Bundle.main.url(forResource: "Filename", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
           // webView.loadRequest(req as URLRequest)
        }
        //if you want to get a quick output of where your
        //file was saved from the simulator on your machine
        //just print the documentsURL and go there in Finder
        print(documentsURL)
    }
}
