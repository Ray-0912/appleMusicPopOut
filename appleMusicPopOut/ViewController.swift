//
//  ViewController.swift
//  appleMusicPopOut
//
//  Created by ShengJung on 2019/9/27.
//  Copyright © 2019 ShengJung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var popOutBtn: UIButton!
    @IBOutlet weak var tabbarBtn: UITabBarItem!
    
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popOut")
    
    var tableView: UITableView!
    
    var downButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initTableView()
        initDownButton()
        initButton()
        initLunchView()
    }


    func initButton() {
        
        
        popOutBtn.layer.cornerRadius = 0.5 * popOutBtn.bounds.size.width
        popOutBtn.clipsToBounds = true
//        popOutBtn.setImage(UIImage(named:"thumbsUp.png"), for: .normal)
//        popOutBtn.setTitle("", for: UIControl.State.normal)
        
        popOutBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchDown)
        view.addSubview(popOutBtn)
    }
    
    @objc func buttonTapped(sender: UIButton) {
        playAnimation()
    }
    
    func initLunchView() {
        let lunchView = vc.view
        lunchView?.frame = CGRect(x: 0, y: 2 * view.frame.height - 100 , width: view.frame.width, height: view.frame.height - 100)
        lunchView?.layer.cornerRadius = 10.0
        lunchView?.layer.masksToBounds = true
        view.addSubview(lunchView!)
    }
    
    func playAnimation() {
        let lunchView = vc.view
        UIView.animate(withDuration: 0.5) {
            self.adjustTableView()
            self.downButton.alpha = 1
            lunchView?.frame = CGRect(x: 0, y: 80, width: self.view.frame.width, height: self.view.frame.height - 80)
        }
        self.tableView.frame = CGRect(x: 10, y: 32, width: self.view.frame.width - 20, height: self.view.frame.height - 32)
        
//        self.tabBarController?.tabBar.alpha = 0
//        self.tableView.contentInsetAdjustmentBehavior = .never
    }
    
    func initTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 80))
        tableView.center = view.center
        view.addSubview(tableView)
    }
    
    func adjustTableView() {
        self.view.backgroundColor = .darkGray
        self.tableView.backgroundColor = UIColor.lightText
        self.tableView.layer.cornerRadius = 10.0
        self.tableView.layer.masksToBounds = true
    }
    
    public func getToOriginalView() {
        let lunchView = vc.view
        UIView.animate(withDuration: 0.5) {
        self.viewGetBack()
        lunchView?.frame = CGRect(x: 0, y: 2 * self.view.frame.height - 100 , width: self.view.frame.width, height: self.view.frame.height - 100)
        self.tableView.frame = CGRect(x: 0, y: 0, width:  self.view.frame.width, height: self.view.frame.height)
        self.downButton.alpha = 0
        // 显示tab bar
        self.tabBarController?.tabBar.alpha = 1
        }
    }
    
    func viewGetBack() {
        self.view.backgroundColor = .white
        self.tableView.backgroundColor = .white
        self.tableView.layer.cornerRadius = 0
        self.tableView.layer.masksToBounds = true
    }
    
    func initDownButton() {
        downButton = UIButton(frame: CGRect(x: (self.view.frame.width - 30) / 2, y: 60, width: 30, height: 20))
        downButton.setImage(UIImage(named: "3"), for: .normal)
        downButton.addTarget(self, action: #selector(downButtonTapped(sender:)), for: .touchDown)
        downButton.alpha = 0
        view.addSubview(downButton)
    }
    
    @objc func downButtonTapped(sender: UIButton) {
        getToOriginalView()
    }
}

