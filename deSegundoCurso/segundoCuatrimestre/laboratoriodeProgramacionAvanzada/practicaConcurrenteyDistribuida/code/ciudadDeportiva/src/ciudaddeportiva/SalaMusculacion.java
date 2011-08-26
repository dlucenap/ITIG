package ciudaddeportiva;

/*
 *
 * @author Diego Antonio Lucena Pumar (dlucenap).
 * (C) 2010 para Diego Antonio Lucena Pumar.
 * License:
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
import java.util.*;
import javax.swing.*;

public class SalaMusculacion extends Thread {

    private int DeportistasMas = 9;
    private int DeportistasFem = 6;
    private boolean llenoMas;
    private boolean llenoFem;
    private boolean abierto;
    private ArrayList<PlantillaDeportista> deportistaInstalacionMas;
    private ArrayList<PlantillaDeportista> deportistaInstalacionFem;
    private ArrayList<PlantillaDeportista> colaInstalacion;

    public SalaMusculacion() {
        deportistaInstalacionMas = new ArrayList();
        deportistaInstalacionFem = new ArrayList();
        colaInstalacion = new ArrayList();
        llenoMas = false;
        llenoFem = false;
        abierto = true;
        CiudadDeportiva.jLabelEstadoSala.setText("Estado de la Sala: Abierta");
    }

    public boolean estaLlenoMas() {

        return (deportistaInstalacionMas.size() >= DeportistasMas);

    }

    public boolean estaLlenoFem() {

        return (deportistaInstalacionMas.size() >= DeportistasMas);

    }

    public boolean estaAbierto() {
        return abierto;
    }

    /** Método que abre o cierra la Sala de musculacion */
    public synchronized void setAbierto(boolean abierto) {
        if (abierto == true) {
            if ((this.abierto == false) && (deportistaInstalacionMas.size() == DeportistasMas) && (deportistaInstalacionMas.size() == DeportistasMas)) {
                System.out.println("Deportistas terminando el ejercicio...");
            } else {
                CiudadDeportiva.jLabelEstadoSala.setText("Estado de la Sala: Abierta");
                this.abierto = abierto;
                notifyAll();
            }
        } else {
            CiudadDeportiva.jLabelEstadoSala.setText("Estado de la Sala: Cerrada");
            this.abierto = abierto;
            if (colaInstalacion.size() > 0) {
                llenoMas = false;
                llenoFem = false;
                notifyAll();
            }
        }
    }

    public ArrayList<PlantillaDeportista> getDeportistaInstalacion() {

        ArrayList<PlantillaDeportista> varALAux = new ArrayList<PlantillaDeportista>();
        int i;
        i = 0;
        for (i = 0; i < deportistaInstalacionMas.size(); i++) {
            varALAux.add(deportistaInstalacionMas.get(i));
        }
        i = 0;
        for (i = 0; i < deportistaInstalacionFem.size(); i++) {
            varALAux.add(deportistaInstalacionFem.get(i));
        }
        return varALAux;
    }

    public ArrayList<PlantillaDeportista> getColaInstalacion() {
        return colaInstalacion;
    }

    public synchronized String mostrarCola() {
        String StrAux = "";
        int i;
        i = 0;
        for (i = 0; i < colaInstalacion.size(); i++) {
            StrAux = StrAux + "<" + colaInstalacion.get(i).getIdentificador() + ">";
        }
        return StrAux;
    }

    public synchronized String mostrarInstalacion() {
        String StrAuxMas = "Desportistas Masculinos: ";
        String StrAuxFem = "\nDesportistas Femeninos: ";
        int i;
        i = 0;
        for (i = 0; i < deportistaInstalacionMas.size(); i++) {
            StrAuxMas = StrAuxMas + "<" + deportistaInstalacionMas.get(i).getIdentificador() + ">";
        }
        i = 0;
        for (i = 0; i < deportistaInstalacionFem.size(); i++) {
            StrAuxFem = StrAuxFem + "<" + deportistaInstalacionFem.get(i).getIdentificador() + ">";
        }

        return (StrAuxMas + StrAuxFem);
    }

    /** Método que introduce un deportista en la cola de la sala de musculación. */
    public synchronized void insertarColaMusculacion(PlantillaDeportista c) {

        colaInstalacion.add(c);
        CiudadDeportiva.JTextColaSaladeMusculacion.setText(mostrarCola());


    }

    /** Método que introduce un deportista en la sala de musculacion. Si está lleno o abierto, espera en la cola  */
    public synchronized void insertarenMusculacion(PlantillaDeportista pPlantillaDeportista) {
        if (pPlantillaDeportista.getIdentificador() % 2 == 0) {
            insertarenMusculacionMas(pPlantillaDeportista);
        } else {
            insertarenMusculacionFem(pPlantillaDeportista);
        }
    }

    public synchronized void insertarenMusculacionMas(PlantillaDeportista pPlantillaDeportista) {
        while ((llenoMas == true) || (abierto == false)) {
            try {
                wait();
            } catch (InterruptedException e) {
                System.out.println(e.getMessage());
            }
        }
        notify();
        colaInstalacion.remove(pPlantillaDeportista);
        deportistaInstalacionMas.add(pPlantillaDeportista);
        llenoMas = deportistaInstalacionMas.size() == DeportistasMas;
        CiudadDeportiva.JTextColaSaladeMusculacion.setText(mostrarCola());
        CiudadDeportiva.jTextSaladeMusculacion.setText(mostrarInstalacion());
    }

    public synchronized void insertarenMusculacionFem(PlantillaDeportista pPlantillaDeportista) {
        while ((llenoFem == true) || (abierto == false)) {
            try {
                wait();
            } catch (InterruptedException e) {
                System.out.println(e.getMessage());
            }
        }
        notify();
        colaInstalacion.remove(pPlantillaDeportista);
        deportistaInstalacionFem.add(pPlantillaDeportista);
        llenoFem = deportistaInstalacionFem.size() == DeportistasFem;
        CiudadDeportiva.JTextColaSaladeMusculacion.setText(mostrarCola());
        CiudadDeportiva.jTextSaladeMusculacion.setText(mostrarInstalacion());
    }

    /** Metodo cuando un deportista abandona la sala de musculación*/
    public synchronized void quitarMusculacion(PlantillaDeportista pPlantillaDeportista) {

        if (pPlantillaDeportista.getIdentificador() % 2 == 0) {
            deportistaInstalacionMas.remove(pPlantillaDeportista);
            llenoMas = false;
        } else {
            deportistaInstalacionFem.remove(pPlantillaDeportista);
            llenoFem = false;

        }
        CiudadDeportiva.jTextSaladeMusculacion.setText(mostrarInstalacion());
        notify();

    }
}
