//
//  3DModeling.swift
//  uuugl
//
//  Created by 장승호 on 5/9/24.
//

import Foundation
import SceneKit
import RealityKit
import SwiftUI

struct SceneKitView: UIViewRepresentable {
    
    var color: Color = Color.white100()
    
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.scene = SCNScene()
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = false
        
        // 공 모양의 노드 추가
        let sphere = SCNSphere(radius: 1.0)
        sphere.segmentCount = 36  // 폴리곤 수를 늘려서 표면을 매끄럽게 함
        
        // 재질 설정
        let material = SCNMaterial()
        material.diffuse.contents = UIColor(color)
//        material.specular.contents = UIColor(Color.white100()) // 하이라이트 색상을 흰색으로 설정, 가운데 밝은 빛
        material.shininess = 2.0 // 광택도
        sphere.materials = [material]
        
        // 추가 광원 설정
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni  // 전방향 광원
        lightNode.light?.intensity = 1700 // 광원 강도

        lightNode.position = SCNVector3(x: 0, y: 5, z: 10)  // 광원 위치
//        x 축: 왼쪽과 오른쪽 방향을 나타냅니다. 값이 커질수록 오른쪽으로 이동합니다.
//        y 축: 위와 아래 방향을 나타냅니다. 값이 커질수록 위쪽으로 이동합니다.
//        z 축: 앞과 뒤 방향을 나타냅니다. 값이 커질수록 카메라로부터 멀어지고, 즉 '뒤'로 이동합니다.
        
        sceneView.scene?.rootNode.addChildNode(lightNode)
        
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3(x: 0, y: 0, z: 0)
        sceneView.scene?.rootNode.addChildNode(sphereNode)
        
        return sceneView
    }
    
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        // 여기서 뷰 업데이트 로직을 구현할 수 있습니다.
    }

}


