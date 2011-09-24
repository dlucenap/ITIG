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
int
                simulador::exec_simulacion(float tusuario)
{
    tiempo_simu = 0;
    tiempo_coche = 0;
    tiempo_simu += CTIEMPO;
    vehiculo       *
	nuevo_vehiculo;
    while (tiempo_simu < tusuario) {
	if (tiempo_coche > tiempo_simu) {
	    simu.c_vehiculos->insertarnodo(nuevo_vehiculo->
					   getnuevo_vehiculo());
	    std::
		cout << "Nuevo vehiculo insertado en la lista...\n" <<
		std::endl;
	} else {
	    std::cout << "Vehiculo no insertado...\n" << std::endl;
	}
	xi = simu.c_vehiculos->devolv_sum_x_n();
	simu.c_vehiculos->actualizar_vehiculos();
	xf = simu.c_vehiculos->devolv_sum_x_n();
	v_media =
	    simu.c_estadisticas->velocidad_media(xi, xf, tiempo_simu);
	d_media =
	    simu.c_estadisticas->densidad_media(simu.c_vehiculos->ptrult->
						getx_n(),
						simu.c_vehiculos->
						getnum_coches());

	ptrestadistico = new dato(v_media, d_media);
	simu.c_estadisticas->insertarnodo(ptrestadistico);
	mostrar_estadisticas(v_media, d_media,
			     simu.c_vehiculos->getnum_coches());
	tiempo_coche = tiempo_simu + (-0.3333) * log(1 - drand48());
	tiempo_simu += CTIEMPO;
    }
    estadisticas_genereales(simu.c_estadisticas->ptrprim, v_media, d_media,
			    simu.c_vehiculos->getnum_coches());
    std::cout << "Simulacion terminada...\n" << std::endl;
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
