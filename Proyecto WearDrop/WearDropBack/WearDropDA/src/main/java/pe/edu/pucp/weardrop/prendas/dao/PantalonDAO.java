/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.weardrop.prendas.dao;

import pe.edu.pucp.weardrop.dao.IDAO;
import pe.edu.pucp.weardrop.prendas.Pantalon;
import java.util.ArrayList;
/**
 *
 * @author valer
 */
public interface PantalonDAO extends IDAO<Pantalon>{
    ArrayList<Pantalon> filtrarPantalones(
        String nombreLike,
        String colorLike,
        String materialLike,
        String tipoPantalonLike,
        Boolean elasticidad,     // null no filtra
        Double precioMin,
        Double precioMax,
        Double largoMin,
        Double largoMax,
        Double cinturaMin,
        Double cinturaMax,
        Boolean soloActivos      // null no filtra
    );
}
