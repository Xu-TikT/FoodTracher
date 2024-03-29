//
//  RatingControl.swift
//  FoodTracker
//
//  Created by jodia luxcon on 2019/10/26.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK:Properties
    private var ratingButtons = [UIButton]()
    var rating = 0
    @IBInspectable var starSize:CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount:Int = 5{
        didSet{
            setupButtons()
        }
    }
    
    
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
        //Load button images
        let bundle = Bundle(for: type(of:self))
        let filledStar = UIImage(named: "filledStar",in:bundle,compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar",in:bundle,compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar",in:bundle,compatibleWith: self.traitCollection)
        
        
        //clear any existing buttons
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
            
        }
        ratingButtons.removeAll()
        
        
        
        
        for _ in 0..<starCount{
        
        //Create the button
        let button = UIButton()
//        button.backgroundColor = UIColor.red//设置按钮为红色
            //设置按钮背景为图片
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted,.selected])
            
        //Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        //setup the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        //Add the button to the stack
        addArrangedSubview(button)
            }
    }
    
    //MARK:Button Action
    @objc private func ratingButtonTapped(button:UIButton){
        print("Button pressed 👍")
    }
    
    



}
