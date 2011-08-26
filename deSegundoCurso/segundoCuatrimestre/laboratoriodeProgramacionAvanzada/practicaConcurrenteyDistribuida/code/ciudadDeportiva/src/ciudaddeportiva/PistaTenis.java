package ciudaddeportiva;

/*
 *
 * @author Diego Antonio Lucena Pumar (dlucenap).
 * Copyrigth: (C) 2010 para Diego Antonio Lucena Pumar.
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

public class PistaTenis extends Thread {

    //atributos de nuestra clase
    /** Variable en la que introducimos el numero maximo de deportistas */
    private final int maxDeportistas = 2;
    /** Para realizar la exclusion mutua debemos tener una variable que nos muestre
    si la sala esta llena o no*/
    private boolean lleno;
    /** Almacenamos en un array los datos de los deportistas que estan dentro de la sala de musculacion */
    private ArrayList<PlantillaDeportista> deportistaInstalacion;
    /** Almacenamos en un array los datos de los deportistas que estan en la cola de la sala de musculacion */
    private ArrayList<PlantillaDeportista> colaInstalacion;

    //constructores
    /** Constructor que pone  el local como  vacio e inicia los arrays de la sala. */
    public PistaTenis() {
        deportistaInstalacion = new ArrayList();
        colaInstalacion = new ArrayList();
        lleno = false;


    }

    /** Nos devuelve bool dependiendo si esta lleno */
    public boolean isLleno() {

        return (deportistaInstalacion.size() >= maxDeportistas);

    }

    /** Metodo que incrementaa en uno el numero de jugadores  */
    public int numerojugadores(int cont) {
        return cont = cont + 1;

    }

    /** Método que devuelve la lista de deportistas que hay dentro de la pista de tenis */
    public ArrayList<PlantillaDeportista> getDeportistaInstalacion() {
        return deportistaInstalacion;
    }

    /** Método que devuelve la lista de deportistas que hay en la cola de la pista de tenis */
    public ArrayList<PlantillaDeportista> getColaInstalacion() {
        return colaInstalacion;
    }

    /** Método que devuelve un string con los datos de los deportistas de la cola  */
    public synchronized String mostrarCola() {
        String muestra = "";
        for (int cont = 1; cont <= colaInstalacion.size(); cont++) {
            String varDeportitaAux = "<" + String.valueOf(colaInstalacion.get(cont - 1).getIdentificador()) + ">";
            if (cont % 7 == 0) {
                muestra = muestra + varDeportitaAux + "\n";
            } else {
                muestra = muestra + varDeportitaAux;
            }
        }
        return muestra;
    }

    public synchronized void imprimirJuego() {
        CiudadDeportiva.jTextPistadeTenis.setText("Jugando partida de tenis: <" + deportistaInstalacion.get(0).getIdentificador() + "> contra <" + deportistaInstalacion.get(1).getIdentificador() + ">");
    }

    /** Método que devuelve un string con los datos de los deportistas del interior del la  pista de tenis*/
    public synchronized String mostrarInstalacion() {
        String muestra = "";
        for (int cont = 1; cont <= deportistaInstalacion.size(); cont++) {
            String varDeportitaAux = "<" + String.valueOf(deportistaInstalacion.get(cont - 1).getIdentificador()) + ">";
            if (cont % 7 == 0) {
                muestra = muestra + varDeportitaAux + "\n";
            } else {
                muestra = muestra + varDeportitaAux;
            }
        }
        return muestra;
    }

    public synchronized void insertarenTenis(PlantillaDeportista c) {
       colaInstalacion.add(c);
       CiudadDeportiva.JTextColaPistadeTenis.setText(mostrarCola());
        //Esperamos en la cola hasta que haya sitio
        while (lleno==true){
           try{
               wait();
           }catch(InterruptedException e){
               JOptionPane.showMessageDialog(null,"Error: "+e.getMessage(),"Error",JOptionPane.INFORMATION_MESSAGE);
           }
        }

        colaInstalacion.remove(c);
        deportistaInstalacion.add(c);
        lleno = deportistaInstalacion.size() == maxDeportistas;
        CiudadDeportiva.JTextColaPistadeTenis.setText(mostrarCola());
        CiudadDeportiva.jTextPistadeTenis.setText(mostrarInstalacion());

    }

    public synchronized void quitarTenis(PlantillaDeportista c) {
        if (deportistaInstalacion.size() == 2) {
            deportistaInstalacion.remove(deportistaInstalacion.get(0));
            deportistaInstalacion.remove(deportistaInstalacion.get(0));
            CiudadDeportiva.jTextPistadeTenis.setText(mostrarInstalacion());
            lleno = false;
            notify();
            notify();
        } else {
            while (deportistaInstalacion.size() != 2) {
                try {
                    wait();
                } catch (InterruptedException e) {
                    JOptionPane.showMessageDialog(null, "Error: " + e.getMessage(), "Error", JOptionPane.INFORMATION_MESSAGE);
                }
                notify();
            }
        }
    }
}
