// JavaScript Document
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function MM_preloadImages() { //v3.0
 var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
   var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
   if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function mmLoadMenus() {
  if (window.mm_menu_0328002410_0) return;
    
    //MENU CLIENTE
    window.mm_menu_0328002410_0_1 = new Menu("SubMenu&nbsp;Clientes",124,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#ffff00","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_0_1.addMenuItem("Clientes","location='UsoSistema.jsp?destino=FilCliente.jsp&titulo=Filtrado Cliente'");
	mm_menu_0328002410_0_1.addMenuItem("Tipo&nbsp;Clientes","location='UsoSistema.jsp?destino=FilTipoCliente.jsp&titulo=Filtrado Tipo de Cliente'");
     mm_menu_0328002410_0_1.hideOnMouseOut=true;
     mm_menu_0328002410_0_1.menuBorder=1;
     mm_menu_0328002410_0_1.menuLiteBgColor='#666666';
     mm_menu_0328002410_0_1.menuBorderBgColor='#000000';
     mm_menu_0328002410_0_1.bgColor='#000000';
    
    //MENU PRODUCTO	
    window.mm_menu_0328002410_0_2 = new Menu("SubMenu&nbsp;Productos",124,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#ffff00","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_0_2.addMenuItem("Familias","location='UsoSistema.jsp?destino=FilFamilia.jsp&titulo=Filtrado de Familia'");
    mm_menu_0328002410_0_2.addMenuItem("SubFamilias","location='UsoSistema.jsp?destino=FilSubfamilia.jsp&titulo=Filtrado de Subfamilia'");
    mm_menu_0328002410_0_2.addMenuItem("Otras&nbsp;Caracteristicas","location='UsoSistema.jsp?destino=FilOtraCaracteristica.jsp&titulo=Filtrado Otra Caracteristica'");
    mm_menu_0328002410_0_2.addMenuItem("Productos","location='UsoSistema.jsp?destino=FilProducto.jsp&titulo=Filtrado de Productos'");
    mm_menu_0328002410_0_2.addMenuItem("Conceptos&nbsp;Tecnicos","location='UsoSistema.jsp?destino=FilConceptoTecnico.jsp&titulo=Filtrado Concepto Técnico'");
	mm_menu_0328002410_0_2.addMenuItem("Ficha&nbsp;Tecnicas","location='UsoSistema.jsp?destino=FilFichaTecnica.jsp&titulo=Filtrado Ficha Técnica'");
    mm_menu_0328002410_0_2.addMenuItem("Ingredientes","location='UsoSistema.jsp?destino=FilIngrediente.jsp&titulo=Filtrado de Ingrediente'");
    //mm_menu_0328002410_0_2.addMenuItem("Rendimientos");
     mm_menu_0328002410_0_2.hideOnMouseOut=true;
     mm_menu_0328002410_0_2.menuBorder=1;
     mm_menu_0328002410_0_2.menuLiteBgColor='#666666';
     mm_menu_0328002410_0_2.menuBorderBgColor='#000000';
     mm_menu_0328002410_0_2.bgColor='#000000';
    
	//MENU ADMINISTRADOR
	window.mm_menu_0328002410_0_3 = new Menu("Administrador",58,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#ffff00","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_0_3.addMenuItem("Usuarios","location='pagina_mantenedor_usuario.html'");
    mm_menu_0328002410_0_3.addMenuItem("Niveles");
    mm_menu_0328002410_0_3.addMenuItem("Perfiles");
     mm_menu_0328002410_0_3.hideOnMouseOut=true;
     mm_menu_0328002410_0_3.menuBorder=1;
     mm_menu_0328002410_0_3.menuLiteBgColor='#666666';
     mm_menu_0328002410_0_3.menuBorderBgColor='#000000';
     mm_menu_0328002410_0_3.bgColor='#000000';
  
    //MENU MANTENEDORES  
    /*window.mm_menu_0328002410_0 = new Menu("root",119,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#ffff00","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_0.addMenuItem("Comunas","location='UsoSistema.jsp?destino=FilComuna.jsp&titulo=Filtrado de Comuna'");
    mm_menu_0328002410_0.addMenuItem("Ciudades","location='UsoSistema.jsp?destino=FilCiudad.jsp&titulo=Filtrado de Ciudad'");
    mm_menu_0328002410_0.addMenuItem("Regiones","location='UsoSistema.jsp?destino=FilRegion.jsp&titulo=Filtrado de Región'");
    mm_menu_0328002410_0.addMenuItem("Cargos","location='UsoSistema.jsp?destino=FilCargo.jsp&titulo=Filtrado de Cargo'");
    mm_menu_0328002410_0.addMenuItem("&Aacute;reas","location='UsoSistema.jsp?destino=FilArea.jsp&titulo=Filtrado de Area'");
    mm_menu_0328002410_0.addMenuItem("Funcionarios","location='UsoSistema.jsp?destino=FilFuncionario.jsp&titulo=Filtrado de Funcionario'");
    mm_menu_0328002410_0.addMenuItem(mm_menu_0328002410_0_1);
    mm_menu_0328002410_0.addMenuItem(mm_menu_0328002410_0_2);
    mm_menu_0328002410_0.addMenuItem("Unidad&nbsp;de&nbsp;Medidas","location='UsoSistema.jsp?destino=FilUnidadMedida.jsp&titulo=Filtrado Unidad de Medida'");
    mm_menu_0328002410_0.addMenuItem("Insumos","location='UsoSistema.jsp?destino=FilInsumo.jsp&titulo=Filtrado de Insumo'");
    mm_menu_0328002410_0.addMenuItem("Linea Producci&oacute;n","location='UsoSistema.jsp?destino=FilLineaProduccion.jsp&titulo=Filtrado Linea de Producción'");
    mm_menu_0328002410_0.addMenuItem("Producto&nbsp;por&nbsp;Linea","location='UsoSistema.jsp?destino=FilProductoLinea.jsp&titulo=Filtrado Producto por Linea de Producción'");
    mm_menu_0328002410_0.addMenuItem("Bodega","location='UsoSistema.jsp?destino=FilBodega.jsp&titulo=Filtrado Bodega'");
    mm_menu_0328002410_0.addMenuItem("Stock","location='UsoSistema.jsp?destino=FilStock.jsp&titulo=Filtrado de Stock'");
    mm_menu_0328002410_0.addMenuItem("Ubicaci&oacute;n","location='UsoSistema.jsp?destino=FilUbicacion.jsp&titulo=Filtrado Ubicación'");
     mm_menu_0328002410_0.hideOnMouseOut=true;
     mm_menu_0328002410_0.childMenuIcon="imgenes/arrows.gif";
     mm_menu_0328002410_0.menuBorder=1;
     mm_menu_0328002410_0.menuLiteBgColor='#666666';
     mm_menu_0328002410_0.menuBorderBgColor='#000000';
     mm_menu_0328002410_0.bgColor='#000000';
   */
    //MENU PEDIDOS
	window.mm_menu_0328002410_1_1 = new Menu("SubMenu&nbsp;Pedidos",140,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#ffff00","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_1_1.addMenuItem("Confirmacion&nbsp;Pedidos","location='UsoSistema.jsp?destino=ListaConfirmarPedido.jsp&titulo=Pedidos para Confirmar'");
    mm_menu_0328002410_1_1.addMenuItem("Consulta&nbsp;de&nbsp;Pedidos","location='UsoSistema.jsp?destino=FilPedido.jsp&titulo=Filtrado de Pedidos'");
     mm_menu_0328002410_1_1.hideOnMouseOut=true;
     mm_menu_0328002410_1_1.menuBorder=1;
     mm_menu_0328002410_1_1.menuLiteBgColor='#666666';
     mm_menu_0328002410_1_1.menuBorderBgColor='#000000';
     mm_menu_0328002410_1_1.bgColor='#000000';
	
    //MENU PROGRAMA PRODUCCION
	window.mm_menu_0328002410_1_2 = new Menu("Programa&nbsp;Producci&oacute;n",140,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#ffff00","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_1_2.addMenuItem("Ordenes&nbsp;de&nbsp;Fabricaci&oacute;n","location='UsoSistema.jsp?destino=ListaProgramaOrdenFabricacion.jsp&titulo=Orden Fabricación para Programar'");
    mm_menu_0328002410_1_2.addMenuItem("Consulta&nbsp;Programa","location='UsoSistema.jsp?destino=FilProgramaProduccion.jsp&titulo=Filtrado Programa de Producción'");
     mm_menu_0328002410_1_2.hideOnMouseOut=true;
     mm_menu_0328002410_1_2.menuBorder=1;
     mm_menu_0328002410_1_2.menuLiteBgColor='#666666';
     mm_menu_0328002410_1_2.menuBorderBgColor='#000000';
     mm_menu_0328002410_1_2.bgColor='#000000';
	 
	 //MENU PROGRAMA ENTREGA INSUMO
	 window.mm_menu_0328002410_1_3 = new Menu("SubMenu Entrega&nbsp;Ins.",140,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#ffff00","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_1_3.addMenuItem("Entrega&nbsp;de&nbsp;Insumos","location='UsoSistema.jsp?destino=FilEntregaInsumo.jsp&titulo=Filtrado Entrega Insumos'");
    mm_menu_0328002410_1_3.addMenuItem("Consulta&nbsp;Entrega","location='UsoSistema.jsp?destino=FilConsultaEntregaInsumo.jsp&titulo=Filtrado Consulta Entrega de Insumos'");
     mm_menu_0328002410_1_3.hideOnMouseOut=true;
     mm_menu_0328002410_1_3.menuBorder=1;
     mm_menu_0328002410_1_3.menuLiteBgColor='#666666';
     mm_menu_0328002410_1_3.menuBorderBgColor='#000000';
     mm_menu_0328002410_1_3.bgColor='#000000';
	
	//MENU PROGRAMA DEVOLUCION INSUMO
	 window.mm_menu_0328002410_1_4 = new Menu("SubMenu&nbsp;Devoluci&oacute;n&nbsp;Ins.",140,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#ffff00","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_1_4.addMenuItem("Devoluci&oacute;&nbsp;de&nbsp;Insumos","location='UsoSistema.jsp?destino=FilDevolucionInsumo.jsp&titulo=Filtrado Devolución de Insumos'");
    mm_menu_0328002410_1_4.addMenuItem("Consulta&nbsp;Devoluci&oacute;n&nbsp;","location='UsoSistema.jsp?destino=FilConsultaDevolucionInsumo.jsp&titulo=Filtrado Consulta Devolución de Insumos'");
     mm_menu_0328002410_1_4.hideOnMouseOut=true;
     mm_menu_0328002410_1_4.menuBorder=1;
     mm_menu_0328002410_1_4.menuLiteBgColor='#666666';
     mm_menu_0328002410_1_4.menuBorderBgColor='#000000';
     mm_menu_0328002410_1_4.bgColor='#000000';
	
	//MENU PRODUCCION
	window.mm_menu_0328002410_1_5 = new Menu("SubMenu&nbsp;Producci&oacute;n",140,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#ffff00","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_1_5.addMenuItem("Captura&nbsp;Producci&oacute;n","location='UsoSistema.jsp?destino=FilCapturaProduccion.jsp&titulo=FilCaptura de Producción'");
    //mm_menu_0328002410_1_1.addMenuItem("Modificaci&oacute;n&nbsp;Producci&oacute;n");
     mm_menu_0328002410_1_5.hideOnMouseOut=true;
     mm_menu_0328002410_1_5.menuBorder=1;
     mm_menu_0328002410_1_5.menuLiteBgColor='#666666';
     mm_menu_0328002410_1_5.menuBorderBgColor='#000000';
     mm_menu_0328002410_1_5.bgColor='#000000';
  
    //TRANSACCIONES
    window.mm_menu_0328002410_1 = new Menu("root",155,20,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#ffff00","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    //mm_menu_0328002410_1.addMenuItem(mm_menu_0328002410_1_1);
    //mm_menu_0328002410_1.addMenuItem("Programas&nbsp;de&nbsp;Producci&oacute;n","location='UsoSistema.jsp?destino=FilProgramaProduccion.jsp&titulo=Filtrado Programa de Produccion'");
     mm_menu_0328002410_1.addMenuItem("Entrega&nbsp;de&nbsp;Insumos","location='UsoSistema.jsp?destino=FilEntregaInsumo.jsp&titulo=Filtrado Entrega de Insumos'");
    //mm_menu_0328002410_1.addMenuItem(mm_menu_0328002410_1_3);
	mm_menu_0328002410_1.addMenuItem("Devoluci&oacute;n&nbsp;de&nbsp;Insumos","location='UsoSistema.jsp?destino=FilDevolucionInsumo.jsp&titulo=Filtrado Devolución de Insumos'");
	mm_menu_0328002410_1.addMenuItem("Captura&nbsp;de&nbsp;Producci&oacute;n","location='UsoSistema.jsp?destino=FilCapturaProduccion.jsp&titulo=Filtrado Captura Producción'");
    //mm_menu_0328002410_1.addMenuItem(mm_menu_0328002410_1_1);
    mm_menu_0328002410_1.addMenuItem("Ingreso&nbsp;de&nbsp;Insumos","location='UsoSistema.jsp?destino=NuevoIngresoInsumo.jsp&titulo=Nuevo Ingreso Insumo'");
	//mm_menu_0328002410_1.addMenuItem(mm_menu_0328002410_1_3);
    //mm_menu_0328002410_1.addMenuItem(mm_menu_0328002410_1_4);
	
	//mm_menu_0328002410_1.addMenuItem("Captura&nbsp;de&nbsp;Producci&oacute;n","location='UsoSistema.jsp?destino=FilCapturaProduccion.jsp&titulo=Filtrado Captura Producción'");
    //mm_menu_0328002410_1.addMenuItem(mm_menu_0328002410_1_1);
    //mm_menu_0328002410_1.addMenuItem("Ingreso&nbsp;de&nbsp;Insumos","location='UsoSistema.jsp?destino=NuevoIngresoInsumo.jsp&titulo=Nuevo Ingreso Insumo'");
    //mm_menu_0328002410_1.addMenuItem("Solicitud&nbsp;de&nbsp;Productos","location='ControlUsoSistema.jsp?destino=NuevaSolicitudProducto.jsp&titulo=Nueva Solicitud Producto'");
	 mm_menu_0328002410_1.hideOnMouseOut=true;
     mm_menu_0328002410_1.childMenuIcon="imgenes/arrows.gif";
     mm_menu_0328002410_1.menuBorder=1;
     mm_menu_0328002410_1.menuLiteBgColor='#666666';
     mm_menu_0328002410_1.menuBorderBgColor='#000000';
     mm_menu_0328002410_1.bgColor='#000000';
  
    //MENU INFORMES Y/O CONSULTAS
    /*window.mm_menu_0328002410_2 = new Menu("root",168,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#ffff00","#337b67","#337b67","left","middle",1,1,1000,-5,7,true,true,true,4,true,true);
    mm_menu_0328002410_2.addMenuItem("Partes&nbsp;Producci&oacute;n","location='pagina_consulta_produccion.html'");
    mm_menu_0328002410_2.addMenuItem("Estados&nbsp;de&nbsp;la&nbsp;s&nbsp;O.F.","location='pagina_consultar_por_orden_de_fabricacion.html'");
    mm_menu_0328002410_2.addMenuItem("Producci&oacute;n&nbsp;por&nbsp;Linea","location='pagina_consultar_por_linea_de_produccion.html'");
    mm_menu_0328002410_2.addMenuItem("Producci&oacute;n&nbsp;por&nbsp;Productos","location='pagina_consultar_por_producto.html'");
    mm_menu_0328002410_2.addMenuItem("Producci&oacute;n&nbsp;por&nbsp;fecha","location='pagina_consultar_por_fecha.html'");
    mm_menu_0328002410_2.addMenuItem("Producci&oacute;n&nbsp;por&nbsp;cliente","location='pagina_consultar_por_cliente.html'");
    mm_menu_0328002410_2.addMenuItem("Rendimientos&nbsp;de&nbsp;Producci&oacute;n","location='pagina_consultar_rendimiento.html'");
    mm_menu_0328002410_2.addMenuItem("Determinaci&oacute;n&nbsp;de&nbsp;Insumos");
     mm_menu_0328002410_2.hideOnMouseOut=true;
     mm_menu_0328002410_2.menuBorder=1;
     mm_menu_0328002410_2.menuLiteBgColor='#666666';
     mm_menu_0328002410_2.menuBorderBgColor='#000000';
     mm_menu_0328002410_2.bgColor='#000000';
  */
  
    //MENU SALIR 
    window.mm_menu_0328002410_3 = new Menu("root",114,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#ffff00","#337b67","#337b67","left","middle",1,1,1000,-5,7,true,true,true,4,true,true);
   mm_menu_0328002410_3.addMenuItem("Cambiar&nbsp;Usuario","location='ControlUsoSistema.jsp?destino=index.jsp'");
    mm_menu_0328002410_3.addMenuItem("Salida&nbsp;del&nbsp;Sistema","window.close();");
     mm_menu_0328002410_3.hideOnMouseOut=true;
     mm_menu_0328002410_3.menuBorder=1;
     mm_menu_0328002410_3.menuLiteBgColor='#666666';
     mm_menu_0328002410_3.menuBorderBgColor='#000000';
     mm_menu_0328002410_3.bgColor='#000000';
     mm_menu_0328002410_3.writeMenus();
} // mmLoadMenus()
