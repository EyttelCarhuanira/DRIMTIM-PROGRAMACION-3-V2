/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.weardrop.prendas.dao;
import pe.edu.pucp.weardrop.prendas.Gorro;
import pe.edu.pucp.weardrop.dao.IDAO;
import java.util.ArrayList;
/**
 *
 * @author valer
 */
public interface GorroDAO extends IDAO<Gorro>{
    ArrayList<Gorro> filtrarGorros(
        String nombreLike,
        String colorLike,
        String materialLike,
        String tipoGorraLike,
        Boolean tallaAjustable,   // null no filtra
        Boolean impermeable,      // null no filtra
        Double precioMin,
        Double precioMax,
        Boolean soloActivos       // null no filtra
    );
}
