//
//  ViewController.swift
//  AREarth
//
//  Created by Kohinoor on 12/08/19.
//  Copyright © 2019 Kohinoor. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    let config = ARWorldTrackingConfiguration()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(config)
        self.sceneView.autoenablesDefaultLighting = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.4)
        node.position = SCNVector3(0, 0, -1.0)
        node.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "day")
        node.geometry?.firstMaterial?.emission.contents = UIImage(named: "emission")
        node.geometry?.firstMaterial?.specular.contents = UIImage(named: "specular")
        node.geometry?.firstMaterial?.normal.contents = UIImage(named: "normal")
        
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreeToRadians), z: 0, duration: 25)
        let forever = SCNAction.repeatForever(action)
        node.runAction(forever)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }


}

extension Int{
    var degreeToRadians: Double {return Double(self) * .pi/180}
}
