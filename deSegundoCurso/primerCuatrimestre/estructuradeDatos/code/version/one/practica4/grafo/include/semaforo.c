/***************************************************************************
 *            semaforo.c
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

#include "semaforo.h"

void
                semaforo::setestado(int pestado)
{
    estado = pestado;
}

int
                semaforo::getestado()
{
    return estado;
}

void
                semaforo::setdelta_t(float pdelta_t)
{
    delta_t = pdelta_t;
}

float
                semaforo::getdelta_t()
{
    return delta_t;
}

int
                semaforo::change()
{
    if (estado != ROJO && estado != AMBAR)
	estado = VERDE;
    else if (estado != ROJO && estado != VERDE)
	estado = AMBAR;
    else
	estado = ROJO;
	return 0;
}
