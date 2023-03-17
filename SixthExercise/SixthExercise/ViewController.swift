//
//  ViewController.swift
//  SixthExercise
//
//  Created by Лада Зудова on 17.03.2023.
//

import UIKit

class ViewController: UIViewController {
    private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: view)
    
    private var behavior: UISnapBehavior?
    
    private lazy var square: UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 110, height: 110))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.layer.cornerRadius = 3
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(square)
        view.backgroundColor = .systemTeal
        // Do any additional setup after loading the view.
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(gestureTap))
        view.addGestureRecognizer(recognizer)
    }

    @objc
    private func gestureTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let translation = gestureRecognizer.location(in: view)
        if let beh = behavior {
            animator.removeBehavior(beh)
        }
        behavior = UISnapBehavior(item: square, snapTo: translation)
        animator.addBehavior(behavior!)
    }
}

