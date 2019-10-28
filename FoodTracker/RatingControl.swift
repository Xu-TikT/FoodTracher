//
//  RatingControl.swift
//  FoodTracker
//
//  Created by jodia luxcon on 2019/10/26.
//

import UIKit

class RatingControl: UIStackView {

    //MARK:Initialization
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder:coder)
        setupButtons()
    }
    //MARK:Private Methods
    private func setupButtons(){
        //Create the button
        let button = UIButton()
        button.backgroundColor = UIColor.red
        //Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        //setup the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        //Add the button to the stack
        addArrangedSubview(button)
    }
    
    //MARK:Button Action
    @objc private func ratingButtonTapped(button:UIButton){
        print("Button pressed 👍")
    }
}