input metauml;

beginfig(1);
Interface.A("iCiudadRMI")
       ("+estadoColaSaladeMusculacion(out:ArrayList<PlantillaDeportista>)",
        "+estadoPistadeTenis(out:ArrayList<PlantillaDeportista>)",
        "+abrirSaladeMusculacion(out:void)",
        "+cerrarSaladeMusculacion(out:void)");

drawObject(A);

endfig;
end
