/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.weardrop.personal.mysql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import pe.edu.pucp.weardrop.config.DBManager;
import pe.edu.pucp.weardrop.personal.CuentaUsuario;
import pe.edu.pucp.weardrop.personal.TipoCuenta;
import pe.edu.pucp.weardrop.personal.dao.CuentaUsuarioDAO;
import pe.edu.pucp.weardrop.personal.dao.TipoCuentaDAO;

/**
 *
 * @author HP
 */
public class CuentaUsuarioImpl implements CuentaUsuarioDAO{
    
    private ResultSet rs;

    @Override
    public int insertar(CuentaUsuario cuentaUsuario) {
        Map<Integer,Object> parametrosSalida = new HashMap<>();   
        Map<Integer,Object> parametrosEntrada = new HashMap<>();
        parametrosSalida.put(1, Types.INTEGER);
        parametrosEntrada.put(2, cuentaUsuario.getUsername());
        parametrosEntrada.put(3, cuentaUsuario.getContrasenha());
        parametrosEntrada.put(4, cuentaUsuario.getEmail());
        parametrosEntrada.put(5, cuentaUsuario.getTipo().getIdTipoCuenta());
        DBManager.getInstance().ejecutarProcedimiento("insertar_cuentaUsuario",
	         parametrosEntrada, parametrosSalida);
        cuentaUsuario.setIdCuenta((int) parametrosSalida.get(1));
        System.out.println("Se ha realizado el registro de la cuenta usuario");
        return cuentaUsuario.getIdCuenta();
    }

    @Override
    public int modificar(CuentaUsuario cuentaUsuario) {
        Map<Integer,Object> parametrosEntrada = new HashMap<>();
        parametrosEntrada.put(1,cuentaUsuario.getIdCuenta());
        parametrosEntrada.put(2, cuentaUsuario.getUsername());
        parametrosEntrada.put(3, cuentaUsuario.getContrasenha());
        parametrosEntrada.put(4, cuentaUsuario.getEmail());
        parametrosEntrada.put(5, cuentaUsuario.getTipo().getIdTipoCuenta());
        int resultado = DBManager.getInstance().ejecutarProcedimiento("modificar_cuentaUsuario", parametrosEntrada, null);
        System.out.println("Se ha realizado la modificacion de la cuenta usuario");
        return resultado;    
    }

    @Override
    public int eliminar(int idCuentaUsuario) {
        Map<Integer,Object> parametrosEntrada = new HashMap<>();
        parametrosEntrada.put(1, idCuentaUsuario);
        int resultado = DBManager.getInstance().ejecutarProcedimiento("eliminar_cuentaUsuario", parametrosEntrada, null);
        System.out.println("Se ha realizado la eliminacion de la cuenta usuario");
        return resultado;    
    }

    @Override
    public CuentaUsuario obtenerPorId(int idCuentaUsuario) {
        CuentaUsuario cu = null;
        Map<Integer, Object> parametrosEntrada = new HashMap<>();
        parametrosEntrada.put(1, idCuentaUsuario);
        rs = DBManager.getInstance().ejecutarProcedimientoLectura("obtener_cuentaUsuarios_X_id", parametrosEntrada);
        System.out.println("Lectura de cuentausuario...");
        try{
            while(rs.next()){
                if(cu == null) cu = new CuentaUsuario();
                cu.setIdCuenta(rs.getInt("idCuenta"));
                cu.setUsername(rs.getString("username"));
                cu.setContrasenha(rs.getString("contrasenha"));
                cu.setEmail(rs.getString("email"));
                cu.setActivo(rs.getBoolean("activo"));
                
                TipoCuenta tc = new TipoCuenta();
                tc.setIdTipoCuenta(rs.getInt("idTipoCuenta"));
                tc.setDescripcion(rs.getString("descripcion"));
                
                cu.setTipo(tc);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            DBManager.getInstance().cerrarConexion();
        }
        return cu;    
    }

    @Override
    public ArrayList<CuentaUsuario> listarTodos() {
        ArrayList<CuentaUsuario> cuentaUsuarios = null;
        rs = DBManager.getInstance().ejecutarProcedimientoLectura("mostrar_cuentaUsuarios", null);
        System.out.println("Lectura de cuenta usuarios...");
        try{
            while(rs.next()){
                if(cuentaUsuarios == null) cuentaUsuarios = new ArrayList<>();
                CuentaUsuario cu = new CuentaUsuario();
                cu.setIdCuenta(rs.getInt("idCuenta"));
                cu.setUsername(rs.getString("username"));
                cu.setContrasenha(rs.getString("contrasenha"));
                cu.setEmail(rs.getString("email"));
                cu.setActivo(true);
                
                TipoCuenta tc = new TipoCuenta();
                tc.setIdTipoCuenta(rs.getInt("idTipoCuenta"));
                tc.setDescripcion(rs.getString("descripcion"));
                
                cu.setTipo(tc);
                
                cuentaUsuarios.add(cu);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            DBManager.getInstance().cerrarConexion();
        }
        return cuentaUsuarios;    
    }
    

    
}
