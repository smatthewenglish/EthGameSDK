import UIKit

public class EthPollingAgent {
    
    public init() {}
    
    public func hasTokenScan(addressContract: String, addressToken: String, apikey: String, completion: @escaping (Bool) -> Void) {
        let url = URL(string: "https://api.etherscan.io/api?module=account&action=tokenbalance&contractaddress=\(addressContract)&address=\(addressToken)&tag=latest&apikey=\(addressToken)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                completion(false)
                return
            }
            guard let data = data else {
                completion(false)
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(false)
                    return
                }
                //print(json)
                let resultString = json["result"]! as? String
                //print(resultString)
                if(resultString == nil){
                    completion(false)
                    return
                }
                let resultInt = Int(resultString!)
                //print(resultInt)
                if(resultInt == nil){
                    completion(false)
                    return
                }
                if(resultInt! > 0){
                    completion(true)
                    return
                }
                completion(false)
            } catch let error {
                print(error.localizedDescription)
                completion(false)
            }
        }).resume()
    }
    
}

