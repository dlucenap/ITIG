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
}

int
                simulador::exec_main_simulation(float tusuario)
{
    tiempo_simu = 0;
    tiempo_coche = 0;
    tiempo_simu += CTIEMPO;
    vehiculo       *
	nuevo_vehiculo;
    vehiculo       *
	vehiculoaux;
    while (tiempo_simu < tusuario) {
	if (tiempo_coche > tiempo_simu) {
	    vehiculoaux = nuevo_vehiculo->getnuevo_vehiculo();
	    vehiculoaux->ptranterior = simu1->c_vehiculos->ptrante;
	    simu1->c_vehiculos->ptrante = vehiculoaux;
	    simu1->c_vehiculos->insertarnodo(vehiculoaux);
	    vehiculoaux = nuevo_vehiculo->getnuevo_vehiculo();
	    vehiculoaux->ptranterior = simu2->c_vehiculos->ptrante;
	    simu2->c_vehiculos->ptrante = vehiculoaux;
	    simu2->c_vehiculos->insertarnodo(vehiculoaux);
	    std::cout << "Nuevos vehiculos en los carriles...\n" << std::
		endl;
	    getchar();
	} else {
	    std::cout << "Vehiculos no insertados...\n" << std::endl;
	    getchar();
	}
	// 
	simu1->c_vehiculos->actualizar_vehiculos();
	simu2->c_vehiculos->actualizar_vehiculos();
	// 
	if (simu1->c_vehiculos->getnum_coches() >= 5
	    && simu2->c_vehiculos->getnum_coches() >= 1) {
	    std::cout << "vehiculo llegando al stop...." << std::endl;
	    ptrentrada = simu1->c_vehiculos->calcular_ptr_entrada();
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
			ptraux = cola1.desencolar();
			ptraux->ptrsiguiente = ptrentrada->ptrsiguiente;
			ptrentrada->ptrsiguiente = ptraux;
			ptraux->ptranterior = ptrentrada;
			simu2->c_vehiculos->setnum_coches(simu2->
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
		    if (simu2->c_vehiculos->ptrprim->ptrsiguiente != 0) {
			std::
			    cout <<
			    "El vehiculo anterior esta en el perimetro de frenada...frenando"
			    << std::endl;
			simu2->c_vehiculos->ptrprim->ptranterior->
			    seta_n(0);
			cola1.encolar(simu2->c_vehiculos->ptrprim->
				      ptranterior);
			simu2->c_vehiculos->ptrprim->ptranterior =
			    simu2->c_vehiculos->ptrprim->ptranterior->
			    ptranterior;
			simu2->c_vehiculos->setnum_coches(simu2->
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
		simu1->c_vehiculos->ptrult->ptranterior =
		    simu2->c_vehiculos->ptrprim;
		simu2->c_vehiculos->ptrprim =
		    simu2->c_vehiculos->ptrprim->ptrsiguiente;
		simu2->c_vehiculos->setnum_coches(simu2->c_vehiculos->
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
	xi = simu1->c_vehiculos->devolv_sum_x_n();
	simu1->c_vehiculos->actualizar_vehiculos();
	xf = simu1->c_vehiculos->devolv_sum_x_n();
	v_media =
	    simu1->c_estadisticas->velocidad_media(xi, xf, tiempo_simu);
	d_media =
	    simu1->c_estadisticas->densidad_media(simu1->c_vehiculos->
						  ptrult->getx_n(),
						  simu1->c_vehiculos->
						  getnum_coches());

	ptrestadistico = new dato(v_media, d_media);
	simu1->c_estadisticas->insertarnodo(ptrestadistico);
	mostrar_estadisticas(v_media, d_media,
			     simu1->c_vehiculos->getnum_coches());
	tiempo_coche = tiempo_simu + (-0.3333) * log(1 - drand48());
	tiempo_simu += CTIEMPO;
    }
    return 0;
}
void
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    simulador::mostrar_estadisticas(float v_media, float d_media,
				    int num_coches)
{
    std::cout <<
	"************** ESTADISTICOS **************\n" << std::endl;

    std::cout <<
	"******************************************\n" << std::endl;

    std::cout << "VELOCIDAD MEDIA = " << v_media << " m/s\n" << std::endl;

    std::cout <<
	"DENSIDAD MEDIA = " << d_media << " vehiculos/m\n" << std::endl;

    std::cout <<
	"NUMERO DE VEHICULOS = " <<
	num_coches << " unidades\n" << std::endl;

    std::cout <<
	"******************************************\n" << std::endl;

    std::cout <<
	"******************************************\n" << std::endl;

    getchar();
}
