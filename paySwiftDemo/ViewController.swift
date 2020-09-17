//
//  ViewController.swift
//  paySwiftDemo
//
//  Created by csk on 2020/9/17.
//  Copyright © 2020 csk. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    var table = UITableView()
//    var collection = UICollectionView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.createLabel()
        self.createButton()
        
        
        self.createTableView()
    }
    
    func createLabel() -> Void {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 20))
        label.text = "测试"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
    }
    
    func createButton() -> Void {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect.init(x: UIScreen.main.bounds.size.width/2 - 20, y: 40, width: 40, height: 30)
        button.setTitle("按钮", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = UIColor.gray
        button.tag = 10
        button.addTarget(self, action: #selector(buttonClick(button:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
    }
    
    func createTableView() -> Void {
        table = UITableView.init(frame: CGRect.init(x: 0, y: 84, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 84 - 34), style: UITableView.Style.plain)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        table.register(two.classForCoder(), forCellReuseIdentifier: "twoCell")
//        table.rowHeight = 400
        table.register(UINib.init(nibName: "first", bundle: nil), forCellReuseIdentifier: "one")
        self.view.addSubview(table)
    }

    
    
    // tableview代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }else
        {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "twoCell") as! two
                
                return cell
            }else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
                cell.textLabel?.text = String(indexPath.row)
                return cell
            }
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "one") as! first
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
         
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 2 {
                return 200
            }else
            {
                return 50
            }
        }else
        {
            return 400
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        blockWay(int1: indexPath.section,int2: indexPath.row) { (sec,row) in
            print("\(sec) -- \(row)")
        }
    }
    
    //tableview点击事件
    func blockWay(int1:Int,int2:Int,backBlock:(Int,Int) -> (Void)) -> Void {
        backBlock(int1,int2)
    }
    
    //button点击事件
    @objc func buttonClick(button:UIButton) -> Void {
        print("\(button.tag)")
    }

}

