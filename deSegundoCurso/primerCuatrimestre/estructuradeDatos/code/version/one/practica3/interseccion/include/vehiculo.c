/***************************************************************************
 *            vehiculo.c
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

#include "vehiculo.h"

vehiculo::vehiculo()
{
    float           px = 0;
    px = (float) rand() / RAND_MAX;
    seta_n((-1 / 1.7) * log(1 - px));
    px = (float) rand() / RAND_MAX;
    setb_n((-1 / 2.0) * log(1 - px));
    if (-3 <= ((getb_n() - 3) / 2)) {
	setb(-3);
    } else {
	setb((getb_n() - 3) / 2);
    }
    px = (float) rand() / RAND_MAX;
    sets_n((-1 / 6.5) * log(1 - px));
    setx_n(0);
    px = (float) rand() / RAND_MAX;
    setV_n((-1 / 1.7) * log(1 - px));
    settau(CTAU);
    v_n = 0.10;
    ptrsiguiente = 0;
    ptranterior = 0;
}
void
                vehiculo::setv_n(float pv_n)
{
    v_n = pv_n;
}
float
                vehiculo::getv_n()
{
    return v_n;
}
void
                vehiculo::seta_n(float pa_n)
{
    a_n = pa_n;
}
float
                vehiculo::geta_n()
{
    return a_n;
}
void
                vehiculo::setb_n(float pb_n)
{
    b_n = pb_n;
}
float
                vehiculo::getb_n()
{
    return b_n;
}
void
                vehiculo::setb(float pb)
{
    b = pb;
}
float
                vehiculo::getb()
{
    return b;
}
void
                vehiculo::sets_n(float ps_n)
{
    s_n = ps_n;
}
float
                vehiculo::gets_n()
{
    return s_n;
}
void
                vehiculo::setx_n(float px_n)
{
    x_n = px_n;
}
float
                vehiculo::getx_n()
{
    return x_n;
}
void
                vehiculo::setV_n(float pV_n)
{
    V_n = pV_n;
}
float
                vehiculo::getV_n()
{
    return V_n;
}
void
                vehiculo::settau(float ptau)
{
    tau = ptau;
}
float
                vehiculo::gettau()
{
    return tau;
}
