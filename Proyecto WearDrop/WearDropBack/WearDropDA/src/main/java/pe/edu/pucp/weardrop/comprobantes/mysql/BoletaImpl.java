package pe.edu.pucp.weardrop.comprobantes.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pe.edu.pucp.weardrop.comprobantes.Boleta;  // Cambié el paquete aquí
import pe.edu.pucp.weardrop.comprobantes.dao.BoletaDAO;  // Cambié el paquete aquí
import pe.edu.pucp.weardrop.config.DBManager;


public class BoletaImpl implements BoletaDAO {
    private Connection con;
//    private Statement st;
    private ResultSet rs;
    private CallableStatement cs; //Permite llamar a SProcedures

    @Override
    public int insertar(Boleta boleta) {
        int resultado =0;
        try{
            con=DBManager.getInstance().getConnexion();
            cs = con.prepareCall("{call insertar_boleta"+ 
                    "(?,?,?,?,?,?)");
            //para int cs.registerOutParameter(1, java.sql.Types.INTEGER);
            //Fecha |
            cs.setDate(1, new java.sql.Date(boleta.getFecha().getTime()));
            cs.setDouble(2, boleta.getTotal());
            cs.setDouble(3, boleta.getIGV());
            cs.setString(4, boleta.getMetodoDePago());
            cs.setString(5, boleta.getCorrelativo());
            cs.setString(6, boleta.getDNI());
            //Enum se envía como String
            //cs.setString(8,boleta.getCategoria().toString())
            cs.executeUpdate(); //PARA EJECUTAR INSERTS
            cs.getInt(1); //para recuperar el out
            resultado = boleta.getIdComprobante();
        }catch(Exception ex){
            System.out.println("Error al insertar " + ex.getMessage());
        }finally{
           DBManager.getInstance().cerrarConexion();
        }
        return resultado;
    }

    @Override
    public int modificar(Boleta boleta) {
        int resultado = 0;
        try {
            con=DBManager.getInstance().getConnexion();

            cs = con.prepareCall("{ call modificar_boleta(?, ?, ?, ?, ?, ?, ?) }");
            cs.setInt(1, boleta.getIdComprobante());
            cs.setTimestamp(2, new java.sql.Timestamp(boleta.getFecha().getTime()));
            cs.setDouble(3, boleta.getTotal());
            cs.setDouble(4, boleta.getIGV());
            cs.setString(5, boleta.getMetodoDePago());
            cs.setString(6, boleta.getCorrelativo());
            cs.setString(7, boleta.getDNI());

            resultado = cs.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Error al modificar boleta: " + ex.getMessage());
        } finally {
            DBManager.getInstance().cerrarConexion();
            try { if (cs != null) cs.close(); } catch (Exception e) {}
        }
        return resultado;
    }

    
    @Override
    public int eliminar(int idBoleta) {
        int resultado = 0;
        try {
            con=DBManager.getInstance().getConnexion();

            // Baja lógica: se marca como inactiva en la tabla padre
            cs = con.prepareCall("{ call eliminar_boleta(?) }");
            cs.setInt(1, idBoleta);
            resultado = cs.executeUpdate();

        } catch (Exception ex) {
            System.out.println("Error al desactivar boleta: " + ex.getMessage());
        } finally {
            DBManager.getInstance().cerrarConexion();
            try { if (cs != null) cs.close(); } catch (Exception e) {}
        }
        return resultado;
    }

    @Override
    public Boleta obtenerPorId(int idBoleta) {
        Boleta boleta = null;
        try{
            con=DBManager.getInstance().getConnexion();
            cs = con.prepareCall("{call obtener_boleta_x_id"+ 
                    "(?)");
            cs.setInt(1, idBoleta);
            rs = cs.executeQuery();
            if(rs.next()){
                boleta = new Boleta();
                boleta.setIdComprobante(rs.getInt("idComprobante"));
                boleta.setCorrelativo(rs.getString("Correlativo"));
                boleta.setFecha(rs.getDate("fecha"));
                boleta.setIGV(rs.getDouble("IGV"));
                boleta.setMetodoDePago(rs.getString("metodoDePago"));
                boleta.setTotal(rs.getDouble("total"));
                
                boleta.setDNI(rs.getString("DNI"));
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            DBManager.getInstance().cerrarConexion();
        }
        return boleta;
    }

    @Override
    public ArrayList<Boleta> listarTodos() {
        ArrayList<Boleta> boletas = null;
        rs = DBManager.getInstance().ejecutarProcedimientoLectura("listar_boletas_todas", null);
        System.out.println("Lectura de todas las boletas");
        try{
            while(rs.next()){
                if(boletas==null) boletas = new ArrayList<>();
                Boleta boleta = new Boleta();
                boleta.setIdComprobante(rs.getInt("idComprobante"));
                boleta.setCorrelativo(rs.getString("Correlativo"));
                boleta.setFecha(rs.getDate("fecha"));
                boleta.setIGV(rs.getDouble("IGV"));
                boleta.setMetodoDePago(rs.getString("metodoDePago"));
                boleta.setTotal(rs.getDouble("total"));
                boleta.setDNI(rs.getString("DNI"));
                boletas.add(boleta);
            }
        }catch(SQLException ex){
            System.out.println("ERROR "+ex.getMessage());
        }finally{
            DBManager.getInstance().cerrarConexion();
        }
        return boletas;
    }


}