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

class GameViewController: UIViewController,BodyPartProtocol,GADInterstitialDelegate{
    
    //MARK: - Protocol Func
    func getBodyPart() -> String {
        //Protocol function
        return nameToSend!
    }

    
    //MARK: - Variables
    var nameToSend: String? {
        didSet{
            if nameToSend == "Brain" {
                print("Brain")
            } else if nameToSend == nil {
                print("nil")
            } else {
                performSegue(withIdentifier: "showEquipment", sender: self)
            }
        }
    }
    
    //Create interstitial
    var interstitial: GADInterstitial!
    
    //MARK: - ViewDidLoad and WillAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        createSCNView(scene: createNewScene())
        interstitial = createAndLoadInterstitial()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showAd()
    }
        
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segu:EquipmentTableViewController = segue.destination as? EquipmentTableViewController {
            segu.delegate = self
        }
    }
    
    //MARK: - SceneKit Func
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
    
    func createNewScene() -> SCNScene {
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/max.scn")!
        // add an color to the background of the scene
        scene.background.contents = UIColor.gray
        
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
        
        // add a button to the scene
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        button.titleLabel?.font = UIFont(name: "Arial", size: 25)
        button.setTitle("Back", for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(didPressBack), for: .touchUpInside)
        button.center.x = 50
        button.frame.origin.y = 20
        scnView.addSubview(button)
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = false
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
    }
    
    //MARK: Functions
    @objc func didPressBack (sender: UIButton!) {
        dismiss(animated: true, completion: nil)
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
    
    //MARK: - Admob Functions
    
    
    func createAndLoadInterstitial() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")

        interstitial.delegate = self
        interstitial.load(GADRequest())
        
        return interstitial
    }

    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
      interstitial = createAndLoadInterstitial()
    }
    
    func showAd(){
        let number = Int.random(in: 0 ... 10)
        if number % 5 == 0 {
            if self.interstitial.isReady {
              self.interstitial.present(fromRootViewController: self)
                
            } else {
                print("Ad wasn't ready")
            }
        }
    }
}
