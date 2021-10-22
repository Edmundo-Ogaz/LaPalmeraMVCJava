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
    window.mm_menu_0328002410_0_1 = new Menu("SubMenu&nbsp;Clientes",124,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#000000","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_0_1.addMenuItem("Clientes","location='pagina_mantenedor_cliente.html'");
    mm_menu_0328002410_0_1.addMenuItem("Tipos de Clientes");
	 mm_menu_0328002410_0_1.hideOnMouseOut=true;
     mm_menu_0328002410_0_1.menuBorder=1;
     mm_menu_0328002410_0_1.menuLiteBgColor='#666666';
     mm_menu_0328002410_0_1.menuBorderBgColor='#000000';
     mm_menu_0328002410_0_1.bgColor='#000000';
    window.mm_menu_0328002410_0_2 = new Menu("SubMenu&nbsp;Productos",124,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#000000","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_0_2.addMenuItem("Familias","location='pagina_mantenedor_familia.html'");
    mm_menu_0328002410_0_2.addMenuItem("SubFamilias");
    mm_menu_0328002410_0_2.addMenuItem("Otras&nbsp;Caracteristicas","location='pagina_mantenedor_otras_caracteristicas.html'");
    mm_menu_0328002410_0_2.addMenuItem("Productos","location='pagina_mantenedor_producto.html'");
    mm_menu_0328002410_0_2.addMenuItem("Ficha&nbsp;Tecnicas","location='pagina_mantenedor_ficha_tecnica.html'");
    mm_menu_0328002410_0_2.addMenuItem("Recetas","location='pagina_mantenedor_receta.html'");
    mm_menu_0328002410_0_2.addMenuItem("Rendimientos");
     mm_menu_0328002410_0_2.hideOnMouseOut=true;
     mm_menu_0328002410_0_2.menuBorder=1;
     mm_menu_0328002410_0_2.menuLiteBgColor='#666666';
     mm_menu_0328002410_0_2.menuBorderBgColor='#000000';
     mm_menu_0328002410_0_2.bgColor='#000000';
    window.mm_menu_0328002410_0_3 = new Menu("Administrador",58,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#000000","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_0_3.addMenuItem("Usuarios","location='pagina_mantenedor_usuario.html'");
    mm_menu_0328002410_0_3.addMenuItem("Niveles");
    mm_menu_0328002410_0_3.addMenuItem("Perfiles");
     mm_menu_0328002410_0_3.hideOnMouseOut=true;
     mm_menu_0328002410_0_3.menuBorder=1;
     mm_menu_0328002410_0_3.menuLiteBgColor='#666666';
     mm_menu_0328002410_0_3.menuBorderBgColor='#000000';
     mm_menu_0328002410_0_3.bgColor='#000000';
  window.mm_menu_0328002410_0 = new Menu("root",119,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#000000","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
  mm_menu_0328002410_0.addMenuItem("Comunas","location='pagina_mantenedor_comuna.html'");
  mm_menu_0328002410_0.addMenuItem("Ciudades","location='pagina_mantenedor_ciudad.html'");
  mm_menu_0328002410_0.addMenuItem("Regiones","location='pagina_mantenedor_region.html'");
  mm_menu_0328002410_0.addMenuItem("Cargos","location='pagina_mantenedor_cargo.html'");
  mm_menu_0328002410_0.addMenuItem("&Aacute;reas","location='pagina_mantenedor_area.html'");
  mm_menu_0328002410_0.addMenuItem("Funcionarios","location='pagina_mantenedor_funcionario.html'");
  mm_menu_0328002410_0.addMenuItem(mm_menu_0328002410_0_1);
  mm_menu_0328002410_0.addMenuItem(mm_menu_0328002410_0_2);
  mm_menu_0328002410_0.addMenuItem("Conceptos&nbsp;Tecnicos","location='pagina_mantenedor_concepto_tecnico.html'");
  mm_menu_0328002410_0.addMenuItem("Unidad&nbsp;de&nbsp;Medidas","location='pagina_mantenedor_unidad_de_medida.html'");
  mm_menu_0328002410_0.addMenuItem("Insumos","location='pagina_mantenedor_insumo.html'");
  mm_menu_0328002410_0.addMenuItem(mm_menu_0328002410_0_3);
  mm_menu_0328002410_0.addMenuItem("Mes&oacute;n","location='pagina_mantenedor_meson.html'");
  mm_menu_0328002410_0.addMenuItem("Bodega","location='pagina_mantenedor_bodega.html'");
  mm_menu_0328002410_0.addMenuItem("Ubicaci&oacute;n","location='pagina_mantenedor_ubicacion.html'");
   mm_menu_0328002410_0.hideOnMouseOut=true;
   mm_menu_0328002410_0.childMenuIcon="imágenes/arrows.gif";
   mm_menu_0328002410_0.menuBorder=1;
   mm_menu_0328002410_0.menuLiteBgColor='#666666';
   mm_menu_0328002410_0.menuBorderBgColor='#000000';
   mm_menu_0328002410_0.bgColor='#000000';
    window.mm_menu_0328002410_1_1 = new Menu("SubMenu&nbsp;Producci&oacute;n",140,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#000000","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
    mm_menu_0328002410_1_1.addMenuItem("Captura&nbsp;Producci&oacute;n","location='pagina_produccion.html'");
    mm_menu_0328002410_1_1.addMenuItem("Modificaci&oacute;n&nbsp;Producci&oacute;n");
     mm_menu_0328002410_1_1.hideOnMouseOut=true;
     mm_menu_0328002410_1_1.menuBorder=1;
     mm_menu_0328002410_1_1.menuLiteBgColor='#666666';
     mm_menu_0328002410_1_1.menuBorderBgColor='#000000';
     mm_menu_0328002410_1_1.bgColor='#000000';
  window.mm_menu_0328002410_1 = new Menu("root",149,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#000000","#337b67","#337b67","left","middle",1,1,1000,0,0,true,true,true,4,true,true);
  mm_menu_0328002410_1.addMenuItem("Nota&nbsp;de&nbsp;Pedido");
  mm_menu_0328002410_1.addMenuItem("Programas&nbsp;Producci&oacute;n","location='pagina_programar_pedido.html'");
  mm_menu_0328002410_1.addMenuItem(mm_menu_0328002410_1_1);
  mm_menu_0328002410_1.addMenuItem("Entregas&nbsp;Producci&oacute;n","location='pagina_entrega_de_productos.html'");
  mm_menu_0328002410_1.addMenuItem("Confirmaci&oacute;n&nbsp;de&nbsp;Pedidos","location='pagina_confirmar_pedido.html'");
  mm_menu_0328002410_1.addMenuItem("Especificar&nbsp;Producci&oacute;n","location='pagina_especificar_produccion.html'");
  mm_menu_0328002410_1.addMenuItem("Ingreso&nbsp;Productos");
   mm_menu_0328002410_1.hideOnMouseOut=true;
   mm_menu_0328002410_1.childMenuIcon="imágenes/arrows.gif";
   mm_menu_0328002410_1.menuBorder=1;
   mm_menu_0328002410_1.menuLiteBgColor='#666666';
   mm_menu_0328002410_1.menuBorderBgColor='#000000';
   mm_menu_0328002410_1.bgColor='#000000';
  window.mm_menu_0328002410_2 = new Menu("root",168,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#000000","#337b67","#337b67","left","middle",1,1,1000,-5,7,true,true,true,4,true,true);
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
  window.mm_menu_0328002410_3 = new Menu("root",114,12,"Verdana, Arial, Helvetica, sans-serif",10,"#ffffff","#000000","#337b67","#337b67","left","middle",1,1,1000,-5,7,true,true,true,4,true,true);
  mm_menu_0328002410_3.addMenuItem("Cambiar&nbsp;Usuario");
  mm_menu_0328002410_3.addMenuItem("Salida&nbsp;del&nbsp;Sistema");
   mm_menu_0328002410_3.hideOnMouseOut=true;
   mm_menu_0328002410_3.menuBorder=1;
   mm_menu_0328002410_3.menuLiteBgColor='#666666';
   mm_menu_0328002410_3.menuBorderBgColor='#000000';
   mm_menu_0328002410_3.bgColor='#000000';

  mm_menu_0328002410_3.writeMenus();
} // mmLoadMenus()