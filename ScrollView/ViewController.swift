//
//  ViewController.swift
//  ScrollView
//
//  Created by Эллина Коржова on 21.03.23.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

        
    var scrollView = UIScrollView()
    var image = UIImageView(image: .init(named: "Image"))

    override func viewDidLoad() {
        super.viewDidLoad()
        createScroll()
    }

    func createScroll(){
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        scrollView.delegate = self
        scrollView.backgroundColor = .systemIndigo
        
        view = scrollView
        
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.frame = CGRect(origin: .zero, size: .init(width: UIScreen.main.bounds.size.width, height: 270))
        scrollView.addSubview(image)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let height = 270 - scrollView.contentOffset.y
        image.frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: UIScreen.main.bounds.size.width, height: height)
        let topInset = height - view.safeAreaInsets.top
        scrollView.verticalScrollIndicatorInsets = .init(top: topInset, left: 0, bottom: 0, right: 0)
    }
}

