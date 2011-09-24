/***************************************************************************
 *            gulib.h
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

#include <cstdlib>
#include <cmath>

// prototipos
float           velocidad(float p_vn, float p_an, float p_vn1, float p_Vn,
			  float p_bn, float p_b, float p_tau, float p_xn1,
			  float p_sn1);
float           distribucion_normal(float mu, float sigma, float pt);
// implementaciones
float
velocidad(float p_vn, float p_an, float p_vn1, float p_Vn, float p_bn,
	  float p_b, float p_tau, float p_xn1, float p_sn1)
{
    // no puede haber raices negativas
    // bloque de verificación
    if (p_vn < 0)
	p_vn = 0;
    if (p_vn1 < 0)
	p_vn1 = 0;
    if (p_Vn < 0)
	p_Vn = 0;
    if (p_b < 0)
	p_b = 0;
    if (p_bn < 0)
	p_bn = 0;
    if (p_xn1 < 0)
	p_xn1 = 0;
    if (p_sn1 < 0)
	p_sn1 = 0;
    // fin bloque
    float           r_1 = sqrt(0.025 + (p_vn / p_Vn));
    float           r_2 =
	sqrt(p_bn * p_bn * p_tau * p_tau -
	     p_bn * (2 * (p_xn1 - p_sn1) - p_vn * p_tau -
		     (p_vn1 * p_vn1 / p_b)));
    if ((p_vn + (2.5 * p_an * 0.6666 * r_1)) <= (p_bn + r_2)) {
	return (p_vn + (2.5 * p_an * 0.6666 * r_1));
    } else {
	return (p_bn + r_2);
    }
}

float
distribucion_normal(float mu, float sigma, float pt)
{
    return ((1 / (sigma * sqrt(6.28)) *
	     pow(2.7, -0.5 * pow((pt - mu) / sigma, 2))) * -1);
}
