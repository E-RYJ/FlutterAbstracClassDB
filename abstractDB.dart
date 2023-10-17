import 'package:mysql1/mysql1.dart';
enum DataBaseEngine{MySQL,MariaDB}

//final conexionMariaDB = ConnectionMariaDB(ip:'192.168.0.1',puerto:3306,nombreBD:'ISW',usuario:'root',psw:'');
//final conexionMySQL = ConnectionMySQL(ip:'localhost',puerto:3306,nombreBD:'ISW',usuario:'root',psw:'');



abstract class Connection{
   String ipv4;
   int port;
   String uid;
   String pswd;
   String database; 
   DataBaseEngine  type;
   
   Connection({required this.ipv4,required this.port, required this.uid,required 
     this.pswd,required this.database,required this.type});
   Future<MySqlConnection> executeConnection() async{
      var setting = new ConnectionSettings(
        host: ipv4,
        port: this.port,
        user: uid,
        password: pswd,
        db: database);
      return await MySqlConnection.connect(setting);
     } 
 }

class ConnectionMariaDB extends Connection{
  ConnectionMariaDB({required ip,required puerto,required nombreBD,required usuario,required psw})
    :super(ipv4: ip,port: puerto,database: nombreBD,uid: usuario,pswd: psw,type: DataBaseEngine.MariaDB);
    @override
  Future<MySqlConnection> executeConnection() {
    // TODO: implement executeConnection
    return super.executeConnection();
  }
  
}

class ConnectionMySQL extends Connection{
  ConnectionMySQL({required ip,required puerto,required nombreBD,required usuario,required psw})
    :super(ipv4: ip,port: puerto,database: nombreBD,uid: usuario,pswd: psw,type: DataBaseEngine.MySQL);
  @override
  Future<MySqlConnection> executeConnection() {
    // TODO: implement executeConnection
    return super.executeConnection();
  }
  
   
  }
  
