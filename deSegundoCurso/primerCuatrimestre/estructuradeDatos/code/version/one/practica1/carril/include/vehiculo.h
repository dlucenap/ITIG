/***************************************************************************
 *            vehiculo.h
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
#ifndef CTAU
#define CTAU 0.6666
#endif
class           vehiculo {
  private:
    float           v_n;
    float           a_n;
    float           b_n;
    float           b;
    float           s_n;
    float           x_n;
    float           V_n;
    float           tau;
  public:
                    vehiculo();
    void            setv_n(float pv_n);
    float           getv_n();
    void            seta_n(float pa_n);
    float           geta_n();
    void            setb_n(float pb_n);
    float           getb_n();
    void            setb(float pb);
    float           getb();
    void            sets_n(float ps_n);
    float           gets_n();
    void            setx_n(float px_n);
    float           getx_n();
    void            setV_n(float pV_n);
    float           getV_n();
    void            settau(float ptau);
    float           gettau();
    vehiculo       *ptrsiguiente;
    vehiculo       *ptranterior;
    vehiculo       *getnuevo_vehiculo();
};
