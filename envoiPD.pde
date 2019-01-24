import oscP5.*;
import netP5.*;

OscP5 oscP;
//  NetAddress contient l'ip et le n° de port de l'adresse distante sur le réseau.
NetAddress adresseDistante;
String partieDuCorps = "";
OscMessage message;

class Envoi {
   Envoi() {
    // creation d'une instance de oscP5. 12000 est le port d'écoute pour les messages OSC.
    oscP = new OscP5(this, 12000);
    // creation d'une instance de new NetAddress. NetAddress est utilisé pour l'envoi de messages osc avec la méthode transfer
    adresseDistante = new NetAddress("127.0.0.1", 12001);
   
  }
  
  void transfert(String red) {
     message = new OscMessage(red);
    oscP.send(message, adresseDistante);
  }
}
