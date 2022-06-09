//
//  ViewController.swift
//  WKDemo
//
//  Created by tang on 3/7/22.
//

import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var myLabel: UILabel!
    let isAllowZoom: Bool = true
    
    override func loadView() {
          let webConfiguration = WKWebViewConfiguration()
          webConfiguration.allowsInlineMediaPlayback = true
          webConfiguration.allowsInlineMediaPlayback = true
          webView = WKWebView(frame: .zero, configuration: webConfiguration)
          webView.uiDelegate = self
          view = webView
      }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        let url = URL(string: "https://music.tang5618.com/")
        let url = URL(string: "https://music.tang5618.com/ipad/")
    
        let request = URLRequest(url: url!)
        //加载请求
        webView.load(request)
        webView.navigationDelegate = self
    }

    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if isAllowZoom {
            let javascript = "var meta = document.createElement('meta');meta.setAttribute('name', 'viewport');meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=10.0, user-scalable=yes');document.getElementsByTagName('head')[0].appendChild(meta);"
            webView.evaluateJavaScript(javascript, completionHandler: nil)
        } else {
            let javascript = "var meta = document.createElement('meta');meta.setAttribute('name', 'viewport');meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no');document.getElementsByTagName('head')[0].appendChild(meta);"
            webView.evaluateJavaScript(javascript, completionHandler: nil)
        }
    }

}

