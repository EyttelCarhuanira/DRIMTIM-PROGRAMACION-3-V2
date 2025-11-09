/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package pe.edu.pucp.weardrop.prendas.mysql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import pe.edu.pucp.weardrop.config.DBManager;
import pe.edu.pucp.weardrop.prendas.PrendaLote;
import pe.edu.pucp.weardrop.prendas.Talla;
import pe.edu.pucp.weardrop.prendas.dao.PrendaLoteDAO;

public class PrendaLoteImpl implements PrendaLoteDAO {

    private ResultSet rs; // Para los SELECTs (cursor)

    @Override
    public int insertar(PrendaLote dat) {
        Map<Integer, Object> out = new HashMap<>();
        Map<Integer, Object> in  = new HashMap<>();
        // SP: insertar_prenda_lote(OUT id, IN idPrenda, idLote, talla, stock)
        out.put(1, Types.INTEGER);
        in.put(2, dat.getIdPrenda());
        in.put(3, dat.getIdLote());
        in.put(4, dat.getTalla().name());  // si tu enum expone getTalla(), usa eso
        in.put(5, dat.getStock());

        DBManager.getInstance().ejecutarProcedimiento("insertar_prenda_lote", in, out);

        int idGen = (int) out.get(1);
        dat.setIdPrendaLote(idGen);
        System.out.println("Se ha registrado PrendaLote id=" + idGen);
        return idGen;
    }

    @Override
    public int modificar(PrendaLote dat) {
        Map<Integer, Object> in = new HashMap<>();
        // SP: modificar_prenda_lote(IN idPrendaLote, IN stock, IN activo)
        in.put(1, dat.getIdPrendaLote());
        in.put(2, dat.getStock());
        in.put(3, dat.isActivo() ? 1 : 0);

        int res = DBManager.getInstance().ejecutarProcedimiento("modificar_prenda_lote", in, null);
        System.out.println("Se ha modificado PrendaLote id=" + dat.getIdPrendaLote());
        return res;
    }

    @Override
    public int eliminar(int idPrendaLote) {
        Map<Integer, Object> in = new HashMap<>();
        // SP: eliminar_prenda_lote(IN idPrendaLote) -> baja lógica (activo=0)
        in.put(1, idPrendaLote);

        int res = DBManager.getInstance().ejecutarProcedimiento("eliminar_prenda_lote", in, null);
        System.out.println("Baja lógica PrendaLote id=" + idPrendaLote);
        return res;
    }

    @Override
    public PrendaLote obtenerPorId(int idPrendaLote) {
        PrendaLote pl = null;

        Map<Integer, Object> in = new HashMap<>();
        // SP: obtener_prenda_lote_X_id(IN idPrendaLote) -> una fila por PK
        in.put(1, idPrendaLote);

        rs = DBManager.getInstance()
                .ejecutarProcedimientoLectura("obtener_prenda_lote_X_id", in);
        System.out.println("Lectura de PrendaLote por PK...");

        try {
            if (rs.next()) {
                pl = new PrendaLote();
                pl.setIdPrendaLote(rs.getInt("idPrendaLote"));
                pl.setIdPrenda(rs.getInt("Prenda_idPrenda"));
                pl.setIdLote(rs.getInt("Lote_idLote"));
                pl.setTalla(Talla.valueOf(rs.getString("talla")));
                pl.setStock(rs.getInt("stock"));
                pl.setActivo(rs.getBoolean("activo"));
            }
        } catch (SQLException ex) {
            System.out.println("ERROR al obtener por PK: " + ex.getMessage());
        } finally {
            DBManager.getInstance().cerrarConexion();
        }
        return pl;
    }

    @Override
    public ArrayList<PrendaLote> listarTodos() {
        ArrayList<PrendaLote> lista = null;
        rs = DBManager.getInstance().ejecutarProcedimientoLectura("mostrar_prenda_lote", null);
        System.out.println("Lectura de registros PrendaLote...");

        try {
            while (rs.next()) {
                if (lista == null) lista = new ArrayList<>();
                PrendaLote pl = new PrendaLote();

                pl.setIdPrendaLote(rs.getInt("idPrendaLote"));
                pl.setIdPrenda(rs.getInt("Prenda_idPrenda"));
                pl.setIdLote(rs.getInt("Lote_idLote"));
                pl.setTalla(Talla.valueOf(rs.getString("talla")));
                pl.setStock(rs.getInt("stock"));
                pl.setActivo(rs.getBoolean("activo"));

                lista.add(pl);
            }
            System.out.println("SE LISTARON TODOS LOS PRENDA LOTE CORRECTAMENTE.");
        } catch (SQLException ex) {
            System.out.println("ERROR al listar PrendaLote: " + ex.getMessage());
        } finally {
            DBManager.getInstance().cerrarConexion();
        }
        return lista;
    }

    @Override
    public int getStockPorTalla(int idPrenda, Talla talla) {
        Map<Integer, Object> in = new HashMap<>();
        // SP: obtener_stock_prenda_talla(IN idPrenda, IN talla)
        in.put(1, idPrenda);
        in.put(2, talla.name());

        int total = 0;
        rs = DBManager.getInstance()
                .ejecutarProcedimientoLectura("obtener_stock_prenda_talla", in);
        try {
            if (rs.next()) total = rs.getInt("stock_total");
        } catch (SQLException e) {
            System.out.println("ERROR stock por talla: " + e.getMessage());
        } finally {
            DBManager.getInstance().cerrarConexion();
        }
        return total;
    }
}
