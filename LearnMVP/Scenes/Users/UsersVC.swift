//
//  ViewController.swift
//  LearnMVP
//
//  Created by Eslam on 6/4/20.
//  Copyright © 2020 Ioslam. All rights reserved.
//

import UIKit

class UsersVC: UIViewController {
    
    var userPresenter: UsersVCPresenter!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBAction func alertMenu(_ sender: UIBarButtonItem) {
        showPopup(sender)
    }
    @IBOutlet weak var usersTableView: UITableView! {
        didSet {
            usersTableView.delegate = self
            usersTableView.dataSource = self
            usersTableView.register(UINib(nibName: "UsersCell", bundle: nil
            ), forCellReuseIdentifier: "usersCell")
            usersTableView.rowHeight = 200
        }
    }
  

    let fullView = MyCustomView(frame: CGRect(x: UIScreen.main.bounds.minX, y: UIScreen.main.bounds.minY, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    
    let customView = MyCustomView(frame: CGRect(x: UIScreen.main.bounds.minX + 40, y: UIScreen.main.bounds.minY + 200, width: UIScreen.main.bounds.size.width - 80, height: UIScreen.main.bounds.size.height - 300))

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbar()
        userPresenter = UsersVCPresenter(view: self)
        userPresenter.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    func setNavbar() {
        title = "Users"
        
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        navBar.shadowImage = UIImage()
        let gradient = CAGradientLayer()
        //var bounds = navBar.bounds
        //bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = navBar.bounds
        gradient.colors = [UIColor.systemGray.cgColor , UIColor.systemGray2.cgColor, UIColor.systemGray3.cgColor,UIColor.systemGray4.cgColor,UIColor.systemGray5.cgColor,UIColor.systemGray6.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        
        if let image = getImageFrom(gradientLayer: gradient) {
            navBar.setBackgroundImage(image, for: UIBarMetrics.default)
        }
        //
        navBar.layer.shadowOffset = .zero
        navBar.layer.shadowOpacity = 0.4
        navBar.layer.shadowRadius = 5.0
        navBar.layer.shadowColor = UIColor.darkGray.cgColor
        
    }
    
    func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
    func showPopup(_ sender: UIBarButtonItem) {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissPopup(_:)))

        customView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
        
        fullView.alpha = 0.5
        sender.isEnabled = false
        fullView.backgroundColor = .lightGray
        self.view.addSubview(fullView)
        customView.backgroundColor = .darkGray
        customView.layer.cornerRadius = 12
        customView.layer.shadowOffset = CGSize(width: 0, height: 6)
        customView.layer.shadowOpacity = 0.4
        customView.layer.shadowRadius = 5.0
        customView.layer.shadowColor = UIColor.black.cgColor
        fullView.addGestureRecognizer(tap)
        self.view.addSubview(customView)
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timerAction(_ :)), userInfo: nil, repeats: false)
    }
    
    @objc func dismissPopup(_ sender: UITapGestureRecognizer? = nil) {
        print("dismiss")
        self.customView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)

        UIView.animate(withDuration: 0.3) {

            self.customView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)

            
            self.addButton.isEnabled = true
            self.fullView.alpha = 0

        }
    }
    
    @objc func timerAction(_ sender: UIView){
        UIView.animate(withDuration: 0.3) {
            self.customView.transform = .identity
        }
    }
    
}

class MyCustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
