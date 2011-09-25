/***************************************************************************
 *            estadisticas.h
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
#include "dato.c"

class           estadisticas {
  private:
    int             num_estadisticas;
  public:
                    dato * ptrprim;
                    estadisticas();
    void            setnum_estadisticas(int pnum);
    int             getnum_estadisticas();
    bool            esta_vacia();
    int             insertarnodo(dato * nodo);
    float           d_media;
    float           velocidad_media(float xi, float xf, float tiempo_simu);
    float           densidad_media(float x_n, int num_coches);
};
