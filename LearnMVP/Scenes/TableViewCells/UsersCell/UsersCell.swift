//
//  UsersCell.swift
//  LearnMVP
//
//  Created by Eslam on 6/4/20.
//  Copyright © 2020 Ioslam. All rights reserved.
//

import UIKit

class UsersCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var superView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        superView.layer.cornerRadius = 12
        //superView.layer.cornerRadius = 12
        superView.layer.shadowOffset = CGSize(width: 1, height: 0.6)
        superView.layer.shadowOpacity = 0.6
        superView.layer.shadowRadius = 5.0
        superView.layer.shadowColor = UIColor.black.cgColor
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
}
extension UsersCell: UsersCellView {
    func getUserName(name: String?) {
        nameLabel.text = name
    }
    
    func getUserAddress(address: String) {
        addressLabel.text = address
    }
    
    func getUserEmail(email: String) {
        emailLabel.text = email
    }
    
    
    
    
}
extension UsersCell {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    animate(isHighlighted: true)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    animate(isHighlighted: false)
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    animate(isHighlighted: false)
  }
  
  private func animate(isHighlighted: Bool, completion: ((Bool) -> Void)? = nil) {
    let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
    if isHighlighted {
      UIView.animate(
        withDuration: 0.5,
        delay: 0,
        usingSpringWithDamping: 1,
        initialSpringVelocity: 0,
        options: animationOptions, animations: {
          self.transform = .init(scaleX: 0.95, y: 0.95)
      }, completion: completion)
    } else {
      UIView.animate(
        withDuration: 0.5,
        delay: 0,
        usingSpringWithDamping: 1,
        initialSpringVelocity: 0,
        options: animationOptions, animations: {
          self.transform = .identity
      }, completion: completion)
    }
  }
}
