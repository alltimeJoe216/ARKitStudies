//
//  ViewController.swift
//  ARKitz1
//
//  Created by Joseph Veverka on 10/3/20.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        let text = SCNText(string: "Shut yo ass up", extrusionDepth: 1.0)
        
        // material
        text.firstMaterial?.diffuse.contents = UIColor.black // since text doesn't have multiple sides, it only has one material
        
        // need a node to add to real world
        let textNode = SCNNode(geometry: text)
        textNode.position = SCNVector3(x: 0, y: 0, z: -1.2)
        textNode.scale = SCNVector3(x: 0.02, y: 0.02, z: 0.02)
        
        self.sceneView.scene.rootNode.addChildNode(textNode)
        
        
        
        
        /*
         
        TO SET UP A CUBE!!!
         
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
