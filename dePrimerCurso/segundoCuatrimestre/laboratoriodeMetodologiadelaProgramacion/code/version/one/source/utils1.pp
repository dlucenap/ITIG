UNIT utils1;
INTERFACE
USES crt, basic, utils2;
TYPE
	tnodolistp = ^nodop;
	nodop = RECORD
	size : BYTE;
	palabra: tpalabra;
	psiguiente: tnodolistp;
	END;
	(*lo anado por concepto pero no tiene utilidad ninguna simplemente aclarar y abstraer el concepto lista*)
	tlistp = tnodolistp; 
{-----------------------}
PROCEDURE inicializar_lista_principal(VAR listp:tlistp);
FUNCTION es_lista_vacia (VAR listp:tlistp):BOOLEAN;
PROCEDURE devolver_ptr_nodo_buscand_por_tam_si_existe (VAR listp:tlistp; VAR nodo_ptr:tnodolistp; MINW:BYTE; clave:INTEGER;VAR encontrado:BOOLEAN);
PROCEDURE insertar_palabra_en_lista (VAR listp:tlistp; nodo_lista:tnodolistp; MINW:BYTE);
PROCEDURE imprimir_lista (listp:tlistp);
PROCEDURE ordenar_por_met_burbuja_sub (VAR subl:tpalabra);
PROCEDURE imprimir_list_prin_rec (VAR nodo_actual:tnodolistp);
PROCEDURE buscar_palabras_por_letra_en_listp (nodo_actual:tnodolistp; letra:CHAR; tot_words:INTEGER);
IMPLEMENTATION
PROCEDURE inicializar_lista_principal(VAR listp:tlistp);
BEGIN
listp := NIL;
END;
{-----------------------}
FUNCTION es_lista_vacia (VAR listp:tlistp):BOOLEAN;
BEGIN
es_lista_vacia := (listp^.size = 0);
END;
{-----------------------}
{
Autor: Diego Antonio Lucena Pumar;
Fecha de creacion: Mayo del 2008;
Tipo: Funcion;
Proposito: Devuelve el nodo que tiene el mismo tamano de palabras o en su defecto el anterior;
Precondicion: ;
Postcondicion: Devuelve el nodo que tiene el mismo tamano de palabras o en su defecto el anterior;
}
PROCEDURE devolver_ptr_nodo_buscand_por_tam_si_existe (VAR listp:tlistp; VAR nodo_ptr:tnodolistp; MINW:BYTE; clave:INTEGER;VAR encontrado:BOOLEAN);
VAR 
	nodoaux:tnodolistp;
BEGIN
	nodoaux := listp;
REPEAT 
BEGIN
		REPEAT 			
		BEGIN
		IF (nodoaux^.size = clave) THEN 
		BEGIN
			nodo_ptr := nodoaux;
			encontrado := true;
		
		END
		ELSE
		BEGIN
			nodoaux := nodoaux^.psiguiente;
		END;
			
		END;
		UNTIL ((nodoaux = NIL) OR (encontrado));
		DEC(clave);
		nodoaux := listp;
END;
UNTIL ((clave < MINW ) OR (encontrado));
END;
{-----------------------}
PROCEDURE insertar_palabra_en_lista (VAR listp:tlistp; nodo_lista:tnodolistp; MINW:BYTE);
VAR
	nodo_ptr:tnodolistp;
	palabra:tpalabra;
	encontrado:BOOLEAN;
BEGIN
	
	IF(es_lista_vacia(listp)) THEN
	(*es el primer elemento de la lista*)
	BEGIN
		inicializar_lista_principal(listp);
	nodo_lista^.psiguiente := NIL;
	listp := nodo_lista;
	END
	ELSE
	BEGIN
		encontrado := false;
		nodo_ptr := listp;
		devolver_ptr_nodo_buscand_por_tam_si_existe (listp,nodo_ptr,MINW,LENGTH(nodo_lista^.palabra^.palabra),encontrado);
		IF (encontrado) THEN
		BEGIN 
			IF (esta_palabra_en_subl(nodo_ptr^.palabra,nodo_lista^.palabra^.palabra)) THEN
			(*ha encontrado el anterior y esta la palabra en la sublista*)
			BEGIN
			devuelve_ptr_palabra_en_subl(nodo_ptr^.palabra,nodo_lista^.palabra^.palabra,palabra);
			INC(palabra^.napariciones);
			END
			ELSE
			BEGIN
				IF (nodo_ptr^.size = nodo_lista^.size) THEN
				(*ha encontrado el anterior, las palabras son distintas pero tienen el mismo tamano*)
				BEGIN
				insertar_palabra_en_subl (nodo_ptr^.palabra, nodo_lista^.palabra);
				END
				ELSE 
				(*ha encontrado el anterior, las palabras son distintas y tienen tamano menor*)
				BEGIN
				nodo_lista^.psiguiente := nodo_ptr^.psiguiente;
				nodo_ptr^.psiguiente := nodo_lista;
				END;
			END;
		END
		ELSE 
		(*no ha encontrado el anterior, lo insertamos como primer elemento de la lista*)
		BEGIN
			nodo_lista^.psiguiente := listp;
			listp := nodo_lista;
		END;
	END;
END;
{-----------------------}
PROCEDURE imprimir_lista (listp:tlistp);
VAR
	anterior:tnodolistp;
	palabra_ante:tpalabra;
BEGIN
	anterior := listp;
REPEAT 
BEGIN
	WRITELN('* SIZE OF WORDS GROUP *');
	WRITELN('* ',anterior^.size,' *');
	READKEY;
	palabra_ante := anterior^.palabra;
	WRITELN('* WORDS OF GROUP *');
	REPEAT 
	BEGIN
		WRITELN('* ',palabra_ante^.palabra,' se repite: ',palabra_ante^.napariciones,' veces... *');
		palabra_ante := palabra_ante^.psiguiente;
		READKEY;
	END;
	UNTIL (palabra_ante = NIL);
	anterior := anterior^.psiguiente;
END;
UNTIL (anterior = NIL);
END;
{-----------------------}
PROCEDURE ordenar_por_met_burbuja_sub (VAR subl:tpalabra);
VAR 
	i,j,tam:INTEGER;
	napariciones : BYTE;
	palabra : STRING;
	subls:tpalabra;
BEGIN
tam := palabras_en_subl(subl);
FOR i:= 1 TO (tam - 1) DO
BEGIN
	subls := subl;
        FOR j := 1 TO (tam - i) DO
	BEGIN		
		IF (subls^.napariciones > subls^.psiguiente^.napariciones) THEN
		BEGIN
			napariciones := subls^.napariciones;
			palabra := subls^.palabra;
			subls^.napariciones := subls^.psiguiente^.napariciones;
			subls^.palabra := subls^.psiguiente^.palabra;	
			subls^.psiguiente^.napariciones := napariciones;
			subls^.psiguiente^.palabra := palabra;
		END;
		subls := subls^.psiguiente;	
	END;	
END;
	
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
PROCEDURE imprimir_list_prin_rec (VAR nodo_actual:tnodolistp);
(*previamente nodo_actual debe estar incializado a listp*)
VAR 
	palabra_ante:tpalabra;
BEGIN
	IF (NOT(nodo_actual = NIL)) THEN
	BEGIN	
	WRITELN('* SIZE OF WORDS GROUP *');
	WRITELN('* ',nodo_actual^.size,' *');
	READKEY;
	palabra_ante := nodo_actual^.palabra;
	WRITELN('* WORDS OF GROUP *');	
	imprimir_slist_prin_rec (palabra_ante);
	nodo_actual := nodo_actual^.psiguiente;
	imprimir_list_prin_rec (nodo_actual);
	END;
END;

PROCEDURE buscar_palabras_por_letra_en_listp(nodo_actual:tnodolistp; letra:CHAR; tot_words:INTEGER);
VAR 
	fdest:tfich;
	palabra:tpalabra;
	es_correcto:BOOLEAN;
BEGIN
abrir_fich_en_modo_rw ('fich_output3.txt',fdest, es_correcto);
	WHILE (nodo_actual <> NIL) DO
	BEGIN
		palabra := nodo_actual^.palabra;
		WHILE (palabra <> NIL) DO
		BEGIN
			IF (palabra^.palabra[1] = letra) THEN
			BEGIN	
				WRITELN('* ',palabra^.palabra,' is repeat: ',palabra^.napariciones,' ... *',', % of aparition:', (palabra^.napariciones * 100) / tot_words);
				READKEY;
				WRITELN(fdest, palabra^.palabra,',',', % of aparition:', (palabra^.napariciones * 100) / tot_words);
			END;
		palabra := palabra^.psiguiente;
		END;
	nodo_actual := nodo_actual^.psiguiente;
	END;
CLOSE(fdest);
END;
BEGIN
END.

