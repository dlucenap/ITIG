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
    simu4 = new carril();
    simu5 = new carril();
    intersec = new interseccion;
}
void
simulador::exec_simulacion_carril(vehiculos * cv,
				  vehiculos * cvp,
				  Cola < vehiculo > *colap,
				  Cola < vehiculo > *colas,
				  float tusuario, semaforo * sema1,
				  semaforo * sema2)
{
    if (!colas->estavacia()) {
	while (colas->ptrult != 0) {
	    std::
		cout << "Incorporando vehiculos a la via principal...\n" <<
		std::endl;
	    cvp->insertarnodo(colas->desencolar());
	}
	std::
	    cout <<
	    "El carril no tiene mas vehiculos...pulse una tecla para continuar\n"
	    << std::endl;
	getchar();
    }
    tiempo_simu = 0;
    tiempo_coche = 0;
    tiempo_simu += CTIEMPO;

    vehiculo       *nuevo_vehiculo;
    while (tiempo_simu < tusuario) {
	if (tiempo_coche > tiempo_simu) {
	    cv->insertarnodo(nuevo_vehiculo->getnuevo_vehiculo());
	    std::
		cout << "Nuevo vehiculo insertado en la lista...\n" <<
		std::endl;
	} else {
	    std::
		cout << "Vehiculo no insertado... no dispone de tiempo\n"
		<< std::endl;
	}
	cv->actualizar_vehiculos();
	tiempo_coche = tiempo_simu + (-0.3333) * log(1 - drand48());
	tiempo_simu += CTIEMPO;
    }
    sema1->change();
    std::cout << "El semaforo " << sema1->
	name << " se pone en ambar...pulse una tecla para continuar...\n"
	<< std::endl;
    getchar();
    std::cout << "Parando vehiculos..." << std::endl;
    cv->ptrult->seta_n(0);
    vehiculo       *ptraux;
    ptraux = cv->ptrult->ptranterior;
    std::cout << "El semaforo " << sema1->
	name << " se pone en rojo y el semaforo" << sema2->
	name << " en verde...pulse una tecla para continuar...\n" << std::
	endl;
    getchar();
    while (ptraux != 0) {
	std::cout << "la velocidad del primer vehiculo es: " << cv->
	    ptrprim->geta_n() << std::endl;
	getchar();
	ptraux->seta_n(0);
	ptraux = ptraux->ptranterior;
	std::cout << "." << std::endl;
	colap->encolar(ptraux);
	ptraux = ptraux->ptranterior;
    }
    std::
	cout << "Carril parado...pulse una tecla para continuar..." <<
	std::endl;
    getchar();
    sema1->change();
    sema2->change();
    std::cout << "Simulacion de carril terminada...\n" << std::endl;
}
int
                simulador::exec_main_simulation(float tusuario)
{
    // generador
    tiempo_simu = 0;
    tiempo_coche = 0;
    tiempo_simu += CTIEMPO;
    while (tiempo_simu < tusuario) {
	if (tiempo_coche > tiempo_simu) {
	    simu1->c_vehiculos->insertarnodo(nuevo_vehiculo->
					     getnuevo_vehiculo());
	    std::
		cout << "Nuevo vehiculo insertado en la lista...\n" <<
		std::endl;
	} else {
	    std::
		cout << "Vehiculo no insertado... no dispone de tiempo\n"
		<< std::endl;
	}
	tiempo_coche = tiempo_simu + (-0.3333) * log(1 - drand48());
	tiempo_simu += CTIEMPO;
    }
    // semaforo
    // inicializamos
    sema1.setestado(VERDE);
    sema2.setestado(ROJO);
    sema1.name = 1;
    sema2.name = 2;
    cvp = simu1->c_vehiculos;
    cv1 = simu2->c_vehiculos;
    exec_simulacion_carril(cv1, cvp, &cola1, &cola2,
			   tusuario, &sema1, &sema2);
    simu2 = new carril();
    cv2 = simu3->c_vehiculos;
    exec_simulacion_carril(cv2, cvp, &cola2, &cola1,
			   tusuario, &sema2, &sema1);
    std::cout << "Simulacion de semaforo terminada...\n" << std::endl;
    getchar();
    // desviacion
    bandera = false;
    tiempo_simu = 0;
    tiempo_coche = 0;
    tiempo_simu += CTIEMPO;
    tiempo_simu = 0;
    tiempo_coche = 0;
    tiempo_simu += CTIEMPO;
    // while (tiempo_simu < (tusuario / 4) &&
    // simu1->c_vehiculos->getnum_coches() != 0) {
    simu1->c_vehiculos->actualizar_vehiculos();
    num_aleatorio = intersec->getnum_aleatorio();
    if (num_aleatorio >= 0.5) {
	simu4->c_vehiculos->insertarnodo(simu1->c_vehiculos->ptrprim);
	std::cout << "Vehiculo en carril derecho...\n" << std::endl;
	getchar();
    } else {
	simu5->c_vehiculos->insertarnodo(simu1->c_vehiculos->ptrprim);
	std::cout << "Vehiculo en carril izquierdo...\n" << std::endl;
	getchar();
    }
    // simu1->c_vehiculos->eliminar_ultimo();
    // simu2->c_vehiculos->actualizar_vehiculos();
    // simu3->c_vehiculos->actualizar_vehiculos();
    // if (simu1->c_vehiculos->getnum_coches() == 0) {
    // bandera = true;
    // }
    tiempo_coche = tiempo_simu + (-0.3333) * log(1 - drand48());
    tiempo_simu += CTIEMPO;
    // }
    tiempo_simu = 0;
    tiempo_coche = 0;
    tiempo_simu += CTIEMPO;
    // Stop
    while (tiempo_simu < (tusuario / 4)) {
	// 
	simu4->c_vehiculos->actualizar_vehiculos();
	simu3->c_vehiculos->actualizar_vehiculos();
	// 
	if (simu4->c_vehiculos->getnum_coches() >= 5
	    && simu3->c_vehiculos->getnum_coches() >= 1) {
	    std::cout << "vehiculo llegando al stop...." << std::endl;
	    ptrentrada = simu4->c_vehiculos->calcular_ptr_entrada();
	    if (ptrentrada != 0) {
		xn = 1500 - ptrentrada->getx_n();
		if (xn < 500) {
		    std::
			cout <<
			"Vehiculo incorporandose... tiene distancia suficiente"
			<< std::endl;
		    if (!cola1.estavacia()) {
			vehiculo       *
			    ptraux;
			ptraux = cola2.desencolar();
			ptraux->ptrsiguiente = ptrentrada->ptrsiguiente;
			ptrentrada->ptrsiguiente = ptraux;
			ptraux->ptranterior = ptrentrada;
			simu3->c_vehiculos->setnum_coches(simu3->
							  c_vehiculos->
							  getnum_coches() -
							  1);
			std::
			    cout << "Vehiculo en via principal..." << std::
			    endl;
			getchar();
		    }
		} else {
		    std::
			cout <<
			"El vehiculo no puede incorporarse de manera que esperara..."
			<< std::endl;
		    getchar();
		    if (simu3->c_vehiculos->ptrprim->ptrsiguiente != 0) {
			std::
			    cout <<
			    "El vehiculo anterior esta en el perimetro de frenada...frenando"
			    << std::endl;
			simu3->c_vehiculos->ptrprim->ptranterior->
			    seta_n(0);
			cola1.encolar(simu3->c_vehiculos->ptrprim->
				      ptranterior);
			simu3->c_vehiculos->ptrprim->ptranterior =
			    simu3->c_vehiculos->ptrprim->ptranterior->
			    ptranterior;
			simu3->c_vehiculos->setnum_coches(simu3->
							  c_vehiculos->
							  getnum_coches() -
							  1);
		    }
		}
	    } else {
		std::
		    cout <<
		    "No hay vehiculo que intercepte al vehiculo parado en el Stop. Incorporandose..."
		    << std::endl;
		simu2->c_vehiculos->ptrult->ptranterior =
		    simu2->c_vehiculos->ptrprim;
		simu3->c_vehiculos->ptrprim =
		    simu2->c_vehiculos->ptrprim->ptrsiguiente;
		simu3->c_vehiculos->setnum_coches(simu3->c_vehiculos->
						  getnum_coches() - 1);
		std::cout << "Vehiculo en via principal..." << std::endl;
		getchar();
	    }
	} else {
	    std::
		cout <<
		"No es posible la simulacion, deben incoporarse mas coches a la via..."
		<< std::endl;
	    getchar();
	}
	tiempo_coche = tiempo_simu + (-0.3333) * log(1 - drand48());
	tiempo_simu += CTIEMPO;
    }
    std::cout << "FINNNNNNNN\n" << std::endl;
    getchar();
    return 0;

}
