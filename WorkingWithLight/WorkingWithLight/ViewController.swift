//
//  ViewController.swift
//  WorkingWithLight
//
//  Created by Joseph Veverka on 10/10/20.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        showShape()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration

        // Run the view's session
        sceneView.session.run(configuration)
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func showShape() {
        
        // SNOWMAN! (ADDING NODES TO EACHOTHER)
        let sphere = SCNSphere(radius: 0.04)
        sphere.firstMaterial?.diffuse.contents = UIColor.red
        let node = SCNNode()
        node.geometry = sphere
        node.position = SCNVector3(0.05, 0.05, -1)
        sceneView.scene.rootNode.addChildNode(node)
        
        let middleSphere = SCNSphere(radius: 0.03)
        middleSphere.firstMaterial?.diffuse.contents = UIColor.blue
        let middleNode = SCNNode()
        middleNode.geometry = middleSphere
        middleNode.position = SCNVector3(0, 0.06, 0)
        node.addChildNode(middleNode)
        
        let topSphere = SCNSphere(radius: 0.02)
        topSphere.firstMaterial?.diffuse.contents = UIColor.white
        let topNode = SCNNode()
        topNode.geometry = topSphere
        topNode.position = SCNVector3(0, 0.04, 0)
        middleNode.addChildNode(topNode)
        
        let hatRim = SCNCylinder(radius: 0.03, height: 0.002)
        hatRim.firstMaterial?.diffuse.contents = UIColor.black
        let rimNode = SCNNode()
        rimNode.geometry = hatRim
        rimNode.position = SCNVector3(0, 0.016, 0)
        topNode.addChildNode(rimNode)
        
        let hatTop = SCNCylinder(radius: 0.015, height: 0.025)
        hatTop.firstMaterial?.diffuse.contents = UIColor.black
        let hatNode = SCNNode()
        hatNode.geometry = hatTop
        hatNode.position = SCNVector3(0, 0.01, 0)
        rimNode.addChildNode(hatNode)


        
        
        

    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
