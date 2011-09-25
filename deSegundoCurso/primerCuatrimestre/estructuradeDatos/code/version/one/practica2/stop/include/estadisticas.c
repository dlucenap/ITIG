/***************************************************************************
 *            estadisticas.c
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
#include "estadisticas.h"

estadisticas::estadisticas()
{
    ptrprim = 0;
}

bool
estadisticas::esta_vacia()
{
    return (ptrprim == 0);
}
int
                estadisticas::insertarnodo(dato * nodo)
{
    if (!esta_vacia()) {
	nodo->ptrsiguiente = ptrprim;
	ptrprim = nodo;
    } else {
	// la lista esta vacia
	ptrprim = nodo;
    }
    // num_estadisticas += 1;
    return 0;
}
float
estadisticas::velocidad_media(float xi, float xf, float tiempo_simu)
{
    return (xf - xi) / tiempo_simu;
}
float
estadisticas::densidad_media(float xn, int num_coches)
{
    return (num_coches / xn);
}
