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
}
void
simulador::exec_simulacion_carril(vehiculos * cv,
				  estadisticas * ptrestadisticas,
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
	// obtenemos datos de este instante t-1 para calcular
	// posteriormente la estadistica de posticion
	xi = cv->devolv_sum_x_n();
	cv->actualizar_vehiculos();
	// una vez actualizados los vehiculos confecionamos las
	// estadisticas para t ...
	// actualizar estadisticas
	xf = cv->devolv_sum_x_n();
	// calculamos la velocidad media para todos los vehiculos
	v_media = (xf - xi) / tiempo_simu;
	// calculamos la densidad media para todos los vehiculos
	d_media = cv->ptrprim->getx_n() / cv->getnum_coches();
	dato           *ptrestadistico;
	ptrestadistico = new dato(v_media,d_media);
	ptrestadisticas->insertarnodo(ptrestadistico);
	mostrar_estadisticas(v_media, d_media, cv->getnum_coches());
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
    float           sum_d_media_general = 0;
    float           sum_v_media_general = 0;
    dato           *ptrauxdato;
    ptrauxdato = ptrestadisticas->ptrprim;
    do {
	sum_d_media_general += ptrauxdato->getd_media();
	sum_v_media_general += ptrauxdato->getv_media();
	ptrauxdato = ptrauxdato->ptrsiguiente;
    } while (ptrauxdato != 0);
    estadisticas_genereales(ptrestadisticas->ptrprim, v_media, d_media,
			    cv->getnum_coches());
    std::cout << "Simulacion de carril terminada...\n" << std::endl;
}
int
                simulador::exec_main_simulation(float tusuario)
{
    // inicializamos
    sema1.setestado(VERDE);
    sema2.setestado(ROJO);
    sema1.name = 1;
    sema2.name = 2;
    // para el otro carril est� rojo
    simup = new carril();
    simu1 = new carril();
    vehiculos      *
	cv1;
    vehiculos      *
	cv2;
    vehiculos      *
	cvp;
    estadisticas   *
	ptrestadisticas;
    cvp = simup->c_vehiculos;
    cv1 = simu1->c_vehiculos;
    ptrestadisticas = simu1->c_estadisticas;
    exec_simulacion_carril(cv1, ptrestadisticas, cvp, &cola1, &cola2,
			   tusuario, &sema1, &sema2);
    simu2 = new carril();
    cv2 = simu2->c_vehiculos;
    ptrestadisticas = simu2->c_estadisticas;
    exec_simulacion_carril(cv2, ptrestadisticas, cvp, &cola2, &cola1,
			   tusuario, &sema2, &sema1);
    std::cout << "Simulacion de semaforo terminada...\n" << std::endl;
    getchar();
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

void















 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    simulador::estadisticas_genereales(dato * datoaux, float v_media,
				       float d_media, int num_coches)
{
    float
                    sum_d_media_general = 0;
    float
                    sum_v_media_general = 0;
    // ptraux = simu.c_estadisticas->ptrprim;
    do {
	sum_d_media_general += datoaux->getd_media();
	sum_v_media_general += datoaux->getv_media();
	datoaux = datoaux->ptrsiguiente;
    } while (datoaux != 0);
    std::cout << "********* ESTADISTICOS GENERALES *********\n" << std::
	endl;

    std::cout << "******************************************\n" << std::
	endl;

    std::cout << "VELOCIDAD MEDIA GENERAL = " << sum_v_media_general /
	num_coches << " m/s\n" << std::endl;

    std::cout << "DENSIDAD MEDIA GENERAL = " << sum_d_media_general /
	num_coches << " vehiculos/m\n" << std::endl;

    std::
	cout << "NUMERO DE VEHICULOS = " << num_coches << " unidades\n" <<
	std::endl;

    std::cout << "******************************************\n" << std::
	endl;

    std::cout << "******************************************\n" << std::
	endl;

    getchar();
}
