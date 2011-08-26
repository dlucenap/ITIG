input metauml;
beginfig(1);
Class.A("CampoGolf")
        ("-llenoHoyo1: boolean",
	 "-llenoHoyo2: boolean",
	 "-llenoHoyo3: boolean",
	 "-llenoHoyo4: boolean",
         "-deportistaHoyo1: ArrayList<PlantillaDeportista> ",
	 "-deportistaHoyo2: ArrayList<PlantillaDeportista> ",
	 "-deportistaHoyo3: ArrayList<PlantillaDeportista> ",
	 "-deportistaHoyo4: ArrayList<PlantillaDeportista> ",
	 "-colaCiudadDeportiva: ArrayList<PlantillaDeportista> ",
	 "-numMaximoDeportistas: int")
	("+public CampoGolf(): void",
	 "+estaLlenoHoyo1(): boolean",
	 "+estaLlenoHoyo2(): boolean",
         "+estaLlenoHoyo3(): boolean",
	 "+estaLlenoHoyo4(): boolean",
         "+imprimirColadeCampodeGolf(): String",
	 "+synchronized mostrarHoyo1(): String",
	 "+synchronized mostrarHoyo2(): String",
	 "+synchronized mostrarHoyo3(): String",
	 "+synchronized mostrarHoyo4(): String",
	 "+synchronized consumidorHoyo1(PlantillaDeportista pPlantillaDeportista): void",  
	 "+synchronized consumidorHoyo2(PlantillaDeportista pPlantillaDeportista): void", 
	 "+synchronized consumidorHoyo3(PlantillaDeportista pPlantillaDeportista): void", 
	 "+synchronized consumidorHoyo4(PlantillaDeportista pPlantillaDeportista): void",     
	 "+synchronized productorCampodeGolf(PlantillaDeportista pPlantillaDeportista): void");
drawObject(A);
endfig;
end