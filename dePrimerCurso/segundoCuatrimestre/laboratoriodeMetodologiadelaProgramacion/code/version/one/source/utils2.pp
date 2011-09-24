UNIT utils2;
INTERFACE
USES crt;
TYPE 
	tfich = TEXT;	

	tpalabra = ^nodop2;
		nodop2 = RECORD
		napariciones : BYTE;
		palabra : STRING;
		psiguiente: tpalabra;
		END;
{-----------------------}
PROCEDURE devolver_ptr_palabra_buscand_por_ord_alf (VAR slists,ptr_palabra:tpalabra; palabra: STRING);
PROCEDURE insertar_palabra_en_subl (VAR slist, palabra:tpalabra);
FUNCTION esta_palabra_en_subl(subl:tpalabra;palabra:STRING):BOOLEAN;
PROCEDURE devuelve_ptr_palabra_en_subl(subl:tpalabra;palabra:STRING;VAR ptrpalabra:tpalabra);
FUNCTION palabras_en_subl(subl:tpalabra):INTEGER;
PROCEDURE imprimir_slist_prin_rec (VAR palabra:tpalabra);
PROCEDURE eliminar_palabras_q_apar_una_vez (VAR palabra:tpalabra;VAR fdest:tfich);
IMPLEMENTATION 
PROCEDURE devolver_ptr_palabra_buscand_por_ord_alf (VAR slists,ptr_palabra:tpalabra; palabra: STRING);
BEGIN
	IF (NOT(slists^.psiguiente = NIL)) THEN
		IF ((slists^.palabra < palabra) AND (slists^.psiguiente^.palabra > palabra)) THEN
			ptr_palabra := slists
		ELSE
		BEGIN
			slists := slists^.psiguiente;
                	devolver_ptr_palabra_buscand_por_ord_alf (slists,ptr_palabra,palabra);	
		END
	ELSE
		IF (slists^.palabra > palabra) THEN
			ptr_palabra := NIL
		ELSE
			ptr_palabra := slists;
END;
{-----------------------}

PROCEDURE insertar_palabra_en_subl (VAR slist, palabra:tpalabra);
VAR slistaux, ptr_palabra:tpalabra;
BEGIN
	slistaux := slist;
	devolver_ptr_palabra_buscand_por_ord_alf (slistaux, ptr_palabra, palabra^.palabra);
	IF (ptr_palabra = NIL) THEN
	BEGIN
        	palabra^.psiguiente := slist;
		slist := palabra;
	END
	ELSE
	BEGIN
		palabra^.psiguiente := ptr_palabra^.psiguiente;
		ptr_palabra^.psiguiente := palabra; 
	END;
END;
{-----------------------}
FUNCTION esta_palabra_en_subl(subl:tpalabra;palabra:STRING):BOOLEAN;
VAR 
	encontrado:BOOLEAN;
BEGIN
	encontrado := false;
REPEAT
	encontrado := (subl^.palabra = palabra);
	subl := subl^.psiguiente;
UNTIL((subl = NIL) OR encontrado);
	esta_palabra_en_subl := encontrado;
END;
{-----------------------}
(*Sabemos que la palabra esta en la lista porque previamente la hemos buscado*)
PROCEDURE devuelve_ptr_palabra_en_subl(subl:tpalabra;palabra:STRING;VAR ptrpalabra:tpalabra);
VAR 
	encontrado:BOOLEAN;
BEGIN
	encontrado := false;
WHILE (NOT(encontrado)) DO
BEGIN
	IF (subl^.palabra = palabra) THEN
	BEGIN
		encontrado := true;
		ptrpalabra := subl;	
	END
	ELSE
		subl := subl^.psiguiente;
END;
END;
{-----------------------}
FUNCTION palabras_en_subl(subl:tpalabra):INTEGER;
VAR 
	contador:INTEGER;
BEGIN
	contador := 0;
REPEAT
BEGIN
	subl := subl^.psiguiente;
	INC(contador);
END;
UNTIL(subl = NIL);
	palabras_en_subl := contador;	
END;
{-----------------------}
PROCEDURE imprimir_slist_prin_rec (VAR palabra:tpalabra);
(*contruimos las sublistas sug�n la aparici�n del primer elemento por lo tanto la sublista no vendr� con ning�n nodo*)
BEGIN
	IF (NOT(palabra = NIL)) THEN
	BEGIN	
	WRITELN('* ',palabra^.palabra,' se repite: ',palabra^.napariciones,' veces... *');
	READKEY;
	palabra := palabra^.psiguiente;
	imprimir_slist_prin_rec (palabra);
	END;
END;
{-----------------------}
PROCEDURE eliminar_palabras_q_apar_una_vez (VAR palabra:tpalabra; VAR fdest:tfich);
BEGIN
		IF ((palabra <> NIL) AND (palabra^.napariciones = 1)) THEN
		BEGIN
			WRITELN('-',palabra^.palabra,'-');
			WRITE(fdest,palabra^.palabra,',');
			palabra := palabra^.psiguiente;
			eliminar_palabras_q_apar_una_vez (palabra, fdest);
		END;
END;
BEGIN
END.