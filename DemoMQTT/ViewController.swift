//
//  ViewController.swift
//  DemoMQTT
//
//  Created by star on 5/7/24.
//

import UIKit
import CocoaMQTT

class ViewController: UIViewController {

    @IBOutlet weak var lblMessage: UILabel!
    // Initialize MQTT client with provided details.
    var mqtt = CocoaMQTT(
        clientID: "iOS Device",
        host: "services.chakraview.co.in",
        port: 1883)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize MQTT client
        mqtt.username = "mqtt-test"
        mqtt.password = "mqtt-test"
        mqtt.keepAlive = 60
        
        // Set the delegate to receive MQTT events
        mqtt.delegate = self
        
        // Connect to the MQTT broker
        mqtt.connect()
    }

}

extension ViewController: CocoaMQTTDelegate {
    func mqttDidPing(_ mqtt: CocoaMQTT) {
        
    }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
       
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics success: NSDictionary, failed: [String]) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopics topics: [String]) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        print("Connected to MQTT broker with ack: \(ack)")
        
        // Subscribe to a topic
        mqtt.subscribe("liveroute/1454540")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        print("Message published: \(message.string ?? "")")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        print("Received message: \(message.string ?? "")")
        
        // Handle received message
        self.lblMessage.text = message.string ?? ""
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topic: String) {
        print("Subscribed to topic: \(topic)")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        print("Unsubscribed from topic: \(topic)")
    }
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        print("Disconnected from MQTT broker with error: \(err?.localizedDescription ?? "")")
    }
}
