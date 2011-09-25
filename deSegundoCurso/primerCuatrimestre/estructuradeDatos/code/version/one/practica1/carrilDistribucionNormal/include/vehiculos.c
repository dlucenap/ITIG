/***************************************************************************
 *            vehiculos.h
 *
 *  Mon Jan  5 00:17:49 2009
 *  Copyright  2009  Diego Antonio Lucena Pumar
 *  Email diego dot lucena dot pumar at gmail dot com
 ****************************************************************************/

/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#include "vehiculos.h"

vehiculos::vehiculos()
{
    ptrprim = 0;
    ptrult = 0;
    setnum_coches(0);
    // creamos el primer vehiculo
    vehiculo       *vehiculo1;
    vehiculo1 = new vehiculo;
    insertarnodo(vehiculo1);
    ptrante = vehiculo1;
    ptrult = vehiculo1;
    ptrprim = vehiculo1;
    std::cout << "Inicializamos la lista de vehiculos ...\n" << std::endl;
}
bool
vehiculos::esta_vacia()
{
    return (ptrprim == 0);
}
int
                vehiculos::insertarnodo(vehiculo * nodo)
{
    if (!esta_vacia()) {
	nodo->ptrsiguiente = ptrprim;
	ptrprim = nodo;
    } else {
	// la lista esta vacia
	ptrprim = nodo;
    }
    std::cout << "Vehiculo en lista..\n" << std::endl;
    setnum_coches((getnum_coches()) + 1);
    return 0;
}				// fin insertarnodo
void
                vehiculos::setnum_coches(int pnum_coches)
{
    num_coches = pnum_coches;
}
int
                vehiculos::getnum_coches()
{
    return num_coches;
}
int
                vehiculos::actualizar_vehiculos()
{
    if (getnum_coches() >= 2) {
	vehiculo       *
	    ptranterior;
	vehiculo       *
	    ptraux;
	ptranterior = ptrprim;
	ptraux = ptranterior->ptrsiguiente;
	do {
	    // actualizamos la velocidad para la lista de vehiculos
	    // preparamos la posicion

	    if (ptraux->getv_n() > 90.0)
		ptraux->setv_n(90.0);
	    ptraux->setx_n(ptraux->getx_n() + ptraux->getv_n() * CTIEMPO);
	    /*
	     * la formula se deduce de la velocidad media que es: delta de 
	     * x / delta de t, si depejamos para x_f = x_i +
	     * V_media*(t_f-t_i)
	     */
	    // despues actualizamos con la nueva velocidad
	    ptraux->
		setv_n(velocidad
		       (ptraux->getv_n(), ptranterior->geta_n(),
			ptranterior->getv_n(), ptraux->getV_n(),
			ptraux->getb_n(), ptraux->getb(), CTAU,
			ptranterior->getx_n(), ptranterior->gets_n()));
	    if (((ptranterior->getv_n() * ptranterior->getx_n()) >
		 (ptraux->getv_n() * ptraux->getx_n()))
		&& (getnum_coches() > 2)) {
		std::cout << "Se ha producido una colision...\n" << std::
		    endl;
		ptranterior->ptrsiguiente = ptraux->ptrsiguiente;
		std::
		    cout <<
		    "Los vehiculos estan fuera del carril...pulse una tecla para continuar\n"
		    << std::endl;
		getchar();
		// setnum_coches(getnum_coches() - 1);
	    }
	    // mejorar
	    if (ptranterior->ptrsiguiente != 0) {
		ptranterior = ptranterior->ptrsiguiente;
		ptraux = ptranterior->ptrsiguiente;
	    } else {
		ptraux = 0;
	    }
	} while (ptraux != 0);
    }
    return 0;
}
int
                vehiculos::eliminar_ultimo()
{
    if (!esta_vacia()) {
	vehiculo       *
	    ptraux;
	ptraux = ptrprim;
	while (ptraux->ptrsiguiente->ptrsiguiente != 0);
	ptraux = ptraux->ptrsiguiente;

	// debemos liberar previamente la memoria
	ptraux->ptrsiguiente = 0;
	setnum_coches(getnum_coches() - 1);
    }
    return 0;
}
float
                vehiculos::devolv_sum_x_n()
{
    float
                    sumx_n = 0;
    vehiculo       *
	ptraux;
    ptraux = ptrprim;
    while (ptraux != 0) {
	sumx_n += ptraux->getx_n();
	ptraux = ptraux->ptrsiguiente;
    }
    return sumx_n;
}
