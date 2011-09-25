/***************************************************************************
 *            vehiculos.h
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
#include "gulib.h"
#include "vehiculo.c"
#define CTIEMPO 0.6666
#define VMAX 90

class           vehiculos:public entidad_trafico {
  private:
    int             num_coches;
  public:
                    vehiculos();
    bool            esta_vacia();
    int             insertarnodo(vehiculo * nodo);
    void            setnum_coches(int pnum_coches);
    int             getnum_coches();
    int             actualizar_vehiculos();
    int             eliminar_ultimo();
    float           devolv_sum_x_n();
    vehiculo       *calcular_ptr_entrada();
    vehiculo       *ptrprim;
    vehiculo       *ptrult;
    vehiculo       *ptrante;
};
