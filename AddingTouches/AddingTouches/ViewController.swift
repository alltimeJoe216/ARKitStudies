//
//  ViewController.swift
//  AddingTouches
//
//  Created by Joseph Veverka on 10/15/20.
//

import UIKit
import ARKit
import SceneKit
class ViewController: UIViewController {
    

    
    // World Tracking config
    let configuration = ARWorldTrackingConfiguration()
    
    //Scene view
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureARscene()
        setupTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.session.run(configuration)
    }
}

extension ViewController: ARSCNViewDelegate { // AR Relevance
    
    func configureARscene() {
        // delegate
        sceneView.delegate = self
        // feature points
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        sceneView.addGestureRecognizer(tapGesture)
    }
    
    
    // Handle tap gesture
    @objc func handleTap() {
        print("tap detected")
        


    }
    
}

