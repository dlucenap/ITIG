/***************************************************************************
 *            simulador.c
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

#include "simulador.h"

simulador::simulador()
{
    simu1 = new carril();
    simu2 = new carril();
    simu3 = new carril();
    intersec = new interseccion;
}

int
                simulador::exec_main_simulation(float tusuario)
{
    tiempo_simu = 0;
    tiempo_coche = 0;
    tiempo_simu += CTIEMPO;
    bandera = false;
    while (tiempo_simu < tusuario && !bandera) {
	if (tiempo_coche > tiempo_simu) {
	    vehiculo       *
		ptrvehiculo;
	    ptrvehiculo = new vehiculo;
	    // establecemos parametros para el nuevo vehiculo
	    px = (float) rand() / RAND_MAX;
	    ptrvehiculo->seta_n((-1 / 1.7) * log(1 - px));
	    px = (float) rand() / RAND_MAX;
	    ptrvehiculo->setb_n((-1 / 2.0) * log(1 - px));
	    if (-3 <= ((ptrvehiculo->getb_n() - 3) / 2)) {
		ptrvehiculo->setb(-3);
	    } else {
		ptrvehiculo->setb((ptrvehiculo->getb_n() - 3) / 2);
	    }
	    px = (float) rand() / RAND_MAX;
	    ptrvehiculo->sets_n((-1 / 6.5) * log(1 - px));
	    ptrvehiculo->setx_n(0.5);
	    px = (float) rand() / RAND_MAX;
	    ptrvehiculo->setV_n((-1 / 1.7) * log(1 - px));
	    ptrvehiculo->settau(CTAU);
	    // todos entran con 0.5 de distancia
	    ptrvehiculo->setv_n(0.10);
	    ptrvehiculo->ptranterior = simu1->c_vehiculos->ptrante;
	    simu1->c_vehiculos->ptrante = ptrvehiculo;
	    simu1->c_vehiculos->insertarnodo(ptrvehiculo);
	    std::cout << "Nuevo vehiculo en via principal...\n" << std::
		endl;
	    getchar();
	} else {
	    std::cout << "El vehiculo no ha sido generado...\n" << std::
		endl;
	    getchar();
	}
	simu1->c_vehiculos->actualizar_vehiculos();
	num_aleatorio = intersec->getnum_aleatorio();
	if (num_aleatorio >= 0.5) {
	    simu2->c_vehiculos->insertarnodo(simu1->c_vehiculos->ptrprim);
	    std::cout << "Vehiculo en carril derecho...\n" << std::endl;
	    getchar();
	} else {
	    simu3->c_vehiculos->insertarnodo(simu1->c_vehiculos->ptrprim);
	    std::cout << "Vehiculo en carril izquierdo...\n" << std::endl;
	    getchar();
	}
	printf("entra3 en uktu o\n");
	getchar();
	simu1->c_vehiculos->eliminar_ultimo();


	printf("actualiza\n");
	getchar();
	simu2->c_vehiculos->actualizar_vehiculos();
	simu3->c_vehiculos->actualizar_vehiculos();
	printf("sale\n");
	getchar();
	tiempo_coche = tiempo_simu + (-0.3333) * log(1 - drand48());
	tiempo_simu += CTIEMPO;
	if (simu1->c_vehiculos->getnum_coches() == 0) {
	    bandera = true;
	}
    }
    return 0;
}
