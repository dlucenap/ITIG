/***************************************************************************
 *            simulador.h
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

#include "tem_cola.h"
#include <cstdlib>
#include <cmath>
#include "carril.c"
#include "interseccion.c"
#ifndef RAND_MAX
#define RAND_MAX 1
#endif
#define T_SEMAFORO 1
#define VERDE 0
#define AMBAR 1
#define ROJO 2
#define LIMITTOCHANGE 50
#define INTERVAL 5
class           simulador {
  private:
    vehiculo * ptrentrada;
    vehiculo       *nuevo_vehiculo;
    vehiculo       *vehiculoaux;
    vehiculos      *cv1;
    vehiculos      *cv2;
    vehiculos      *cvp;
    carril         *simu1;
    carril         *simu2;
    carril         *simu3;
    carril         *simu4;
    carril         *simu5;
    semaforo        sema1,
                    sema2;
    interseccion   *intersec;
    float           tiempo_simu;
    float           tiempo_coche;
    float           num_aleatorio;
    float           px;
    float           xn;
    bool            bandera;

  public:
                    Cola < vehiculo > cola1;
                    Cola < vehiculo > cola2;

                    simulador();	// constructor
    int             exec_main_simulation(float tusuario);
    void            exec_simulacion_carril(vehiculos * cv,
					   vehiculos * cvp,
					   Cola < vehiculo > *colap,
					   Cola < vehiculo > *colas,
					   float tusuario,
					   semaforo * sema1,
					   semaforo * sema2);
};
