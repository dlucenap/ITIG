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
import java.io.*;

public class PlantillaDeportista implements Serializable {

    private int identificador;

    PlantillaDeportista(int pIdentificador) {

        identificador = pIdentificador;
    }

    public int getIdentificador() {
        return identificador;
    }

    public void setIdentificador(int pIdentificador) {
        identificador = pIdentificador;
    }
}
