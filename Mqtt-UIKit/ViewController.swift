//
//  ViewController.swift
//  Mqtt-UIKit
//
//  Created by Reinner Daza Leiva on 3/03/21.
//

import UIKit

class ViewController: UIViewController {

    
    private let topic = "test"
    @IBOutlet weak var inputHost: UITextField!
    @IBOutlet weak var inputUser: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func connectToMQTT(_ sender: UIButton) {
        let host = self.inputHost!.text!.replacingOccurrences(of: " ", with: "")
        let user = self.inputUser!.text!.replacingOccurrences(of: " ", with: "")
        let password = self.inputPassword!.text!.replacingOccurrences(of: " ", with: "")
        MqttManager.instance.mqttSetting(host:host, user:user, password: password);
        MqttManager.instance.connectMqtt()
        
        /**
            Para la utilizacion de la siguientes lienas, asegurese de conextarse satisfactoriamente al BROKER MQTT
            1. La siguiente linea de codigo se encarga de suscribirse a un topico:
                 MqttManager.instance.suscribeToTopic(topic: "test1")
            2. La siguiente line a de codigo se encarga de publicar un mensaje en un topico en especifico:
                MqttManager.instance.suscribeToTopic(topic: "test1")
         */

    }
    
}

