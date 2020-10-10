//
//  ViewController.swift
//  ARKitz1
//
//  Created by Joseph Veverka on 10/3/20.
//

import UIKit
import SceneKit
import ARKit
import GLKit
import CoreGraphics

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

class ViewController: UIViewController, ARSCNViewDelegate {
    
    var textNode = SCNText()

    func setupText() {
        textNode = SCNText(string: "Bih why yo bref smel lik booty", extrusionDepth: 1.0)
        textNode.firstMaterial?.diffuse.contents = UIColor.systemBlue // since text doesn't have multiple sides, it only has one material
        let tNode = SCNNode(geometry: textNode) // need a node to add to real world
        tNode.position = SCNVector3(x: 0, y: 0, z: -5)
        tNode.scale = SCNVector3(x: 0.02, y: 0.02, z: 0.02)
        self.sceneView.scene.rootNode.addChildNode(tNode)
        
    }

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
       
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        setupText()
        /*
         // set geometry of cube
         // This is in METERS, EVERYTHING IS IN METERS!!!!!
         let box = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0) // chamfer radius = rounded corners
         
         //set cube material
         let material = SCNMaterial() // color (can be an image) used to wrap the cube. the DRESS it's wearing
         material.diffuse.contents = UIImage(named: "Hendrix")
         
         // set the box's materials to the materials we jsut created
         box.materials = [material]
         
         // add box into real world, create an SCN Node (in which we will add to new world)
         let boxNode = SCNNode(geometry: box) // setting as our box above
         
         // set box position
         boxNode.position = SCNVector3(x: 0, y: 0, z: -0.5)
         
         // add box to scene view
         self.sceneView.scene.rootNode.addChildNode(boxNode)
         */
        
        
        
    }
    
    //MARK: - IBAction
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        
    }
    @IBAction func noButtonTapped(_ sender: UIButton) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
