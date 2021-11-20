//
//  ViewController.swift
//  AlamofireRequests
//
//  Created by Oscar David Myerston Vega on 20/11/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func getRequestAction(_ sender: Any) {
    var sURL: String!
    sURL = "https://httpbin.org/get"
    let serializer = DataResponseSerializer(emptyResponseCodes: Set([200,204,205]))
    var sampleRequest = URLRequest(url: URL(string: sURL)!)
    AF.request(sampleRequest).uploadProgress { progress in
      
    }.response(responseSerializer: serializer) { response in
      if (response.error == nil) {
        var responseString: String!
        responseString = ""
        if (response.data != nil) {
          responseString = String(bytes: response.data!, encoding: .utf8)
        } else {
          responseString = response.response?.description
        }
        print(responseString ?? "")
        print(response.response?.statusCode)
        var responseData: NSData!
        responseData = response.data! as NSData
        var iDataLength = responseData.length
        print("Size: \(iDataLength) Bytes")
        print("Response Time: \(response.metrics?.taskInterval.duration ?? 00)")
      }
    }
    
  }
}

