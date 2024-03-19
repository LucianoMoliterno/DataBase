package com.mycompany.javamongodb;

import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import java.util.List;

public class ConexionMongoDB {

    String server = "localhost";
    Integer port = 27017;

    public MongoClient crearConexion() {

        MongoClient mongo = null;

        try {
            //Establecemos conexion a MongoDB
            mongo = new MongoClient(server, port);

            List<String> nombresDB = mongo.getDatabaseNames();

            System.out.println("Se conecto correctamente a MongoDB, la lista de bases de datos disponibles son: " + nombresDB.toString());
            
        } catch (MongoException e) {
            System.out.println("Error en la conexion a MongoDB: " + e.toString());
        }
        return mongo;
    }

}
