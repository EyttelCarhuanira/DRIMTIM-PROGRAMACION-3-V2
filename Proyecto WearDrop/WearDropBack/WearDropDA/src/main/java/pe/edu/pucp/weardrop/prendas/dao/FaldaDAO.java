/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.weardrop.prendas.dao;
import pe.edu.pucp.weardrop.prendas.Falda;
import pe.edu.pucp.weardrop.dao.IDAO;

import java.util.ArrayList;
/**
 *
 * @author valer
 */
public interface FaldaDAO extends IDAO<Falda>{
    ArrayList<Falda> filtrarFaldas(
        String nombreLike,
        String colorLike,
        String materialLike,
        String tipoFaldaLike,
        Boolean conForro,         // null no filtra
        Boolean conVolantes,      // null no filtra
        Double precioMin,
        Double precioMax,
        Double largoMin,
        Double largoMax,
        Boolean soloActivos       // null no filtra
    );
}

