<style>
    .boton {
        margin-top: 20px;
    }
</style>

<div class="container">
    <form action="../../controler/ejercicioAgregado.php" method="get">
        <div class="row">

            <div class="col-md-6 text-center">
                <img src="https://media-public.canva.com/ENy18/MAFNeiENy18/1/tl.png" class="img-fluid" width="50%"
                    alt="Foto">
            </div>
            <div class="col-md-6">

                <div class="row">

                    <h1>Informacion gimnasio</h1>
                    <div class="col-md-12">
                        <label class="form-label">Nombre</label>

                        <input type="text" name="nombreGimnasio" class="form-control">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Categoria</label>

                        <input type="text" name="categoriaGimnasio" class="form-control">
                    </div>

                    <div class="col-md-12">
                        Descripcion
                        <textarea class="form-control" placeholder="Escribe aqui..." name="Descripcion"
                            id="floatingTextarea2" style="height: 100px"></textarea>
                    </div>
                    <div class="col-md1-12">
                        <!--
<label class="form-label">Horario</label>
                        <input type="text" name="horario" class="form-control">                    
-->
                        <h2>Horarios</h2>
                        <div class="row">
                            <div class="col-md-6">Lunes a viernes</div>
                            <div class="col-md-6"><input type="time" class="form-control"></div>
                            <div class="col-md-6">Sabados y festivos</div>
                            <div class="col-md-6"><input type="time" class="form-control"></div>
                        </div>
                    </div>
                    <h2>Contacto</h2>
                    <div class="col-md-6">
                        <label class="form-label">Telefono</label>
                        <input type="text" name="telefono" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label"><label>
                                Direccion
                            </label></label>
                        <input type="text" name="Direccion" class="form-control">
                    </div>
                    <h2>Servicios</h2>
                    <div class="col-md-12">
                        Instalaciones y servicios
                        <textarea class="form-control" placeholder="Escribe aqui..." name="Instalaciones y servicios"
                            id="floatingTextarea2" style="height: 100px"></textarea>
                    </div>


                    <div class="col-md-12">
                        Agrega fotos del gimnasio <br>
                        <div class="input-group">

                            <input type="file" name="fotos del gimnasio " class="form-control" id="inputGroupFile04"
                                aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                        </div>
                    </div>

                    <div class="col-md-12">
                        <label class="form-label">Mision</label>
                        <input type="text" name="mision" class="form-control">
                    </div>

                    <div class="col-md-12">
                        <label class="form-label">Vision</label>
                        <input type="text" name="vision" class="form-control">
                    </div>

                    <div class="col-md-12">
                        <label class="form-label">Formas de pago</label>
                        <input type="text" name="formas_de_pago" class="form-control">
                    </div>

                    <div class="col-md-12">
                        <label class="form-label">Ofertas y promociones</label>
                        <input type="text" name="ofertas_y_promociones" class="form-control">
                    </div>

                    <h1>Datos gerente</h1>

                    <div class="col-md-12">
                        <label class="form-label">Nombre Completo</label>
                        <input type="text" name="Nombre Completo" class="form-control">
                    </div>

                    <div class="col-md-12">
                        <label class="form-label">Apellidos</label>
                        <input type="text" name="Apellidos" class="form-control">
                    </div>

                    <div class="col-md-12">
                        <label class="form-label">Educación</label>
                        <input type="text" name="Educación" class="form-control">
                    </div>

                    <div class="col-md-12">
                        <label class="form-label">Experiencia laboral </label>
                        <input type="text" name="Experiencia laboral" class="form-control">
                    </div>

                </div>
            </div>
            <br>
            <div class="col-md-12 text-center">
                <button type="submit" class="btn btn-primary boton">Registrar</button>
            </div>
        </div>
</div>
</div>
</form>
</div>