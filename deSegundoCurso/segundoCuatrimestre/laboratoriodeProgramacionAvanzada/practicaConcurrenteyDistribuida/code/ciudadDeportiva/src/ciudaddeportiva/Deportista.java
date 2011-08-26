package ciudaddeportiva;

/*
 *
 * @author Diego Antonio Lucena Pumar (dlucenap).
 * (C) 2010 para Diego Antonio Lucena Pumar.
 * License:
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
public class Deportista extends Thread {

    private int varIdentificador;
    private boolean estadoDetenido;

    //Constructores
    Deportista(int pIdentificador) {
        varIdentificador = pIdentificador;
        estadoDetenido = false;

    }

    public int getIdentificador() {
        return varIdentificador;
    }

    public void detener() {
        estadoDetenido = true;
    }

    public synchronized void reanudar() {
        estadoDetenido = false;
        notify();
    }

    public void pararEjecucion() {
        try {
            synchronized (this) {
                while (estadoDetenido == true) {
                    wait();
                }
            }
        } catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }
    }

    public void run() {
        try {
            //Se activa
            sleep((long) (100));

        } catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }


        pararEjecucion();

        PlantillaDeportista varPDeportista = new PlantillaDeportista(varIdentificador);

        CiudadDeportiva.piscina.monitorPiscina(varPDeportista);

        CiudadDeportiva.jTextPiscina.setText(CiudadDeportiva.piscina.imprimirPiscina());

        try {
            //DESCANSA
            sleep(((long) (Math.random() * 5000)));
        } catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }
        this.pararEjecucion();
        CiudadDeportiva.piscina.productorPiscina(varPDeportista);
        CiudadDeportiva.jTextPiscina.setText(CiudadDeportiva.piscina.imprimirPiscina());

        boolean vPistadeTenis = false;
        boolean vCampodeGolf = false;
        boolean vSaladeMusculacion = false;

        int opcion = 0;
        while (!vPistadeTenis || !vCampodeGolf || !vSaladeMusculacion) {
            opcion = (int) (((Math.random() * 10) % 3) + 1);
            switch (opcion) {
                //Sala de Musculacion
                case 1: {
                    if (!vSaladeMusculacion) {
                        this.pararEjecucion();
                        CiudadDeportiva.saladeMusculacion.insertarColaMusculacion(varPDeportista);
                        try {
                            sleep((long) (Math.random() * ((1000))));
                        } catch (InterruptedException e) {
                            System.out.println(e.getMessage());
                        }
                        this.pararEjecucion();
                        CiudadDeportiva.saladeMusculacion.insertarenMusculacion(varPDeportista);
                        this.pararEjecucion();
                        if (CiudadDeportiva.saladeMusculacion.estaAbierto()) {
                            try {
                                sleep(((long) (Math.random() * (1500 - 800)) + 800));
                            } catch (InterruptedException e) {
                                System.out.println(e.getMessage());
                            }
                            this.pararEjecucion();
                            CiudadDeportiva.saladeMusculacion.quitarMusculacion(varPDeportista);
                            this.pararEjecucion();
                            vSaladeMusculacion = true;
                            break;
                        }
                    } else {
                        break;
                    }
                }
                //Campo de Golf
                //------> MONITOR CAMPO DE GOLF
                case 2: {
                    if (!vCampodeGolf) {
                        pararEjecucion();
                        //CONSUMIDOR HOYO 1
                        CiudadDeportiva.campodeGolf.consumidorHoyo1(varPDeportista);
                        try {
                            //DESCANSA
                            sleep((((long) (Math.random() * (200)) + 400)));
                        } catch (InterruptedException e) {
                            System.out.println(e.getMessage());
                        }
                        pararEjecucion();
                        //CONSUMIDOR HOYO 2
                        CiudadDeportiva.campodeGolf.consumidorHoyo2(varPDeportista);
                        try {
                            //DESCANSA
                            sleep((((long) (Math.random() * (200)) + 400)));
                        } catch (InterruptedException e) {
                            System.out.println(e.getMessage());
                        }
                        pararEjecucion();
                        //CONSUMIDOR HOYO 3
                        CiudadDeportiva.campodeGolf.consumidorHoyo3(varPDeportista);
                        try {
                            //DESCANSA
                            sleep((((long) (Math.random() * (200)) + 400)));
                        } catch (InterruptedException e) {
                            System.out.println(e.getMessage());
                        }
                        pararEjecucion();
                        //CONSUMIDOR HOYO 4
                        CiudadDeportiva.campodeGolf.consumidorHoyo4(varPDeportista);
                        try {
                            //DESCANSA
                            sleep((((long) (Math.random() * (200)) + 400)));
                        } catch (InterruptedException e) {
                            System.out.println(e.getMessage());
                        }
                        pararEjecucion();
                        //PROCUCTOR CAMPO DE GOLF
                        CiudadDeportiva.campodeGolf.productorCampodeGolf(varPDeportista);
                        pararEjecucion();
                        vCampodeGolf = true;
                        break;
                    } else {
                        break;
                    }
                }
                //Pista de Tenis
                case 3: {
                    if (!vPistadeTenis) {

                        pararEjecucion();
                        CiudadDeportiva.pistadeTenis.insertarenTenis(varPDeportista);


                        pararEjecucion();
                        try {
                            sleep((((long) (Math.random() * (1000 - 500)) + 3000)));
                        } catch (InterruptedException e) {
                            System.out.println(e.getMessage());
                        }
                        pararEjecucion();

                        CiudadDeportiva.pistadeTenis.quitarTenis(varPDeportista);
                        pararEjecucion();

                        vPistadeTenis = true;
                        break;
                    } else {
                        break;
                    }
                }
            }

        }//Fin de While.

        //Finaliza el Hilo
        CiudadDeportiva.JTextFinal.setText("<" + String.valueOf(varIdentificador) + ">");
        System.out.println("Finaliza el Deportista con identificador: " + varIdentificador);
    }
}
