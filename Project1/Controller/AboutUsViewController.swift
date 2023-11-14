//
//  AboutUsViewController.swift
//  Project1
//
//  Created by Cacttus Education on 6.6.23.
//

import UIKit
import WebKit

class AboutUsViewController: UIViewController {
    
    @IBOutlet weak var webKit: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTheGrilandTheGoat()
        
        // Do any additional setup after loading the view.
    }
    func loadTheGrilandTheGoat() {
        if let url = URL(string: "https://www.girlandthegoat.com/website-accessibility") {
            let request = URLRequest(url: url)
            webKit.load(request)
        }
        
        
        
        
    }
}
