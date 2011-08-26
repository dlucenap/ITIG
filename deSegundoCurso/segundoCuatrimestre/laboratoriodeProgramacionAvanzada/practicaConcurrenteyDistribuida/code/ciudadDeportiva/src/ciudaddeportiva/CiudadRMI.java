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
import java.rmi.*;
import java.rmi.server.*;
import java.util.*;

public class CiudadRMI extends UnicastRemoteObject implements iCiudadRMI {

    //Constructor
    public CiudadRMI() throws RemoteException {
    }

    //Implementacion de metodos para RMI
    public ArrayList<PlantillaDeportista> estadoColaSaladeMusculacion() throws RemoteException {
        return CiudadDeportiva.saladeMusculacion.getColaInstalacion();
    }

    public ArrayList<PlantillaDeportista> estadoPistadeTenis() throws RemoteException {
        return CiudadDeportiva.pistadeTenis.getDeportistaInstalacion();
    }

    public void abrirSaladeMusculacion() throws RemoteException {
        CiudadDeportiva.saladeMusculacion.setAbierto(true);

    }

    public void cerrarSaladeMusculacion() throws RemoteException {
        CiudadDeportiva.saladeMusculacion.setAbierto(false);
    }
}
