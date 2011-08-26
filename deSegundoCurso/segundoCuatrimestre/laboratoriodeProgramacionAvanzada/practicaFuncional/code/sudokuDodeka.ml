(****************************************************************************
Autor: Diego Antonio Lucena Pumar
Fecha: 8-12-2010
Última Modificación: 17-08-2011
Licencia: 
    
    Copyright (C) 2011 for Diego Antonio Lucena Pumar.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

----------------------------------------------------------------------------
# TABLEROS DE PRUEBA #
****************************************************************************)
(*
Propósito: Se trata del tablero de prueba utilizado para confeccionar el juego. Es un tablero ideal para conformar algoritmos para resolución simple y por métodos de "backtraking" sobre el tablero.
*)

let tablero1 = ".2..06.74....7..3.1.02..81....5.9.........A.342.4.2.1..3......A36.2..........8.129......4..0.A.6.0B1.3.........4.0....8A..10.5.8..9....89.3A..0.";;

(*
Propósito: Se trata de un tablero correcto para pruebas sobre resolución del mismo añadiendo o eliminando jugadas.
*)

let tablero2 = "6193B07A24850AB43528967175281694A03B8B47610235A99610A45382B7235A78B96104B4390A6517281765928B034AA80243175B9649A15730B862508B29467A1332768BA14950";;


(*
Propósito: Se trata de un tablero correcto para pruebas sobre resolución del mismo añadiendo o eliminando jugadas.
*)

let tablero3 = "6193.07A24850AB43528967175281694A03B8B47610235A99610A45382B7235A78B96104B4390A6517281765928B034AA80243175B9649A15730B862508B29467A1332768BA14950";;

(*
Propósito: Se trata de un tablero correcto para pruebas sobre resolución del mismo añadiendo o eliminando jugadas.
*)

let tablero4 = "............BA98765432..........................................................................................................................";;

(***************************************************************************
# LOGICA PARA IMPRIMIR TABLERO #
****************************************************************************)
(*
Propósito: Convierte una cadena de "String" hacia una lista de Char.
Prototipo: cadenahaciaListadeChar : string -> char list = <fun>
*)

let rec cadenahaciaListadeChar = function str -> let long = string_length str in if long = 0 then []
                                                                                 else (nth_char str 0) :: cadenahaciaListadeChar(sub_string str 1 (long-1));;


(*
Prueba 1: let lstTablero tablero = cadenahaciaListadeChar tablero;;
*)

let lstTablero tablero = cadenahaciaListadeChar tablero;;

(*
Propósito: Imprime cuatro casillas sobre el todal de doce de una línea de tablero.
Prototipo: imprimeTerciodeLinea : char list * int -> char list = <fun>
*)

let rec imprimeTerciodeLinea (linea,indice) = if (indice < 5 ) then 
						               begin
						                  print_string " ";  
						                  print_char (hd linea);
					                          print_string " "; 
						                  imprimeTerciodeLinea ((tl linea),indice+1)
						               end
					      else linea;;
(*
Propósito: Imprime una línea del tablero.
Prototipo: imprimeLinea : char list * int -> char list = <fun>
*)	      

let rec imprimeLinea (linea,indice) = if (indice < 4 ) then 
						       begin
						          print_string " /";
						          imprimeLinea((imprimeTerciodeLinea (linea,1)), indice+1)
						       end 
			              else 
				         begin
                                            print_string "/";
                                            print_newline();
					    linea
				         end;;

(*
Propósito: Imprime tres líneas de tablero. 1/4 del total de casillas.
Prototipo: imprimeCuartodeTablero : char list * int -> char list = <fun>
*)

let rec imprimeCuartodeTablero (linea,indice) = if (indice < 37 ) then 
                                                                     imprimeCuartodeTablero((imprimeLinea (linea,1)), indice+12)
					        else 
						   begin
		                                   print_string " ------------------------------------------";
		                                   print_newline();
						   linea
						end;;

(*
Propósito: Imprime las casillas del tablero. 
Prototipo: imprimeContenidodeTablero : char list * int -> unit = <fun>
*)

let rec imprimeContenidodeTablero (linea,indice) = if (indice < 5 ) then 
						                       imprimeContenidodeTablero((imprimeCuartodeTablero(linea,1)), indice+1)
					           else 
						      ();;

(*
Propósito: Imprime el tablero completo. Es el "front end" de "imprimeContenidodeTablero".
Prototipo: imprimirTablero : char list -> unit = <fun>
*)

let imprimirTablero tablero = begin
		                 print_newline();
		                 print_string " ------------------------------------------";
		                 print_newline();
		                 imprimeContenidodeTablero (tablero,1);
		                 ()
		              end;;

(*
Propósito: Mustra el tablero sobre una cadena que convierte a lista de "Char". 
Prototipo: mostrarTablero : string -> unit = <fun>
*)

let mostrarTablero tablero = begin
                                let lstTablero = cadenahaciaListadeChar tablero in 
		                imprimirTablero lstTablero;
		                ()
		             end;;

(***************************************************************************
# LOGICA PARA TRATAR JUGADA #
****************************************************************************)
(*
Propósito: Traduce la numeración "Int" a valor sobre tablero, "String". Por ejemplo, si el jugador introduce como jugada el valor 20 se traduce como ficha "A".
Prototipo: valordeAccion : int -> string = <fun>
*)

let valordeAccion accion = if(accion = 10 ) then "0" 
		           else if (accion = 11) then "1" 
			   else if (accion = 12) then "2"
			   else if (accion = 13) then "3" 
			   else if (accion = 14) then "4" 
			   else if (accion = 15) then "5" 
			   else if (accion = 16) then "6" 
			   else if (accion = 17) then "7" 
                           else if (accion = 18) then "8" 
			   else if (accion = 19) then "9" 
                           else if (accion = 20) then "A" 
			   else if (accion = 21) then "B" 
			   else "999";;

(*
Propósito: Crea una cadena desde el valor 0 de str hasta el valor "-1" sobre el que se cambia la ficha.
Prototipo: substrPreAccion : string * int * int -> string = <fun>
*)


let substrPreAccion (str, linea, columna) =  sub_string str 0 ((12*((linea)-1)+(columna))-1);;

(*
Propósito: Crea una cadena desde el valor "acción+1" de str hasta el valor límite de str.
Prototipo: substrPostAccion : string * int * int -> string = <fun>
*)


let substrPostAccion (str, linea, columna) = let salida = ((12*((linea)-1)+(columna))) in sub_string str salida ((string_length str)-salida);;

(*
Propósito: Comprueba si el valor de jugada es correcto y porteriormente inserta la jugada y reconstruye el tablero.
Prototipo: jugada : string * int * int * int -> string = <fun>
*)

let rec jugada (str, linea, columna, accion) = begin
                                                  if (accion > 21) then begin 
                                                                           print_string "Las jugada es incorrecta..."; 
                                                                           jugada(str, linea, columna, accion);
                                                                           ""
                                                                        end
                                                  else concat [(substrPreAccion (str, linea, columna));(valordeAccion accion);(substrPostAccion (str, linea, columna))]
                                               end;;
  
(*
Propósito: Pide los datos necesarios para la jugada y comprueba si esta en el rango correcto.
Prototipo: introDatos : string * int * int -> int = <fun>
*)

let rec introDatos (tipo, min, max) = begin
                                         print_string "Por favor introduzca ";
				         print_string tipo;
				         print_string " de (";
				         print_int min;
				         print_string " a ";
				         print_int max;
				         print_string "): ";
                                      let aux = read_int () in
                                         if(aux >= min) && (aux <= max) then 
			                                                   aux
			                  else introDatos (tipo, min, max)
				       end;;


(*
Propósito: Llama a "introDatos" con jugada y rangos. Es el "font end" de "introDatos".
Prototipo: introJugada : string * int * int * int * int -> string = <fun>
*)		              

let rec introJugada(tablero, fila, columna, juego, opcion) = if(opcion = 1) then 
				                                            begin
                   	                                                       let aux = introDatos("Fila", 1, 12) in 
                                                                               introJugada(tablero, aux, 0, 0, 2)
				                                            end
				                              else if (opcion = 2) then
 				                                                   begin
                   	                                                              let aux = introDatos("Columna", 1, 12) in 
                                                                                      introJugada(tablero, fila, aux, 0, 3)
				                                                   end
				                              else if (opcion = 3) then
				                                                   begin
                   	                                                              let aux = introDatos("Jugada", 10, 21) in 
                                                                                      introJugada(tablero, fila, columna, aux, 4)
				                                                   end
				                              else if (opcion = 4) then
				                                                   jugada(tablero, fila, columna, juego)
				                              else "";;

				 

(****************************************************************************
# FUNCION PARA DETERMINAR SI EL TABLERO ES CORRECTO #
****************************************************************************)
(*
Propósito: Funcion que devuelve la fila para una determinada posicion 'p' del tablero.
Prototipo: fila : int -> int = <fun>
*)

let fila p = if p mod 12 = 0 then 
		                (p / 12) 
             else 
	        (p / 12)+1;;

(*
Propósito: Funcion que devuelve la columna para una determinada posicion 'p' del tablero.
Prototipo: columna : int -> int = <fun>
*)

let columna p = if p mod 12 = 0 then 
		                   12 
	        else 
	           p mod 12;;

(*
Propósito: Función que devuelve la lista con los índices que forman la fila en la que está situada la casilla que se pasa como parámetro.
Prototipo: listaFila : int -> int list = <fun>
*)

let listaFila = function p -> let n = (fila p)-1 in [1+n*12;2+n*12;3+n*12;4+n*12;5+n*12;6+n*12;7+n*12;8+n*12;9+n*12;10+n*12;11+n*12;12+n*12];;

(*
Propósito: Función que devuelve la lista con los índices que forman la columna en la que está situada una determinada casilla.
Prototipo: listaColumna : int -> int list = <fun>
*)

let listaColumna = function p -> let n = columna p in [n;n+12;n+24;n+36;n+48;n+60;n+72;n+84;n+96;n+108;n+120;n+132];;

(*
Propósito: Función para obtener el cuadrado en el que se encuentra una posición.
Prototipo: cuadrado : int -> int = <fun>
*)

let cuadrado p = if (p > 0) & ((fila p)-1)/3 = 0 then 
		                                    (((columna p)-1)/4) + 1 
  		 else if ((fila p)-1)/3 = 1 then 
			                       (((columna p)-1)/4) + 4 
  		 else if ((fila p)-1)/3 = 2 then 
		                               (((columna p)-1)/4) + 7
  		 else if ((fila p)-1)/3 = 3 then 
		                               (((columna p)-1)/4) + 10  
  	         else
	            failwith "La posicion no se encuentra en el tablero...";;


(*
Propósito: Función que devuelve una lista con los índices del cuadrado al que pertenece un cierto elemento.
Prototipo: listaCuadrado : int -> int list = <fun>
*)

let listaCuadrado p = let n = cuadrado p in [1+36*((n-1)/3)+4*((n-1) mod 3);
		       			    2+36*((n-1)/3)+4*((n-1) mod 3);
		       			    3+36*((n-1)/3)+4*((n-1) mod 3);
		      			    4+36*((n-1)/3)+4*((n-1) mod 3);
		     			    13+36*((n-1)/3)+4*((n-1) mod 3);
		  			    14+36*((n-1)/3)+4*((n-1) mod 3);
					    15+36*((n-1)/3)+4*((n-1) mod 3);
					    16+36*((n-1)/3)+4*((n-1) mod 3);
				            25+36*((n-1)/3)+4*((n-1) mod 3);
			                    26+36*((n-1)/3)+4*((n-1) mod 3);
		       		            27+36*((n-1)/3)+4*((n-1) mod 3);
		       	                    28+36*((n-1)/3)+4*((n-1) mod 3)];;
(*
Propósito: Función que devuelve un elemento a partir de una lista de elementos dada y su posición.
Prototipo: elemento : int * int * 'a list -> 'a = <fun>
*)

let rec elemento (indice,recorrido,tabla) = if(indice = recorrido) then hd tabla
				            else elemento (indice, (recorrido+1), tl tabla);;
(*
Propósito: Se trata de un "front" de "elemento", con algunas particularidades. En el caso de encontrar agua devuelve el valor uno sino devuelve el indice del recorrido, e igualmente comprueba que los elementos no se repitan.
Prototipo: buscarElemento : char * char list * int -> int list -> int = <fun>
*)

let rec buscarElemento (elementoIndice,tablero,contador) = function [] -> contador
								 |h::f -> if(elementoIndice = `.`) then 1
								          else if(elemento(h,1,tablero) = elementoIndice) then buscarElemento (elementoIndice,tablero,(contador+1)) f
								          else buscarElemento (elementoIndice,tablero,contador) f;;
(*
Propósito: Función que usa "buscarElemento" para dado un índce de reccorrido 1 y contador 0 comprobar la condición de que no existe agua y todos los elementos de cada fila son distintos. 
Prototipo: sonlasFilaCorrectas : int * char list -> bool = <fun>
*)

let rec sonlasFilaCorrectas (indice,tablero) = if indice > 144 then true
					       else if (buscarElemento (elemento(indice,1,tablero),tablero,0) (listaFila indice)) > 1 then false 
					       else sonlasFilaCorrectas ((indice+1),tablero);;

(*
Propósito: Función que usa "buscarElemento" para dado un índce de reccorrido 1 y contador 0 comprobar la condición de que no existe agua y todos los elementos de cada columna son distintos. 
Prototipo: sonlasColumnasCorrectas : int * char list -> bool = <fun>
*)

let rec sonlasColumnasCorrectas (indice,tablero) = if indice > 144 then true
					           else if (buscarElemento (elemento(indice,1,tablero),tablero,0) (listaColumna indice)) > 1 then false 
					           else sonlasColumnasCorrectas ((indice+1),tablero);;

(*
Propósito: Función que usa "buscarElemento" para dado un índce de reccorrido 1 y contador 0 comprobar la condición de que no existe agua y todos los elementos de cada cuadrado son distintos. 
Prototipo: sonlosCuadradosCorrectos : int * char list -> bool = <fun>
*)

let rec sonlosCuadradosCorrectos (indice,tablero) = if indice > 144 then true
					            else if (buscarElemento (elemento(indice,1,tablero),tablero,0) (listaCuadrado indice)) > 1 then false 
					            else sonlosCuadradosCorrectos ((indice+1),tablero);;

(*
Propósito: Es el "front" para las tres funciones anteriores. Devuelve "true" o "false" sobre si el tablero cumple la condición de que no existen elementos repetidos en: cada fila, cada columna y cada cuarto de tablero. 
Prototipo: esSudokuCorrecto : char list -> bool = <fun>
*)

let esSudokuCorrecto lstTablero = sonlasFilaCorrectas (1, lstTablero) && sonlasColumnasCorrectas (1, lstTablero) && sonlosCuadradosCorrectos (1, lstTablero);;


(****************************************************************************
# FUNCIONES PARA RESOLVER EL SUDOKU DE MANERA FÁCIL #
****************************************************************************)
(*
Propósito: Función que elimina un elemento de una lista dada.
Prototipo: quitarElemento : 'a * 'a list -> 'a list -> 'a list = <fun>
*)

let rec quitarElemento (elemento, cabezaLista) = function [] -> []
					                |h::f-> if (elemento = h) then cabezaLista@f
							        else quitarElemento (elemento, cabezaLista@[h]) f;;

(*
Prueba 1: quitarElemento(10,[]) (listaFila 5);; 
*)

(*
Propósito: Función que extrae una lista genérica para lista de enteros dada.
Prototipo: elementosListadeEnteros : 'a list * 'a list -> int list -> 'a list = <fun>
*)

let rec elementosListadeEnteros (listaFinal,tablero) = function [] -> listaFinal
							    | h::f -> elementosListadeEnteros ((listaFinal@[(elemento(h, 1, tablero))]),tablero) f;;

(*
Prueba 1: elementosListadeEnteros ([],(lstTablero tablero1)) (listaFila 5);;
*)


(*
Propósito: Es el "front" para obtener la lista genérica de elementos de una fila a partir de un índice.
Prototipo: elementosFila : int * 'a list -> 'a list = <fun> 
*)

let elementosFila (elemento,tablero) = elementosListadeEnteros ([], tablero) (listaFila elemento);;

(*
Prueba 1: elementosFila (5, (lstTablero tablero1));;
*)


(*
Propósito: Es el "front" para obtener la lista genérica de elementos de una columna a partir de un índice.
Prototipo: elementosColumna : int * 'a list -> 'a list = <fun>
*)

let elementosColumna (elemento,tablero) = elementosListadeEnteros ([], tablero) (listaColumna elemento);;

(*
Prueba 1: elementosColumna (5, (lstTablero tablero1));;
*)


(*
Propósito: Es el "front" para obtener la lista genérica de elementos de un cuadrado a partir de un índice.
Prototipo: elementosCuadrado : int * 'a list -> 'a list = <fun>
*)

let elementosCuadrado (elemento,tablero) = elementosListadeEnteros ([], tablero) (listaCuadrado elemento);;

(*
Prueba 1: elementosCuadrado (5, (lstTablero tablero1));;
*)

(*
Propósito: Función que elimina de una lista el elemeto dado como parámentro.
Prototipo: filasinElemento : int * int list -> int list = <fun>
*)

(*
???
let filasinElemento (elemento, tablero) = quitarElemento (elemento,[]) (elementosFila(elemento, tablero));;
*)

(*
Propósito: Función que obtiene la lista de elementos para un índice dado.
Prototipo: elementosparaIndice : int * 'a list -> 'a list = <fun>
*)

let elementosparaIndice (elemento, tablero) = (elementosFila (elemento,tablero))@(elementosColumna (elemento,tablero))@(elementosCuadrado (elemento,tablero));;

(*
Prueba 1: elementosparaIndice (5, (lstTablero tablero1));;
*)


(*
Propósito: Función que elimina el carácter `.` de una lista dada.
Prototipo: eliminarBlancos : char list -> char list -> char list = <fun>
*)

let rec eliminarBlancos (listaLimpia) = function [] -> listaLimpia
				              |h::f -> if (h = `.`) then eliminarBlancos (listaLimpia) f
				                       else eliminarBlancos (listaLimpia@[h]) f;;

(*
Prueba 1: eliminarBlancos ([]) (elementosparaIndice (5, (lstTablero tablero1)));; 
*)
 

(*
Autor: Luis Bengochea Martínez.
Licencia de Código: (C) Luis Bengochea Martínez. Departamento de Ciencias de la Computación. Universidad de Alcalá (UAH). Todos los derechos reservados.
Propósito: Función que inserta un elemento en una lista.
Prototipo: insertar : 'a -> 'a list -> 'a list = <fun>
*)

let rec insertar n = function [] -> [n]
                           |x::l -> if x=n then x::l
                                    else if x>n then n::x::l
                                    else x::(insertar n l);;

(*
Autor: Luis Bengochea Martínez.
Licencia de Código: (C) Luis Bengochea Martínez. Departamento de Ciencias de la Computación. Universidad de Alcalá (UAH). Todos los derechos reservados.
Propósito:Función que ordena una lista genérica de elementos.
Prototipo: ordenar : 'a list -> 'a list = <fun>
*)

let rec ordenar = function [] -> []
                       | x::l -> insertar x (ordenar l);;

(*
Prueba 1: ordenar (eliminarBlancos ([]) (elementosparaIndice (5, (lstTablero tablero1))));; 
Prueba 2: ordenar [`5`;`1`;`B`;`A`;`3`;`7`;`1`];;
*)


(*
Propósito: Función que busca partiendo en una lista el elemento que no se encuentra en la otra.
Prototipo: buscarElemento : 'a list -> 'a list -> 'a = <fun>
*)
 
let rec buscarElemento listaFormal = function [] -> hd(listaFormal)
				           |h::f -> if (h = hd(listaFormal)) then buscarElemento (tl(listaFormal)) f 
						    else hd(listaFormal);;

(*
Prueba 1: buscarElemento [`0`;`1`;`2`;`3`;`4`;`5`;`6`;`7`;`8`;`9`;`A`;`B`;`.`] (ordenar (eliminarBlancos ([]) (elementosparaIndice (5, (lstTablero tablero1)))));;
*)


(*
Propósito: Se trata de un "front" para "buscarElemento", con el objetivo de simplificar el código.
Prototipo: frontBuscarElemento : int -> char list -> char = <fun> 
*)

let rec frontBuscarElemento indice tablero = buscarElemento [`0`;`1`;`2`;`3`;`4`;`5`;`6`;`7`;`8`;`9`;`A`;`B`;`.`] (ordenar (eliminarBlancos ([]) (elementosparaIndice (indice, tablero))));;


(*
Prueba 1: frontBuscarElemento 5 (lstTablero tablero1);;
*)


(*
???
Propósito: Función que devuelve un elemento para un índice dado.
Prototipo: elementoparaIndice : int -> int -> 'a list -> 'a = <fun>
*)

let rec elementoparaIndice indiceRecorrido indiceInicial lista = if (indiceInicial = indiceRecorrido) then (hd(lista))
 				                                 else elementoparaIndice(indiceRecorrido+1) indiceInicial (tl(lista));;


(*
Prueba 1: elementoparaIndice 1 5 (lstTablero tablero1);;
*)


(*
Propósito: Función que inserta en un tablero una jugada y reconstruye el mismo.
Prototipo: fontTableroconJugada : int * string * string -> string = <fun>
*)

let fontTableroconJugada (indice, jugada, strTablero) = (concat [(substrPreAccion (strTablero, (fila indice), (columna indice)));jugada;(substrPostAccion (strTablero, (fila indice), (columna indice)))]);;

(*
Propósito: Función que resuelve el Sudoku por eliminación simple de posibilidades.
Prototipo: resolverSudokudeManeraFacil : int * string * string -> string = <fun>
*) 

let rec resolverSudokudeManeraFacil (indice, strTableroFinal, strTableroInicial) = if (indice > 144) then strTableroFinal
                                                                                   else if ((elementoparaIndice 1 indice (cadenahaciaListadeChar strTableroInicial)) = `.`) then let jugada = (frontBuscarElemento indice (cadenahaciaListadeChar strTableroInicial)) in resolverSudokudeManeraFacil ((indice+1), strTableroFinal^(char_for_read jugada),(fontTableroconJugada (indice, (char_for_read jugada), strTableroInicial)))
                                                                                   else resolverSudokudeManeraFacil ((indice+1), strTableroFinal^(char_for_read(elementoparaIndice 1 indice (cadenahaciaListadeChar strTableroInicial))),strTableroInicial);;

(*
Tableros de Prueba: Original: "6193B07A24850AB43528967175281694A03B8B47610235A99610A45382B7235A78B96104B4390A6517281765928B034AA80243175B9649A15730B862508B29467A1332768BA14950"

let tableroPruebaFacil1 = "6193.07A24850AB43528967175281694A03B8B47610235A99610A45382B7235A78B96104B4390A6517281765928B034AA80243175B9649A15730B862508B29467A1332768BA1....";;
let tableroPruebaFacil2 = ".193B07A2485.AB435289671.5281694A03B.B47610235A99610A45382B7235A78B96104B4390A6517281765928B034AA80243175B9649A15730B862508B29467A1332768BA14950";;

Prueba 1: 

resolverSudokudeManeraFacil (1, "", tableroPruebaFacil1);;

Prueba 2: 

resolverSudokudeManeraFacil (1, "", tableroPruebaFacil2);;

*)

(****************************************************************************
# FUNCIONES PARA RESOLVER EL SUDOKU DE MANERA DIFÍCIL (ALGORITMO DE BACKTRACKING) #
****************************************************************************)



(*
Propósito: 
Prototipo: dosPosiblesValores : 'a list -> bool = <fun>
*)

let dosPosiblesValores = function x::y::[] -> true
		                        |_ -> false;;

(*
Prueba 1: dosPosiblesValores [`1`];;
Prueba 2: dosPosiblesValores [`1`;`2`];;
Prueba 2: dosPosiblesValores [`1`;`2`;`3`];;
*)

(*
Propósito: 
Prototipo: 'a list -> 'a list -> 'a list = <fun>
*)

let rec valoresparaElemento listadeValores posiblesValores listaPatron = if (listaPatron = []) then posiblesValores
									 else if (listadeValores = []) then (valoresparaElemento listadeValores (posiblesValores@[(hd(listaPatron))]) (tl(listaPatron)))
				                                         else if (hd(listaPatron) = hd(listadeValores)) then (valoresparaElemento (tl(listadeValores)) posiblesValores (tl(listaPatron)))
						                         else (valoresparaElemento listadeValores (posiblesValores@[(hd(listaPatron))]) (tl(listaPatron)));;

(*
Prueba 1: valoresparaElemento  (ordenar (eliminarBlancos ([]) (elementosparaIndice (23, (lstTablero tablero4))))) []  [`0`;`1`;`2`;`3`;`4`;`5`;`6`;`7`;`8`;`9`;`A`;`B`];;
*)

(*
Propósito: 
Prototipo: 'a list -> 'a list -> 'a list = <fun>
*)

let rec buscaElementodeDosValores indice tablero =  if (dosPosiblesValores(valoresparaElemento  (ordenar (eliminarBlancos ([]) (elementosparaIndice (indice, (lstTablero tablero))))) []  [`0`;`1`;`2`;`3`;`4`;`5`;`6`;`7`;`8`;`9`;`A`;`B`])) then indice
						    else 999;;


(*
Prueba 1: buscaElementodeDosValores 9 tablero4;;
*)

(*
Propósito: 
Prototipo: 
*)


let rec frontBuscaElementodeDosValores indice tablero = if (indice > 144) then 144
						        else if ((elemento (indice,1,(lstTablero tablero)) = `.`) && ((buscaElementodeDosValores indice tablero) <> 999)) then indice
							else (frontBuscaElementodeDosValores (indice+1) tablero);;

(*
Prueba 1: frontBuscaElementodeDosValores 1 tablero4;;
*)

(*
Propósito: 
Prototipo: 
*)

let damePrimerValor = function [] -> failwith "La lista está vacía"
			    |x::l -> x;;

(*
Prueba 1: 
*)

(*
Propósito: 
Prototipo: 
*)

let frontDamePrimerValor tablero = let indice = (frontBuscaElementodeDosValores 1 tablero) in if (indice <> 144) then (damePrimerValor((valoresparaElemento  (ordenar (eliminarBlancos ([]) (elementosparaIndice (indice, (lstTablero tablero))))) []  [`0`;`1`;`2`;`3`;`4`;`5`;`6`;`7`;`8`;`9`;`A`;`B`])))
											      else `.`;;


(*
Prueba 1: frontDamePrimerValor tablero4;;
*)

(*
Propósito: 
Prototipo: 
*)

let dameSegundoValor = function [] -> failwith "lista vacia"
	                  |x::y::l -> y
	                    |x::[] -> failwith "La lista debe tener 2 valores";;

(*
Prueba 1: 
*)

(*
Propósito: 
Prototipo: 
*)


let frontDameSegundoValor tablero = let indice = (frontBuscaElementodeDosValores 1 tablero) in if (indice <> 144) then (dameSegundoValor((valoresparaElemento  (ordenar (eliminarBlancos ([]) (elementosparaIndice (indice, (lstTablero tablero))))) []  [`0`;`1`;`2`;`3`;`4`;`5`;`6`;`7`;`8`;`9`;`A`;`B`])))
											      else `.`;;


(*
Prueba 1: frontDameSegundoValor tablero4;;
*)

(*
Propósito: 
Prototipo: 
*)

let colocaPrimerValor tablero = let indice = (frontBuscaElementodeDosValores 1 tablero) in if (indice <> 144) then fontTableroconJugada (indice, char_for_read(frontDamePrimerValor tablero), tablero)
											   else tablero;;

(*
Prueba 1: colocaPrimerValor tablero4;;
*)

(*
Propósito: 
Prototipo: 
*)

let colocaSegundoValor tablero = let indice = (frontBuscaElementodeDosValores 1 tablero) in if (indice <> 144) then fontTableroconJugada (indice, char_for_read(frontDameSegundoValor tablero), tablero)
											    else tablero;;


(*
Prueba 1: colocaSegundoValor tablero4;;
*)

(*
Propósito: 
Prototipo: 
*)

let rec estaTableroResuelto = function [] -> true
				    |h::f -> if (h = `.`) then false
						  else estaTableroResuelto f;;

(*
Prueba 1: estaTableroResuelto [`.`;`2`;`3`];;
Prueba 2: estaTableroResuelto [`1`;`.`;`3`];;
Prueba 3: estaTableroResuelto [`1`;`2`;`.`];;
Prueba 4: estaTableroResuelto [`1`;`2`;`3`];;
*)
 


(*
Propósito: 
Prototipo: 
*)

let rec hayPosibles indice tablero = if (indice > 144) then false
			     else if ((valoresparaElemento  (ordenar (eliminarBlancos ([]) (elementosparaIndice (indice, (lstTablero tablero))))) []  [`0`;`1`;`2`;`3`;`4`;`5`;`6`;`7`;`8`;`9`;`A`;`B`]) <> []) then true
			     else hayPosibles (indice + 1) tablero;;

(*
Prueba 1: hayPosibles 1 tablero1;;
Prueba 2: hayPosibles 1 tablero2;;
Prueba 3: hayPosibles 1 tablero3;;
Prueba 4: hayPosibles 1 tablero4;;
*)

(*
Propósito: 
Prototipo: 
*)

let rec resolverSudokudeManeraDificil tablero = if((hayPosibles 1 tablero) = false) then tablero
				                else if (tablero <> (colocaPrimerValor tablero)) then if (estaTableroResuelto(cadenahaciaListadeChar(resolverSudokudeManeraFacil (1, "", (colocaPrimerValor tablero))))) then (resolverSudokudeManeraFacil (1, "", (colocaPrimerValor tablero)))
												      else (resolverSudokudeManeraDificil (colocaPrimerValor tablero))
						else if (tablero <> (colocaSegundoValor tablero)) then if (estaTableroResuelto(cadenahaciaListadeChar(resolverSudokudeManeraFacil (1, "", (colocaSegundoValor tablero))))) then (resolverSudokudeManeraFacil (1, "", (colocaSegundoValor tablero)))
												      else (resolverSudokudeManeraDificil (colocaSegundoValor tablero))
						else resolverSudokudeManeraDificil (resolverSudokudeManeraFacil (1, "", tablero));;

(*
Prueba 1: resolverSudokudeManeraDificil tablero1;;
*)


(****************************************************************************
# FUNCION PRINCIPAL #
****************************************************************************)

(*
Propósito: Tratar todo el conjunto de "sub-funciones", para hacer "jugable" el Sudoku.
Prototipo: main : char list * string -> unit = <fun>
*)

let rec main (lstTablero, strTablero) =   begin
                                             imprimirTablero lstTablero;
				             print_string "Estado del Juego: ";
				             if(sonlasFilaCorrectas (1, lstTablero) && sonlasColumnasCorrectas (1, lstTablero) && sonlosCuadradosCorrectos (1, lstTablero)) = true then print_string "Correcto"
				             else print_string "Incorrecto";
				             print_newline();
				             print_string "1. Jugar";
		                             print_newline();
                                             print_string "2. Resolver de manera fácil";
		                             print_newline();
					     print_string "3. Resolver de manera difícil";
		                             print_newline();
				             print_string "4. Salir";
		                             print_newline();
                                             print_string "Por favor selecciona una opcion: ";
                                             let opcion = read_int () in  
			        	     if (opcion = 1) then 
				                             begin
				                                let tableroAux = introJugada (strTablero,0,0,0,1) in main((cadenahaciaListadeChar tableroAux), tableroAux);
				                             end
				             else if (opcion = 2) then 
				                                  begin
					                             let tableroFacil = resolverSudokudeManeraFacil (1, "", strTablero) in main(cadenahaciaListadeChar(tableroFacil), tableroFacil)
				                                  end
 					     else if (opcion = 3) then 
				                                  begin
					                             ()
				                                  end
				             else if (opcion = 4) then 
                                                                     ()
				          end;; 


(****************************************************************************
# FUNCION DE EJECUCIÓN #
****************************************************************************)
(*
Propósito: Ejecutar el Sudoku.
*)


(*
main(cadenahaciaListadeChar(tablero1), tablero1);; 

main(cadenahaciaListadeChar(tablero2), tablero2);; 

main(cadenahaciaListadeChar(tablero3), tablero3);; 

main(cadenahaciaListadeChar(tablero4), tablero4);; 
*)
