//
//  ViewController.swift
//  TravelApp
//
//  Created by Gleb on 12.11.2020.
//

import UIKit
import Foundation

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var darkView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
  
    
    private var currentPage = 0
    private var items: [OnboardingItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlaceholderItems()
        setupPageControll()
        setupScreen(index: currentPage)
        updateBgImage(index: currentPage)
        setupGestures()
        setupViews()
    }
    
    private func setupPlaceholderItems() {
        items = OnboardingItems.placeholderItems 
    }
    
    private func setupViews() {
        darkView.backgroundColor = UIColor.init(white: 0.1, alpha: 0.5)
    }
    
    private func setupPageControll() {
        pageControl.numberOfPages = items.count
    }
    
    private func setupScreen(index: Int) {
        titleLabel.text   = items[index].title
        detailsLabel.text = items[index].details
        
        pageControl.currentPage = index
        UIView.animate(withDuration: 0.5){
            self.titleLabel.alpha = 1
            self.detailsLabel.alpha = 1
        }
        
        titleLabel.transform = .identity
        detailsLabel.transform = .identity
    }
    
    private func updateBgImage(index: Int) {
        let image = items[index].bgImage
        
        UIView.transition(with: bgImageView, duration: 0.30, options: .transitionCrossDissolve, animations: {
            self.bgImageView.image = image
        }, completion: nil)
    }
    
    private func setupGestures() {
        let tapGestures = UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation))
        view.addGestureRecognizer(tapGestures)
    }
    
    @objc private func handleTapAnimation() {
        //first animation - title label
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.titleLabel.alpha = 0.8
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { _  in
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.titleLabel.alpha = 0.8
                self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -550)
                
            }, completion: nil)
        }
        
        //second animation - details label
    
        UIView.animate(withDuration: 0.8, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.detailsLabel.alpha = 0.8
            self.detailsLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { _  in
            
            if self.currentPage < self.items.count - 1{
                self.updateBgImage(index: self.currentPage + 1)
            }
            
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.detailsLabel.alpha = 0.8
                self.detailsLabel.transform = CGAffineTransform(translationX: 0, y: -550)
                
            }) {_ in
                self.currentPage += 1
                
                if self.isOverLastItem() {
                    self.showMainVC()
                }else {
                    self.setupScreen(index: self.currentPage)
                }
                
            }
        }
    }
    
    private func isOverLastItem() -> Bool {
        //0,1,2,3
        //count =>4
        return currentPage == self.items.count
    }
    
    private func showMainVC() {
        let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController")
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = mainViewController
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}

