//
//  MqttManager.swift
//  Mqtt-UIKit
//
//  Created by Reinner Daza Leiva on 3/03/21.
//

import UIKit
/**
 Importar la libreria CocoaMQTT,
 */
import CocoaMQTT

class MqttManager: NSObject {
   
    // Definicion del Singleton
    static let instance = MqttManager()
    
    // Variable que corresponde a la URL
    private var hostMQTT = "localhost";
    // Variable que corresponde aL PUERTO
    private var portMQTT = 1883;
    // Instancia de la libreria
    private var mqtt: CocoaMQTT?
    // Usuario para conextarse al broker
    private var userMQTT = ""
    // Contraseña para conextarse al broker
    private var passwordMQTT = ""
    
    // Funcion que se encarga de asignar el valor al HOST
    func setHostMQTT(hostMQTT:String){
        self.hostMQTT = hostMQTT;
    }
    
    // Funcion que se encarga de asignar el valor al PORT (Puerto)
    func setPortMQTT(portMQTT: Int){
        self.portMQTT = portMQTT;
    }
    // Funcion que se encarga de asignar el valor al Usuario del broker
    func setUserMQTT(portMQTT: Int){
        self.portMQTT = portMQTT;
    }
    
    // Funcion que se encarga de asignar el valor la Contrasea del broker
    func setUserMQTT(passwordMQTT: String){
        self.passwordMQTT = passwordMQTT;
    }
    
    // Obtener el valor del host
    func getHostMQTT() -> String {
        return self.hostMQTT;
    }
    
    // Obtener el valor del puerto
    func getPortMQTT() -> Int {
        return self.portMQTT;
    }
    
    // Obtener el valor del usuario
    func getUserMQTT() -> String {
        return self.userMQTT;
    }
    
    //// Obtener el valor del la contrase
    func getPasswordMQTT() -> String {
        return self.passwordMQTT;
    }
    
    // Obtener la instancia de la libreria MQTT
    func getMQTTInstance() -> CocoaMQTT? {
        return self.mqtt;
    }
    
    // Funcion para realizar configuracion de la conexion MQTT
    func mqttSetting() {
        let clientID = "iOS-mqtt-" + String(ProcessInfo().processIdentifier)
        mqtt = CocoaMQTT(clientID: clientID, host: self.hostMQTT, port: UInt16(self.portMQTT))
        mqtt!.username = self.userMQTT;
        mqtt!.password = self.passwordMQTT;
        mqtt!.keepAlive = 60;
        mqtt!.delegate = self;
    }
    
    // Funcion para realizar configuracion de la conexion MQTT, parametros User, Password del bloker
    
    func mqttSetting(user: String, password:String) {
        let clientID = "iOS-mqtt-" + String(ProcessInfo().processIdentifier)
        mqtt = CocoaMQTT(clientID: clientID, host: self.hostMQTT, port: UInt16(self.portMQTT))
        mqtt!.username = user
        mqtt!.password = password
        mqtt!.keepAlive = 60
        mqtt!.delegate = self
    }
    
    // Funcion para realizar configuracion de la conexion MQTT, parametros Host, User, Password del bloker
    func mqttSetting(host:String, user: String, password:String) {
        let clientID = "iOS-mqtt-" + String(ProcessInfo().processIdentifier)
        self.hostMQTT = host
        self.userMQTT = user
        self.passwordMQTT = password
        mqtt = CocoaMQTT(clientID: clientID, host: self.hostMQTT, port: UInt16(self.portMQTT))
        mqtt!.username = user
        mqtt!.password = password
        mqtt!.keepAlive = 60
        mqtt!.delegate = self
    }
    
    // Funcion para realizar la conexion
    func connectMqtt(){
        let connected = self.mqtt?.connect();
        print(connected ?? false)
    }
    
    // Funcion para suscribirse a un topico
    func suscribeToTopic(topic:String) {
        self.mqtt!.subscribe(topic, qos: .qos0)
    }
    
    // Funcion para publicar un mensaje en el topico
    func publishMessage(topic:String, message:String) {
        self.mqtt!.publish(topic,withString: message, qos: .qos0)
    }
}

// Definicion del Delegate correpsondiente a la libreria
extension MqttManager : CocoaMQTTDelegate {
    
    func mqttDidPing(_ mqtt: CocoaMQTT) {
        print("mqttDidPing")
    }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        print("mqttDidReceivePong")
    }
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        print("mqttDidDisconnect")
        print(err.debugDescription)
        print(err!.localizedDescription)
        print(mqtt.autoReconnect);
        print(mqtt.host)
        print(mqtt.username)
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        print("didConnectAck", ack)
    }

    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        print("didPublishMessage", message)
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        print("didPublishAck", id)
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        print("didReceiveMessage", message, id)
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topics: [String]) {
        print("didSubscribeTopic", topics)
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        print("didUnsubscribeTopic", topic)
    }
    
    
}
