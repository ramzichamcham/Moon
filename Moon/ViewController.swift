//
//  ViewController.swift
//  Moon
//
//  Created by Ramzi chamcham on 2020-06-03.
//  Copyright © 2020 Ramzi Chamcham. All rights reserved.
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
        
        let node = SCNNode()
        
        let sphere = SCNSphere(radius: 0.2)
        
        sphere.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        
        node.geometry = sphere
        
        node.position = SCNVector3(0, 0.1, -0.5)
        
        sceneView.scene.rootNode.addChildNode(node)
        
        sceneView.autoenablesDefaultLighting = true
        

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

    // MARK: - ARSCNViewDelegate
    
}
