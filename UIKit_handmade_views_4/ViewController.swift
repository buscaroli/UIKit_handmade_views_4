//
//  ViewController.swift
//  UIKit_handmade_views_4
//
//  Created by Matteo on 31/07/2021.
//
//  Based on a tutorial on YouTube from Brian Voong:
//  https://www.youtube.com/watch?v=WCECFfelSHk&list=PL0dzCUj1L5JHdeOlzJtp5zlsdrliJTC7F&index=3
//
//  Embedding an Image View inside an outer container to be sure
//  the image is always kept in the top half of the screen.
//  Also used:
//      - UIStackView
//      - UIPageControl
//      - extended UIColor to use a personalised colour
//      - used NSLayoutConstraint.activate instead of adding isActive = true
//          to each constraint
//

import UIKit

extension UIColor {
    static var lightRed = UIColor(displayP3Red: 244/255, green: 210/255, blue: 219/255, alpha: 1)
}

class ViewController: UIViewController {
    
    let topContainerView: UIImageView = {
        let containerView = UIImageView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.backgroundColor = .systemPink
        
        let diamondImageView: UIImageView = {
            let imageView = UIImageView(image: UIImage.init(named: "diamond"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        func diamondSetupLayout() {
            diamondImageView.heightAnchor.constraint(
                equalTo: containerView.heightAnchor,
                multiplier: 0.6
            ).isActive = true
            diamondImageView.contentMode = .scaleAspectFit
            diamondImageView.centerXAnchor.constraint(
                equalTo: containerView.centerXAnchor
            ).isActive = true
            diamondImageView.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor
            ).isActive = true
        }
        
        containerView.addSubview(diamondImageView)
        diamondSetupLayout()
        
        return containerView
        
        
    }()
    

    let descriptionView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Come check out our Diamonds!", attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)
            ]
        )
        attributedText.append(NSAttributedString(string: "\n\n\nThe brightest jewels in the country, come and see for yourself! You won't fine aything like it! I promise!",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                NSAttributedString.Key.foregroundColor: UIColor.systemGray
            ]
        ))
        
        textView.attributedText = attributedText
        
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(topContainerView)
        view.addSubview(descriptionView)
        
        setupBottomControls()
        setupLayout()
        
    }
    
    private func setupLayout() {
        
        topContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        descriptionView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 50).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
    }

    
    let prevButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemRed
        button.setTitle("Prev", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = UIColor.systemRed
        pc.pageIndicatorTintColor = UIColor.lightRed
        pc.translatesAutoresizingMaskIntoConstraints = false
        
        return pc
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemRed
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    private func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 40),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

}

