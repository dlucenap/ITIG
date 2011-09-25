/***************************************************************************
 *            main.cc
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

#include <iostream>
#include "../include/simulador.c"

int
main()
{
    // plantamos la semilla
    srand(time(0));
    float           tiemposimu;
    tiemposimu = 0;
    printf("Traffic Simulator\n");
    printf
	("Please, set the time of simultion, enter in numeric notation: ");
    scanf("%f", &tiemposimu);
    printf("t=%f\n", tiemposimu);
    simulador       simu1;
    simu1.exec_simulacion(tiemposimu);
    return 0;
}
