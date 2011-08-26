input metauml;
beginfig(1);
Class.A("CiudadRMI")
        ()
        ("+CiudadRMI(): void",
	 "+estadoColaSaladeMusculacion(): ArrayList<PlantillaDeportista>",
         "+estadoPistadeTenis(): ArrayList<PlantillaDeportista>",
         "+abrirSaladeMusculacion(): void",
         "+cerrarSaladeMusculacion(): void");
drawObject(A);
endfig;
end