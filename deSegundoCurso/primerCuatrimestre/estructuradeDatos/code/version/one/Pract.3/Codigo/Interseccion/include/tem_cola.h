/***************************************************************************
 *            tem_cola.h
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
template < class TIPONODO > class Cola {
  private:
  public:
    TIPONODO * ptrprim;
    TIPONODO       *ptrult;
    Cola() {
	ptrprim = ptrult = 0;
    }
    bool            estavacia() {
	return (ptrprim == ptrult == 0);
    }
    int             encolar(TIPONODO * elem) {
	if (estavacia()) {
	    ptrprim = ptrult = elem;


	} else {
	    ptrult->ptranterior = elem;
	    ptrult = elem;
	}
	std::cout << "En la cola...\n" << std::endl;
	getchar();
	return 0;
    }
    TIPONODO       *desencolar() {
	TIPONODO       *ptraux;
	if (estavacia()) {
	    return 0;
	} else {
	    ptraux = ptrult;
	    ptraux->ptranterior = 0;
	    ptraux->ptrsiguiente = 0;
	    ptrult = ptrult->ptranterior;
	    return ptraux;
	    std::cout << "Fuera de la cola...\n" << std::endl;
	    getchar();
	}
    }
};
