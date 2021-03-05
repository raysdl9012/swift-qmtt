# Swift MQTT
Este es un ejemplo de como se realiza una conexion MQTT por medio del lenguaje de progarmcion Swift utilizando el concepto de cliente y servidor para aplicaciones IOT.

## Descripción
Este es un proyecto para el lenguakde de programcion Swift el cual es utilizado normalmente en aplicaciones para iOS, fue desarrollado medienta el la librearia de CocoaMQTT, la cual ya tiene una utilizada mas sencilla de comprender, realizar y manejar el protocolo MQTT. Si desea conocer mas de platformio, ingrese al siguiente [enlace](https://github.com/emqx/CocoaMQTT). La implementación de esta libreria fue maneja por medio de un Singleton el la clase <MQTTManage.swfitr>.

Este proyecto realiza las siguientes funcionalidades:
1. Formulario para la lectura de la URL, User y Password para la conexion al borker.
2. Implementacion de la libreria para detectar por medio de delegados, la conexion al broker, enviar un mensaje, recibir un mensaje y otro eventos.
3. Funcion de como suscribirse a un topico.
4. Funcion de como publicar un mensaje en un topico.

## Instalacion
Para realizar la instalacion correcta de este ejepmlo simple, siga por favor los siguientes pasos:
1. Instalacion de CocoPods.
2. En la raiz del proyecto, ejecutar el comando pod install. Este comando instalara todas la libreria necesaria para conextarse al protocolo MQTT.
4. Abrir el archivo xcworkspace, este contiene el proyecto raiz mas la libreria.
3. Tener las variables del host, user y password del broker, estas pueden ser ingresadas por el formulario o cambiadas directamente en el codigo.