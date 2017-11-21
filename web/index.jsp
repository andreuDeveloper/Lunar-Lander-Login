<%-- 
    Document   : index.jsp
    Created on : 05-nov-2017, 16:45:22
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String uid = (String) request.getAttribute("username"); %>

<%
    if (uid == null) {
        response.sendRedirect("youshallnotpass.html");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Lunar Lander</title>
        <meta charset="UTF-8">
        <meta name="description" content="Minijuego Lunar Lander con html, css, y JavaScript">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet' media='screen and (min-width: 601px)' href='css/responsive.css'>
        <link rel='stylesheet' media='screen and (max-width: 600px)' href='css/smartphone.css'>
        <script src="js/js.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>

    <body id="contenedor">

        <div class="container">

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Mod<l content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">OPCIONES</h4>
                        </div>
                        <div class="modal-body center-text">
                            <label for="sel1">Selecciona una configuración existente o crea una nueva</label>
                            <select id="selectConf" class="form-control">

                            </select>
                            <br>
                            <button id="btnLoad" type="button" class="btnC btn btn-primary" data-dismiss="modal">CARGAR CONFIGURACIÓN</button>
                            <br>
                            <button id="btnNewConfig" type="button" class="btnC btn btn-primary" data-dismiss="modal">NUEVA CONFIGURACIÓN</button>
                            <br>
                            <button id="btnDeteteConfig" type="button" class="btnC btn btn-primary">BORRAR CONFIGURACIÓN</button>
                        </div>
                    </div>

                </div>
            </div>

        </div>



        <div id="nave">
            <img id ="imgNave" src="img/nave.png" alt="img nave">
            <img id ="imgMotor" src="img/motor.gif" alt="img motor">
        </div>

        <div id="izquierda">
            <div id="cpanel">
                <div class="controlesNave">Velocidad:<br><b><span id="velocidad">100</span></b> m/s</div>
                <div class="controlesNave">Fuel:<br><b><span id="fuel">100</span></b> %</div>
                <div class="controlesNave">Altura:<br><b><span id="altura">60</span></b> m</div>
                <div id="botonOn"></div>
            </div>
        </div>

        <div id="zonaAterrizaje"><img src="img/luna.png" alt="luna" id="luna"></div>

        <div id="derechaSmartphone">
            <div id="reanudaSmartphone"><p>Play</p></div>
            <div id="pausaSmartphone">Menú</div>
            <div id="reiniciaSmartphone"><p>Reiniciar</p></div>
            <div id="ayudaSmartphone"><p>Ayuda</p></div>
            <div id="botonAjustesSmartphone"><p>Ajustes</p></div>
        </div>

        <div id="derecha">
            <div id="reanudar"><p>Play</p></div>
            <div id="pausa">Pausar</div>
            <div id="reinicia"><p>Reiniciar</p></div>
            <div id="instrucciones"><p>Ayuda</p></div>
            <div id="botonAjustes"><p>Ajustes</p></div>
        </div>

        <div id="gameOver">
            <h2>¡¡¡GAME OVER!!!</h2>
            ¡Inténtalo de nuevo! <br>
            La velocidad de la nave no debe superar los 5 metros/segundo<br><br>
            <button id="jugarOtraVez">Probar otra vez</button>
            <button id="jugarOtraVezSmartphone">Probar otra vez</button>
            <br><br>
            Intentos realizados: <b><span id="intentos">0</span></b><br><br>
        </div>

        <div id="userWin">
            <h2>¡¡¡ENHORABUENA!!!</h2>
            La NASA estaría orgullosa de contar con pilotos como tú...<br><br>
            <img src="img/Enhorabuena.gif"><br>
            <button id="jugarAgain">Jugar otra vez</button>
            <button id="jugarAgainSmartphone">Jugar otra vez</button><br><br>
        </div>

        <div id="menuInstrucciones">
            <a href="#" onclick="ocultarInstrucciones();"><img id="close" src="img/close.png" alt="close"></a>
            <h3>INSTRUCCIONES</h3>
            <p>El juego consiste en frenar la caída de la nave mediante el uso del motor, utiliza la tecla <b>&nbsp;&nbsp;espacio&nbsp;&nbsp;</b> o el botón <b>ON</b> para la version smartphone, para que esta pueda aterrizar adecuadamente sobre la superficie lunar.<br><br>Si el jugador no frena lo suficientemente la caída de la nave ,a una <b>velocidad inferior a los 5 m/s</b>, esta se estrellará y el jugador no superará el juego.<br><br> Además hay que tener en cuenta que la nave cuenta con un medidor de gasolina que se acabará si el jugador abusa del uso del motor de la nave.</p>
            <a href="acerca.html"><button>Acerca de...</button></a>
        </div>

        <div id="settings">
            <a href="#" onclick="ocultarAjustes();"><img id="close" src="img/close.png" alt="close"></a>
            <h3>CREAR CONFIGURACION</h3>
            <p>Dificultad del juego:<br>
                (Disminuye el depósito de gasolina)<br>
                <button class="btnDif" id="dificultadFac">Fácil</button>
                <button class="btnDif" id="dificultadMed">Media</button>
                <button class="btnDif" id="dificultadDif">Difícil</button><br><br>
                Modelo luna:<br>
                <button class="btnLuna" id="modeloLunaAma">Amarilla</button>
                <button class="btnLuna" id="modeloLunaGri">Gris</button>
            </p>
            Modelo nave:<br>
            <button class="btnNave" id="modeloNaveEst">Modelo Estándar</button>
            <button class="btnNave" id="modeloNaveSW">Modelo Star Wars</button><br><br><br>
            <button id="btnSave">Guardar Configuración</button>
            <input id="nameConfigText" type="text"/>
            <br><br>
        </div>

    </body>
</html>
