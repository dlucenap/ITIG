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
#include <string>

using std::string;

#include "../include/simulador.c"



int
main()
{
    // plantamos la semilla
    srand(time(0));
    float           tiemposimu;
    tiemposimu = 0;
    std::cout << "Traffic Simulator\n" << std::endl;
    std::
	cout <<
	"Please, set the time of simulation, enter in numeric notation: " <<
	std::endl;
    std::cin >> tiemposimu;
    std::cout << "t= " << tiemposimu << "\n" << std::endl;
    simulador       simu1;




    simu1.exec_main_simulation(tiemposimu);
    return 0;
}
