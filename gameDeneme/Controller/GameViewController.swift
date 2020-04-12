//
//  GameViewController.swift
//  gameDeneme
//
//  Created by Muhammet Taha Genç on 6.02.2020.
//  Copyright © 2020 Muhammet Taha Genç. All rights reserved.
//

import UIKit
import SceneKit
import Firebase

class GameViewController: UIViewController,BodyPartProtocol{
    
    var nameToSend: String? {
        didSet{
            performSegue(withIdentifier: "showEquipment", sender: self)
        }
    }
    func getBodyPart() -> String {
        //Protocol function
        return nameToSend!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSCNView(scene: createNewScene())
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segu:EquipmentTableViewController = segue.destination as? EquipmentTableViewController {
            segu.delegate = self
        }
    }
    
    @objc func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result = hitResults[0]
            let name = result.node.geometry!.name
            nameToSend = name
            
            
            // get its material
            let material = result.node.geometry!.firstMaterial!
            
            
            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                
                material.emission.contents = UIColor.black
                
                SCNTransaction.commit()
            }
            
            material.emission.contents = UIColor.red
            
            SCNTransaction.commit()
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    func chose (name:String) -> Int{
                
        if name == "Forearms" {
            return 1
        } else if name == "Max.002" {
            return 2
        } else if name == "Max.003" {
            return 3
        } else if name == "Max.004" {
            return 4
        } else if name == "Max.005" {
            return 5
        } else if name == "Max.006" {
            return 6
        } else if name == "Max.007" {
            return 7
        } else if name == "Max.008" {
            return 8
        } else if name == "Max.009" {
            return 9
        } else if name == "Max.010" {
            return 10
        } else if name == "Max.011" {
            return 11
        } else if name == "Max.012" {
            return 12
        } else if name == "Max.013" {
            return 13
        } else if name == "Max.014" {
            return 14
        } else if name == "Max.015" {
            return 15
        } else {
            return 0
        }
    }
    
    
    func createNewScene() -> SCNScene {
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/max.scn")!
        // add an image to the background of the scene
        scene.background.contents = UIImage(named: "3")
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
            
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 25)

        // create and add a light to the scene
        let firstLightNode = SCNNode()
        firstLightNode.light = SCNLight()
        firstLightNode.light!.type = .omni
        firstLightNode.position = SCNVector3(x: 0, y: 7, z: 10)
        scene.rootNode.addChildNode(firstLightNode)

        
        // create and add an ambient light to the scene
        let secondLightNode = SCNNode()
        secondLightNode.light = SCNLight()
        secondLightNode.light!.type = .omni
        secondLightNode.position = SCNVector3(x: 0, y: 10, z: -10)
        scene.rootNode.addChildNode(secondLightNode)
        
        return scene
    }
    
    func createSCNView(scene: SCNScene) {
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = false
        
        // configure the view
//        scnView.backgroundColor = UIColor.black
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
    }
    

}
