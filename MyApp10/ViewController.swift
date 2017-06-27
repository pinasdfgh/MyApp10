//
//  ViewController.swift
//  MyApp10
//
//  Created by user on 2017/6/27.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func getjson(_ sender: Any) {
        do{
            let url = URL(string: "http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx/")
            //            let source = try String(contentsOf: url!)
            let source = try Data(contentsOf: url!)
            parseJSON(json: source)
            print(source)
        }catch{
            print("OKOKOK")
            //處理try錯誤
            print(error)
        }
        
        
    }
    
    private func parseJSON(json:Data){
        do{
            if let jsonobj = try? JSONSerialization.jsonObject(with: json, options: .allowFragments){
                print(type(of: jsonobj))
                let arr = jsonobj as! [[String:AnyObject]]
                print(type(of: arr))
                for row in arr{
//                    print(row["animal_kind"]!)
                }
            }
            
        }catch{
            print(error)
        }
        
    }
    
    
    @IBOutlet weak var account: UITextField!
    
    @IBOutlet weak var passwd: UITextField!
    
    @IBAction func btn2(_ sender: Any) {
        do{
            let accountw = account.text
            let passwdw = passwd.text
            let urlString = "http://127.0.0.1/index.php?account=\(accountw!)&passwd=\(passwdw!)"
            let url = URL(string: urlString)
            //            let source = try String(contentsOf: url!)
            let source = try String(contentsOf: url!, encoding: String.Encoding.ascii)
            if source == "OK"{
                print("AddOK")
            }else{
                print("AddNG")
            }
            print(source)
        }catch{
            print("OKOKOK")
            //處理try錯誤
            print(error)
        }
    }
    @IBOutlet weak var img: UIImageView!
    //非文字的部分用image
    @IBAction func btn(_ sender: Any) {
        DispatchQueue.global().async{
            self.fectchImg()
        }
        
    }
    
    private func fectchImg(){
        do{
            let url = URL(string: "http://b.dryicons.com/images/icon_sets/stylistica_icons_set/png/128x128/user.png")
            if url != nil{
                let data = try Data(contentsOf: url!)
                let imgs = UIImage(data: data)
                DispatchQueue.main.async {
                    self.img.image = imgs
                }
                
            }else{
                let imgs = UIImage(named:"D.png")
                DispatchQueue.main.async {
                    self.img.image = imgs
                }
                
            }
            
        }catch{
            let imgs = UIImage(named:"D.png")
            DispatchQueue.main.async {
                self.img.image = imgs
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //若方法有加throw代表會丟出error so 只要有就要加try
        //若web是http通訊協定ios會丟出error要改要到info.plist中增加App Transport Security Settings選項 Allow Arbitrary Loads set yes
        do{
            let url = URL(string: "https://www.google.com/")
//            let source = try String(contentsOf: url!)
            let source = try String(contentsOf: url!, encoding: String.Encoding.ascii)
            print(source)
        }catch{
            print("OKOKOK")
            //處理try錯誤
            print(error)
        }
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

