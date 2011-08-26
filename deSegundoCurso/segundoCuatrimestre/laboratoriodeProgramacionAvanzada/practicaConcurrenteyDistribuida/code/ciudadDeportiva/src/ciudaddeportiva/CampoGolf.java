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

public class CampoGolf extends Thread {

    //Variables de sincronizacion para exclusion mutua
    private boolean llenoHoyo1;
    private boolean llenoHoyo2;
    private boolean llenoHoyo3;
    private boolean llenoHoyo4;
    //Almacenes para cada hoyo
    private ArrayList<PlantillaDeportista> deportistaHoyo1;
    private ArrayList<PlantillaDeportista> deportistaHoyo2;
    private ArrayList<PlantillaDeportista> deportistaHoyo3;
    private ArrayList<PlantillaDeportista> deportistaHoyo4;
    //Alamacen para intalacion
    private ArrayList<PlantillaDeportista> colaInstalacion;
    //Numero total de deportistas por hoyo
    private int numMaximoDeportistas = 1;

    //Construye el campo de Golf
    public CampoGolf() {

        //Almacenes
        deportistaHoyo1 = new ArrayList();
        deportistaHoyo2 = new ArrayList();
        deportistaHoyo3 = new ArrayList();
        deportistaHoyo4 = new ArrayList();
        colaInstalacion= new ArrayList();

        //Variables de recurso compartido, una por hoyo
        llenoHoyo1 = false;
        llenoHoyo2 = false;
        llenoHoyo3 = false;
        llenoHoyo4 = false;

    }

    //Variables de control para recurso compartido, una por hoyo.
    public boolean estaLlenoHoyo1() {

        return (deportistaHoyo1.size() >= numMaximoDeportistas);

    }

    public boolean estaLlenoHoyo2() {

        return (deportistaHoyo2.size() >= numMaximoDeportistas);

    }

    public boolean estaLlenoHoyo3() {

        return (deportistaHoyo3.size() >= numMaximoDeportistas);

    }

    public boolean estaLlenoHoyo4() {

        return (deportistaHoyo4.size() >= numMaximoDeportistas);
    }

    //Metodo que devuelve cadena con el numero de deportistas en cola (para impresion)
    public synchronized String imprimirColadeCampodeGolf() {
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

    //Metodos que devuelven cadena con el numero de deportistas en cada hoyo (para impresion)
    //Nota: En este caso concreto, uno.
    public synchronized String mostrarHoyo1() {

        if (deportistaHoyo1.size() > 0) {
            return "<" + String.valueOf(deportistaHoyo1.get(0).getIdentificador()) + ">";
        } else {
            return "";
        }
    }

    public synchronized String mostrarHoyo2() {

        if (deportistaHoyo2.size() > 0) {
            return "<" + String.valueOf(deportistaHoyo2.get(0).getIdentificador()) + ">";
        } else {
            return "";
        }
    }

    public synchronized String mostrarHoyo3() {

        if (deportistaHoyo3.size() > 0) {
            return "<" + String.valueOf(deportistaHoyo3.get(0).getIdentificador()) + ">";
        } else {
            return "";
        }
    }

    public synchronized String mostrarHoyo4() {

        if (deportistaHoyo4.size() > 0) {
            return "<" + String.valueOf(deportistaHoyo4.get(0).getIdentificador()) + ">";
        } else {
            return "";
        }
    }

    //----- CONSUMIDORES
    //Metodos que controlan la insercion de cada deportista
    public synchronized void consumidorHoyo1(PlantillaDeportista pPlantillaDeportista) {
        //Añade por defecto para espera
        colaInstalacion.add(pPlantillaDeportista);
        CiudadDeportiva.JTextColaCampodeGolf.setText(imprimirColadeCampodeGolf());

        while (estaLlenoHoyo1() == true) {
            try {
                //Espera
                wait();
            } catch (InterruptedException e) {
                System.out.println(e.getMessage());
            }
        }
        //Activa
        notifyAll();

        //Inserta deportista en el hoyo
        colaInstalacion.remove(pPlantillaDeportista);
        deportistaHoyo1.add(pPlantillaDeportista);

        //Muestra texto
        CiudadDeportiva.JTextColaCampodeGolf.setText(imprimirColadeCampodeGolf());
        CiudadDeportiva.JTextHoyo1.setText(mostrarHoyo1());
        try {
            //Descansa
            sleep((((long) (Math.random() * (200)) + 400)));
        } catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }

    }

    public synchronized void consumidorHoyo2(PlantillaDeportista pPlantillaDeportista) {

        while (estaLlenoHoyo2() == true) {
            try {
                wait();
            } catch (InterruptedException e) {
                System.out.println(e.getMessage());
            }
        }
        notifyAll();
        deportistaHoyo1.remove(pPlantillaDeportista);
        deportistaHoyo2.add(pPlantillaDeportista);

        CiudadDeportiva.JTextHoyo1.setText(mostrarHoyo1());
        CiudadDeportiva.JTextHoyo2.setText(mostrarHoyo2());
        try {
            sleep((((long) (Math.random() * (200)) + 400)));
        } catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }
    }

    public synchronized void consumidorHoyo3(PlantillaDeportista pPlantillaDeportista) {

        while (estaLlenoHoyo3() == true) {
            try {
                wait();
            } catch (InterruptedException e) {
                System.out.println(e.getMessage());
            }
        }
        notifyAll();
        deportistaHoyo2.remove(pPlantillaDeportista);
        deportistaHoyo3.add(pPlantillaDeportista);

        CiudadDeportiva.JTextHoyo2.setText(mostrarHoyo2());
        CiudadDeportiva.JTextHoyo3.setText(mostrarHoyo3());
        try {
            sleep((((long) (Math.random() * (200)) + 400)));
        } catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }
    }

    public synchronized void consumidorHoyo4(PlantillaDeportista pPlantillaDeportista) {

        while (estaLlenoHoyo4() == true) {
            try {
                wait();
            } catch (InterruptedException e) {
                System.out.println(e.getMessage());
            }
        }
        notifyAll();
        deportistaHoyo3.remove(pPlantillaDeportista);
        deportistaHoyo4.add(pPlantillaDeportista);

        CiudadDeportiva.JTextHoyo3.setText(mostrarHoyo3());
        CiudadDeportiva.JTextHoyo4.setText(mostrarHoyo4());
        try {
            sleep((((long) (Math.random() * (200)) + 400)));
        } catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }
    }

    //El deportista abandona la instalacion
    public synchronized void productorCampodeGolf(PlantillaDeportista pPlantillaDeportista) {
        deportistaHoyo4.remove(pPlantillaDeportista);
        CiudadDeportiva.JTextHoyo4.setText(mostrarHoyo4());
        notifyAll();
    }
}
