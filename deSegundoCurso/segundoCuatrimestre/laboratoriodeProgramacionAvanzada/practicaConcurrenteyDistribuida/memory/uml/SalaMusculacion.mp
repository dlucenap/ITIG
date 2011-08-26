input metauml;
beginfig(1);
Class.A("SalaMusculacion")
        ("-DeportistasMas: int",
	 "-DeportistasFem: int",
	 "-llenoMas: boolean",
	 "-llenoMas: boolean",
	 "-abierto: boolean",
	 "-deportistaInstalacionMas: ArrayList<PlantillaDeportista>",
	 "-deportistaInstalacionFem: ArrayList<PlantillaDeportista>",
	 "-colaInstalacion: ArrayList<PlantillaDeportista>")
        ("+estaLlenoMas():boolean",
	 "+estaLlenoFem():boolean",
	 "+estaAbierto():boolean",
         "+synchronized setAbierto(boolean abierto):void",
         "+getDeportistaInstalacion() : ArrayList<PlantillaDeportista>",
	 "+getColaInstalacion() : ArrayList<PlantillaDeportista>",
	 "+synchronized mostrarCola():  String",
	 "+synchronized mostrarInstalacion():  String",
	 "+synchronized insertarColaMusculacion(PlantillaDeportista c):  void",
	 "+synchronized insertarenMusculacion(PlantillaDeportista pPlantillaDeportista):  void",
	 "+synchronized insertarenMusculacionMas(PlantillaDeportista pPlantillaDeportista):  void",
	 "+synchronized insertarenMusculacionFem(PlantillaDeportista pPlantillaDeportista):  void",
	 "+synchronized quitarMusculacion(PlantillaDeportista pPlantillaDeportista):  void");
drawObject(A);
endfig;
end