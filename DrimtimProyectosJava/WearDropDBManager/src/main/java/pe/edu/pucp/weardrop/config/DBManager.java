/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.weardrop.config;

/**
 *
 * @author Leonardo
 */
import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Map;
import java.util.Properties;
//Clase que permite abrir una conexion.
public class DBManager {
    
    //Atributos
    private static DBManager dbManger;
    private Properties datos;
    //Si se coloca final sale error...
    private String url;
    private String user;
    private String password;
    private final String baseDeDatos="mydb";
    private Connection con;
    private ResultSet rs;
    private String ruta="db.properties";
    
    public static DBManager getInstance(){
        if(dbManger==null)
            dbManger=new DBManager();
        return dbManger;
    }
    public DBManager(){
        datos=new Properties();
        try{
            //Para manejar un flujo de datos
            //
            InputStream inputStream=getClass().getClassLoader().getResourceAsStream(ruta);
            datos.load(inputStream);
            this.url="jdbc:mysql://"+datos.getProperty("hostname")+"/"+this.baseDeDatos;
            this.user=datos.getProperty("usuario");
            this.password=datos.getProperty("password");
            
        }catch (IOException ex){
            System.out.println("ERROR: Ha ocurrido un error en la obtención "
                    + "de los datos de conexión: "+ex.getMessage());
        }
    }
    
    public Connection getConnexion(){
        try{
            //Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection(this.url, this.user, this.password);
            System.out.println("SE HA LOGRADO CONECTAR A LA BD EXITOSAMENTE: \n");
        }catch(ClassNotFoundException | SQLException ex){
            System.out.println("ERROR AL INTENTAR CONECTAR CON LA BD: "+ex.getMessage());
        }
        return this.con; //Devolvemos la conexion.
    }
    
    public void cerrarConexion(){
        try{
            con.close();
        }catch(SQLException ex){
            System.out.println("ERROR AL CERRAR LA CONEXION: "+ex.getMessage());
        }
    }
    
    //Actualizacion 21/09/25
    //Para los INSERTS y UPDATES
    public int ejecutarProcedimiento(String nombreProcedimiento,
            Map<Integer, Object> parametrosEntrada,
            Map<Integer, Object> parametrosSalida){
        int resultado=0;
        try{
            CallableStatement cst=formarLlamadaProcedimiento(nombreProcedimiento, 
                    parametrosEntrada, parametrosSalida);
            if(parametrosEntrada!=null)
                registrarParametrosEntrada(cst, parametrosEntrada);
            if(parametrosSalida!=null)
                registrarParametrosSalida(cst, parametrosSalida);
            
            resultado=cst.executeUpdate();
            if(parametrosSalida!=null)
                obtenerValoresSalida(cst, parametrosSalida);
            
        }catch(SQLException ex){
            System.out.println("Error ejecutando procedimiento almacenado: " + ex.getMessage());
        }finally{
            cerrarConexion();
        }
        return resultado;
    }
    
    public ResultSet ejecutarProcedimientoLectura(String nombreProcedimiento, Map<Integer,Object> parametrosEntrada){
        try{
            CallableStatement cs = formarLlamadaProcedimiento(nombreProcedimiento, parametrosEntrada, null);
            if(parametrosEntrada!=null)
                registrarParametrosEntrada(cs,parametrosEntrada);
            rs = cs.executeQuery();
        }catch(SQLException ex){
            System.out.println("Error ejecutando procedimiento almacenado de lectura: " + ex.getMessage());
        }
        return rs;
    }
    
    //Este procedimiento es para formar la cadena que llama al procedimiento almacenado
    public CallableStatement formarLlamadaProcedimiento(String nombreProcedimiento,
            Map<Integer, Object> parametrosEntrada, Map<Integer, Object> parametrosSalida) throws SQLException{
        con=getConnexion();
        StringBuilder call= new StringBuilder("{call "+nombreProcedimiento+"(");
        int cantParametrosEntrada=0;
        int cantParametrosSalida=0;
        if(parametrosEntrada!=null) cantParametrosEntrada=parametrosEntrada.size();
        if(parametrosSalida!=null) cantParametrosSalida=parametrosSalida.size();
        
        int numParametros=cantParametrosEntrada+cantParametrosSalida;
        for (int i = 0; i < numParametros; i++) {
            call.append("?"); //Call Append: Concatenar con caracteres
            if(i<numParametros-1){
                call.append(",");
            }
        }
        call.append(")}");
        return con.prepareCall(call.toString());
    }
    
    private void registrarParametrosEntrada(CallableStatement cs, Map<Integer, Object> params) throws SQLException{
        for(Map.Entry<Integer, Object> entry: params.entrySet()){
            Integer key=entry.getKey();
            Object value=entry.getValue();
            switch(value){
                case Long longer -> cs.setLong(key, longer);
                case Integer entero -> cs.setInt(key, entero);
                case String cadena -> cs.setString(key, cadena);
                case Double decimal -> cs.setDouble(key, decimal);
                case Boolean booleano -> cs.setBoolean(key, booleano);
                case java.util.Date fecha -> cs.setDate(key, new java.sql.Date(fecha.getTime()));
                case Character caracter -> cs.setString(key, String.valueOf(caracter));
                case byte[] archivo -> cs.setBytes(key, archivo);
                default->{
                }
                //Se puede agregar de más tipos si es requerido
            }
        }
    }
    private void registrarParametrosSalida(CallableStatement cs, Map<Integer, Object> params) throws SQLException{
        for (Map.Entry<Integer, Object> entry: params.entrySet()){
            Integer posicion= entry.getKey();
            int sqlType=(int) entry.getValue();
            cs.registerOutParameter(posicion, sqlType);
        }
    }
    private void obtenerValoresSalida(CallableStatement cst, Map<Integer, Object> parametrosSalida) throws SQLException{
        for(Map.Entry<Integer, Object> entry: parametrosSalida.entrySet()){
            Integer posicion=entry.getKey();
            int sqlType=(int)entry.getValue();
            Object value=null;
            switch (sqlType){
                case Types.INTEGER -> value = cst.getInt(posicion);
                case Types.VARCHAR -> value = cst.getString(posicion);
                case Types.DOUBLE -> value = cst.getDouble(posicion);
                case Types.BOOLEAN -> value = cst.getBoolean(posicion);
                case Types.DATE -> value = cst.getDate(posicion);
                //Se puede agregar de más tipos si es requerido
            }
            parametrosSalida.put(posicion, value);
        }
    }
    
    
    //Para las transacciones
    /*Para las clases de transacciones es casi lo mismo que el de ejecucion normal
    Solo que invocando primero al iniciarTransaccion en la clase Padre (La que tendrá líneas)
    Y cambiando el ejecutar normal por el de transacciones 
    
    Ojo: Solo en transacciones, tambien en la clase Padre se tendría que colocar un try catch para 
    errores en tiempo de ejecución... Además el "catch" vendría a ser el rollback, */
    
    public void iniciarTransaccion()throws SQLException{
        con=getConnexion();
        con.setAutoCommit(false); //Desactiva el autocommit
    }
    
    public void confirmarTransaccion()throws SQLException{
        con.commit();
    }
    public void cancelarTransaccion()throws SQLException{
        try{
            con.rollback();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            cerrarConexion();
        }
    }
    
    
    //Capaz se pueda encapsular el código repetido entre el formarLlamada normal con el de transacciones.
    public CallableStatement formarLlamadaProcedimientoTransaccion(String nombreProcedimiento,
            Map<Integer, Object> parametrosEntrada, Map<Integer, Object> parametrosSalida) throws SQLException{
        con=getConnexion();
        StringBuilder call= new StringBuilder("{call "+nombreProcedimiento+"(");
        int cantParametrosEntrada=0;
        int cantParametrosSalida=0;
        if(parametrosEntrada!=null) cantParametrosEntrada=parametrosEntrada.size();
        if(parametrosSalida!=null) cantParametrosSalida=parametrosSalida.size();
        
        int numParametros=cantParametrosEntrada+cantParametrosSalida;
        for (int i = 0; i < numParametros; i++) {
            call.append("?"); //Call Append: Concatenar con caracteres
            if(i<numParametros-1){
                call.append(",");
            }
        }
        call.append(")}");
        return con.prepareCall(call.toString());
    }
    
    public int ejecutarProcedimientoTransaccion(String nombreProcedimiento,
            Map<Integer, Object> parametrosEntrada,
            Map<Integer, Object> parametrosSalida){
        int resultado=0;
        try{
            CallableStatement cst=formarLlamadaProcedimientoTransaccion(nombreProcedimiento, 
                    parametrosEntrada, parametrosSalida);
            if(parametrosEntrada!=null)
                registrarParametrosEntrada(cst, parametrosEntrada);
            if(parametrosSalida!=null)
                registrarParametrosSalida(cst, parametrosSalida);
            
            resultado=cst.executeUpdate();
            if(parametrosSalida!=null)
                obtenerValoresSalida(cst, parametrosSalida);
        }catch(SQLException ex){
            System.out.println("Error ejecutando procedimiento almacenado: " + ex.getMessage());
        }
        return resultado;
    }
}
