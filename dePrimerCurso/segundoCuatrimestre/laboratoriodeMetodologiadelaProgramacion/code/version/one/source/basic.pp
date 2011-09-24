{
Autor: Diego Antonio Lucena Pumar;
Fecha de creacion: Abril del 2008;
Tipo: Archivo .pp, libreria dinamica;
Proposito: Propociona procedimientos y funciones basicas, de hay su nombre para el programa GAME OF WORDS;
Ultima actualizacion: 10-5-2008;
}
UNIT basic;
INTERFACE
TYPE
	tcaracteres = SET OF CHAR;
        tficht = TEXT;
FUNCTION esta_entre_min_y_max (min,max:BYTE;palabra:STRING):BOOLEAN;
FUNCTION contiene_vocal (palabra:STRING):BOOLEAN;
FUNCTION contiene_caract_no_alfab (palabra:STRING):BOOLEAN;
FUNCTION es_valida_rep (palabra:STRING;VAR cursor:BYTE):BOOLEAN;
PROCEDURE es_valida_semanticamente (palabra:STRING; VAR es_valida:BOOLEAN);
PROCEDURE eliminar_conso_val_rep_mas_de_dos_veces (VAR palabra:STRING);
PROCEDURE eliminar_letras_rep (VAR palabra:STRING);
PROCEDURE limpiar_palabra(VAR palabra:STRING);
PROCEDURE abrir_fich_en_modo_lect (path:STRING; VAR fich_lect:tficht; VAR es_correcto:BOOLEAN);
PROCEDURE abrir_fich_en_modo_rw (path:STRING; VAR fich_dest:tficht; VAR es_correcto:BOOLEAN);
IMPLEMENTATION
{
Autor: Diego Antonio Lucena Pumar;
Fecha de creacion: Abril del 2008;
Tipo: Funcion;
Proposito: Calcula si la palabra es valida en un determinado rango entre min y max;
Precondicion: min debe ser menor que max;
Postcondicion: Devuelve true en el caso que este en el rango, flase en caso contrario;
}
FUNCTION esta_entre_min_y_max (min,max:BYTE;palabra:STRING):BOOLEAN;

(*Precondicion: min debe ser < max*)
BEGIN
	esta_entre_min_y_max := ((LENGTH(palabra) >= min) AND (LENGTH(palabra) <= max))
END;
{-----------------------------------------------}
{
Autor: Diego Antonio Lucena Pumar;
Fecha de creacion: Abril del 2008;
Tipo: Funcion;
Proposito: Busca en la palabra cualquier vocal;
Precondicion:;
Postcondicion: Devuelve true en el caso que exista vocal en la palabra, flase en caso contrario;
}
FUNCTION contiene_vocal (palabra:STRING):BOOLEAN;
TYPE
	tvocales = SET OF CHAR;
VAR
	contador:BYTE;
	contiene:BOOLEAN;
	conjvocales:tvocales;
BEGIN
	conjvocales := ['A','E','I','O','U'];
	contiene := false;
	contador := 1;
	WHILE ((contiene = false) AND (contador <= LENGTH(palabra))) DO
	BEGIN
		IF (UPCASE(palabra[contador]) IN conjvocales) THEN
		   contiene := true
		ELSE
		   INC(contador)
        END;
        contiene_vocal := contiene
END;
{---------------------------------------------------------}
{
Autor: Diego Antonio Lucena Pumar;
Fecha de creacion: Abril del 2008;
Tipo: Funcion;
Proposito: Calcula si la palabra contiene caracteres no alfabeticos;
Precondicion:;
Postcondicion: Devuelve true en el caso que contengan estos caracteres, flase en caso contrario;
}
FUNCTION contiene_caract_no_alfab (palabra:STRING):BOOLEAN;
TYPE
	tcaracteres = SET OF CHAR;
VAR
	contador:BYTE;
	contiene:BOOLEAN;
	conjcaracteresalfa:tcaracteres;
BEGIN
	contador := 1;
	contiene := false;
	conjcaracteresalfa := ['A'..'Z'];
	WHILE ((contiene = false) AND (contador <= LENGTH(palabra))) DO
	BEGIN
		IF (NOT(palabra[contador] IN conjcaracteresalfa)) THEN
		   contiene := true;
		INC(contador);
	END;
        contiene_caract_no_alfab := contiene
END;
{-----------------------------------------------------------}
{
Autor: Diego Antonio Lucena Pumar;
Fecha de creacion: Abril del 2008;
Tipo: Funcion;
Proposito: Calcula si la contiene una repeticion valida;
Precondicion: El cursor no debe ser enviado en la ultima posicion;
Postcondicion: Devuelve true en el caso que la repeticion sea valida, flase en caso contrario;
}
FUNCTION es_valida_rep (palabra:STRING;VAR cursor:BYTE):BOOLEAN;
BEGIN
   es_valida_rep := ((palabra[cursor] = palabra[cursor + 1]) AND (palabra[cursor] <> palabra[cursor + 2]));
   (*incrementamos el cursor en dos posiciones por la validacion, no es posible la combinacion por ejemplo rrlla en la realidad..., tampoco se daria por valida ccllr*)
   cursor := cursor + 2;
END;
{-----------------------------------------------------------}
{
Autor: Diego Antonio Lucena Pumar;
Fecha de creacion: Abril del 2008;
Tipo: Funcion;
Proposito: Analiza si la palabra es valida desde el punto de vista semantico;
Precondicion:;
Postcondicion: Devuelve es_valida a true en el caso que la palabra lo sea, flase en caso contrario;
}
PROCEDURE es_valida_semanticamente (palabra:STRING; VAR es_valida:BOOLEAN);
VAR
	cursor:BYTE;
	conjconsoval:tcaracteres;
BEGIN
	conjconsoval := ['R','L','C'];
	es_valida := true;
	cursor := 1;
	WHILE((cursor < length(palabra)) AND (es_valida = true)) DO 
	BEGIN    
        IF (palabra[cursor] IN conjconsoval) THEN
	es_valida := es_valida_rep (palabra , cursor);
	INC(cursor)
	END
END;
{-----------------------------------------------------------}
{
Autor: Diego Antonio Lucena Pumar;
Fecha de creacion: Abril del 2008;
Tipo: Funcion;
Proposito:;
Precondicion:;
Postcondicion:;
}
PROCEDURE eliminar_conso_val_rep_mas_de_dos_veces (VAR palabra:STRING);
VAR	  
	contador:BYTE;
        conjconsoval:tcaracteres;
BEGIN
	conjconsoval := ['R','L','C'];
	contador := 1;
		WHILE(contador < length(palabra)) DO
	BEGIN
	IF((palabra[contador] = palabra[contador + 1]) AND (palabra[contador +1 ] = palabra[contador + 2]) AND (palabra[contador] IN(conjconsoval))) THEN
		DELETE(palabra,contador,1);
	INC(contador); 
	END;
END;
{-----------------------------------------------------------}
{
Autor: Diego Antonio Lucena Pumar;
Fecha de creacion: Abril del 2008;
Tipo: Funcion;
Proposito:;
Precondicion:;
Postcondicion:;
}
PROCEDURE eliminar_letras_rep (VAR palabra:STRING);
VAR	  
	contador:BYTE;
        conjconsoval:tcaracteres;
BEGIN
	conjconsoval := ['R','L','C'];
	contador := 1;
		WHILE(contador < length(palabra)) DO
	BEGIN
	IF((palabra[contador] = palabra[contador + 1]) AND NOT(palabra[contador] IN(conjconsoval))) THEN
		DELETE(palabra,contador,1)
	ELSE
		INC(contador); 
	END;
END;
{-----------------------------------------------------------}
{
Autor: Diego Antonio Lucena Pumar;
Fecha de creacion: Abril del 2008;
Tipo: Funcion;
Proposito: Limpia una palabra de blancos, salto de linea y retorno de carro;
Precondicion: El cursor no debe ser enviado en la ultima posicion;
Postcondicion: Devuelve la palabra "limpia";
}
PROCEDURE limpiar_palabra(VAR palabra:STRING);
VAR 
	i:BYTE;
BEGIN
	
FOR i:= 1 TO LENGTH(palabra) DO
		IF((palabra[i] = #10) OR (palabra[i] = #13) OR (palabra[i] = #32)) THEN
			DELETE(palabra,i,1);
	
END;
{-----------------------------------------------------------}
PROCEDURE abrir_fich_en_modo_lect (path:STRING; VAR fich_lect:tficht; VAR es_correcto:BOOLEAN);
BEGIN
ASSIGN(fich_lect,path);
{$I-}
RESET(fich_lect);
{$I+}
IF (IOResult = 0) THEN
	es_correcto := true;
END;
{-----------------------------------------------------------}
PROCEDURE abrir_fich_en_modo_rw (path:STRING; VAR fich_dest:tficht; VAR es_correcto:BOOLEAN);
//hay que mirar si se puede comprobar el path de acceso al fichero
BEGIN
	ASSIGN(fich_dest,path);
	REWRITE(fich_dest);
	es_correcto := true;
END;
BEGIN
END.
