function validate(form) {
  var name = form.txtName.value;
  var lastName = form.txtLastName.value;
  var cedula = form.txtCedIdNum.value;
  var nameUser = form.txtUserName.value;
  var pass = form.txtPassword.value;
  var passRpt = form.txtPasswordRpt.value;
  var rol = form.txtRoleId.value;  
  var sala = form.txtNumSal.value;   
  var products = form.elements["txtProductoId[]"];
  var nameRegex = /[\d\w\s�����]+/i;
  var cedulaRegex = /^[0-9]+(([\.][0-9])?[0-9]*)*$/;
  
  if(name == "") {
    inlineMsg('txtName','Debe introducir el nombre del usuario.',2);
    return false;
  }
  if(!name.match(nameRegex)) {
    inlineMsg('name','Debe introducir un nombre valido.',2);
    return false;
  }
  if(lastName == "") {
    inlineMsg('txtLastName','Debe introducir el apellido del usuario.',2);
    return false;
  }
  if(!lastName.match(nameRegex)) {
    inlineMsg('email','Debe introducir un apellido de usuario valido.',2);
    return false;
  }
  if(cedula == "") {
    inlineMsg('txtCedIdNum','Debe introducir la c&eacute;dula del usuario.',2);
    return false;
  }
  if(!cedula.match(cedulaRegex)) {
    inlineMsg('txtCedIdNum','Debe introducir un n&uacute;mero de c&eacute;dula correcto.',2);
    return false;
  }
  if(nameUser == "") {
    inlineMsg('txtUserName','Debe introducir el nombre de usuario.', 2);
    return false;
  }
  if(pass == "") {
    inlineMsg('txtPassword','Debe introducir la contrase&ntilde;a del usuario.', 2);
    return false;
  }
  if(passRpt == "") {
    inlineMsg('txtPasswordRpt','Debe repetir la contrase&ntilde;a del usuario.', 2);
    return false;
  }
  if (pass.length < 6){
	  inlineMsg('txtPassword','Las contrase�a debe tener una longitud mayor o igual a 6 caracteres.', 2);
	  return false;
  }
  if(passRpt != pass) {
    inlineMsg('txtPasswordRpt','Las contrase�as deben coincidir', 2);
    return false;
  }
  if(rol == "-1") {
    inlineMsg('txtRoleId','Debe escoger el rol del usuario.', 2);
    return false;
  }
  if((sala == "0") && ((rol == "2") || (rol == "4") || (rol == "5") || (rol == "6"))) {
    inlineMsg('txtNumSal','Debe escoger la sala en la que se encuentra el usuario.');
    return false;
  }
  for (var x = 0; x < products.length; x ++) {
	if (products[x].checked) {
		return true;
	}
  }
  
  inlineMsg('txtProductoId','Debe seleccionar al menos un producto.', 2);
  return false;
}

function validateEditUser(form) {
  var name = form.txtName.value;
  var lastName = form.txtLastName.value;
  var cedula = form.txtCedIdNum.value;
  var nameUser = form.txtUserName.value;
  var rol = form.txtRoleId.value;  
  var sala = form.txtNumSal.value;   
  var products = form.elements["txtProductoId[]"];
  var nameRegex = /[\d\w\s�����]+/i;
  var cedulaRegex = /^[0-9]+(([\.][0-9])?[0-9]*)*$/;
  
  if(name == "") {
    inlineMsg('txtName','Debe introducir el nombre del usuario.',2);
    return false;
  }
  if(!name.match(nameRegex)) {
    inlineMsg('name','Debe introducir un nombre valido.',2);
    return false;
  }
  if(lastName == "") {
    inlineMsg('txtLastName','Debe introducir el apellido del usuario.',2);
    return false;
  }
  if(!lastName.match(nameRegex)) {
    inlineMsg('email','Debe introducir un apellido de usuario valido.',2);
    return false;
  }
  if(cedula == "") {
    inlineMsg('txtCedIdNum','Debe introducir la c&eacute;dula del usuario.',2);
    return false;
  }
  if(!cedula.match(cedulaRegex)) {
    inlineMsg('txtCedIdNum','Debe introducir un n&uacute;mero de c&eacute;dula correcto.',2);
    return false;
  }
  if(nameUser == "") {
    inlineMsg('txtUserName','Debe introducir el nombre de usuario.', 2);
    return false;
  }
   if(rol == "-1") {
    inlineMsg('txtRoleId','Debe escoger el rol del usuario.', 2);
    return false;
  }
  if((sala == "0") && ((rol == "2") || (rol == "4") || (rol == "5") || (rol == "6"))) {
    inlineMsg('txtNumSal','Debe escoger la sala en la que se encuentra el usuario.');
    return false;
  }
  for (var x = 0; x < products.length; x ++) {
	if (products[x].checked) {
		return true;
	}
  }
  
  inlineMsg('txtProductoId','Debe seleccinar al menos un producto.', 2);
  return false;
}


function validateLogin(form) {
  var name = form.txtName.value;
  var pass = form.txtPassword.value;
 
  
  if(name == "") {
    inlineMsg('txtName','Debe introducir su nombre de usuario.',2);
    return false;
  }
 
  if(pass == "") {
    inlineMsg('txtPassword','Debe introducir su contrase&ntilde;a.', 2);
    return false;
  }
  
  return true;
}


function validateInfo() {

	var emailElement = document.getElementById("txtNameLogin");
	var email = document.getElementById("txtNameLogin").value;
	var pass =  document.getElementById("txtPasswordLogin").value;
	var passElement = document.getElementById("txtPasswordLogin");
	var emailRegex = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
	
	var bool = true;
	if(email == "") {
		bool = false;
	}
	
	if(!email.match(emailRegex)) {
		emailElement.style.background = 'none no-repeat scroll 240px 8px #F2E0F7';
	    bool = false;
	}else{
		emailElement.style.background = 'url("/armaTuTorta/images/check.png") no-repeat scroll 240px 8px #F2E0F7';
	}
	if (pass.length < 5) {
		passElement.style.background = 'none no-repeat scroll 240px 8px #F2E0F7';
	    bool = false;
	}else{
		passElement.style.background = 'url("/armaTuTorta/images/check.png") no-repeat scroll 240px 8px #F2E0F7';
	}
	
	return bool;
}

function show(){
	var boton = document.getElementById("loginPage");
	if (validateInfo()){
		boton.style.backgroundColor = "#88c9c1";
		boton.disabled = false;
		boton.style.cursor="pointer";
		
    }
	else {
		boton.style.backgroundColor = "#BDBDBD";
		boton.disabled = true;
		boton.style.cursor="default";

	}
}

function validateCreateClient(form) {
	var select = form.txtTypeId;
	var position = select.options.selectedIndex;
	var typeId = select.options[position].value;
	var identityCard = form.txtIdCard.value;
	var firstName = form.txtFirstName.value;
	var lastName = form.txtLastName.value;
	var name = form.txtName.value;
	var email = form.txtEmail.value;
	var password = form.txtPassword.value;
	var passwordRpt = form.txtPasswordRpt.value;
	var phone = form.txtPhone.value;
	var otherPhone = form.txtOtherPhone.value;
	var address = form.txtAddress.value;
	var check = form.txtIsShipping;
	var isShipping = check.checked;
	var shippingAddress = form.txtShippingAddress.value;	
	var nameRegex = /[\d\w\s�����]+/i;
	var cedulaRegex = /^[0-9]+(([\.][0-9])?[0-9]*)*$/;
	var phoneRegex = /^\+?\d{1,3}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$/;
	var emailRegex = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/;
	
	if((typeId == "V-") || (typeId == "E-")){
		if(identityCard == "") {
		    inlineMsg('txtIdCard','Debe introducir el n�mero de c�dula del cliente.',2);
		    return false;
		}		
		
		if(!identityCard.match(cedulaRegex)) {
			inlineMsg('txtIdCard','Debe introducir un n&uacute;mero de c&eacute;dula correcto.',2);
		    return false;
		}

		if(firstName == "") {
		    inlineMsg('txtFirstName','Debe introducir el nombre del cliente.',2);
		    return false;
		}
		
		if(!firstName.match(nameRegex)) {
			inlineMsg('txtFirstName','Debe introducir un nombre v�lido.',2);
			return false;
		}

		if(lastName == "") {
		    inlineMsg('txtLastName','Debe introducir el apellido del cliente.',2);
		    return false;
		}
		
		if(!lastName.match(nameRegex)) {
			inlineMsg('txtLastName','Debe introducir un apellido v�lido.',2);
			return false;
		}
	} else {
		if(identityCard == "") {
		    inlineMsg('txtIdCard','Debe introducir el n�mero de RIF del cliente.',2);
		    return false;
		}		
		
		if(!identityCard.match(cedulaRegex)) {
			inlineMsg('txtIdCard','Debe introducir un n&uacute;mero de RIF correcto.',2);
		    return false;
		}		

		if(name == "") {
		    inlineMsg('txtName','Debe introducir el nombre del cliente.',2);
		    return false;
		}
	}
	
	if(email == "") {
	    inlineMsg('txtEmail','Debe introducir el correo electr�nico del cliente.',2);
	    return false;
	}
	
	if(!email.match(emailRegex)) {
		inlineMsg('txtEmail','Debe introducir un correo electr�nico v�lido.',2);
	    return false;
	}	
	
	if(password == "") {
	    inlineMsg('txtPassword','Debe introducir la contrase&ntilde;a del cliente.',2);
	    return false;
	}
	
	if(passwordRpt == "") {
	    inlineMsg('txtPasswordRpt','Debe repetir la contrase&ntilde;a del cliente.',2);
	    return false;
	}
	
	if (password.length < 6){
		inlineMsg('txtPassword','Las contrase�a debe tener una longitud mayor o igual a 6 caracteres.', 2);
		return false;
	}
	
	if(passwordRpt != password) {
		inlineMsg('txtPasswordRpt','Las contrase�as deben coincidir.', 2);
	    return false;
	}
	
	if(phone == "") {
	    inlineMsg('txtPhone','Debe introducir el n�mero telef�nico del cliente.',2);
	    return false;
	}
	
	if(!phone.match(phoneRegex)) {
		inlineMsg('txtPhone','Debe introducir un n&uacute;mero telef�nico v�lido.',2);
	    return false;
	}	
	
	if(otherPhone != ""){
		if(!otherPhone.match(phoneRegex)) {
			inlineMsg('txtOtherPhone','Debe introducir un n&uacute;mero telef�nico v�lido.',2);
		    return false;
		}
	}
	
	if(address == "") {
	    inlineMsg('txtAddress','Debe introducir la direcci�n del cliente.',2);
	    return false;
	}
	
	if(!isShipping){
		if(shippingAddress == "") {
		    inlineMsg('txtShippingAddress','Debe introducir la direcci�n de env�o del cliente.',2);
		    return false;
		}
	}
}

function validateCreateProduct(form) {
	  var name = form.txtNameProduct.value;
	  var price = form.txtPrice.value;
	  //var priceRegex = /^[0-9]+(\.[0-9]+)?$/;
	  var priceRegex = /^\d+(\.\d{1,2})?$/;
	  var scriptStep2 = form.txtScriptStep2.value;
	  var scriptStep3 = form.txtScriptStep3.value;
	  
	  if(name == "") {
	    inlineMsg('txtNameProduct','Debe introducir el nombre del producto.',2);
	    return false;
	  }
	 
	  if(price == "") {
	    inlineMsg('txtPrice','Debe introducir el precio del producto.', 2);
	    return false;
	  }
	  
	  if(!price.match(priceRegex)) {
		inlineMsg('txtPrice','Debe introducir un precio v�lido. Utilice s�lo n�meros y el punto (.) s�lo para separar decimales.',5);
		return false;
	  }
	  
	  if(scriptStep2 == "") {
	    inlineMsg('txtScriptStep2','Debe completar el paso 2 del script de verificaci�n de ventas.', 3);
	    return false;
	  }
	  
	  if(scriptStep3 == "") {
	    inlineMsg('txtScriptStep3','Debe completar el paso 3 del script de verificaci�n de ventas.', 3);
	    return false;
	  }
	  
	  return true;
}

function validateJustification(form) {
	var justif = form.otherJustif.value;
	if (justif == ""){
		inlineMsg('otherJustif', 'Debe introducir la raz�n por la cual se realiza la devoluci�n.',2);
		return false;
	}
   return true;
}

function validateJust(form) {
	var justifi = form.txtJustifEdit.value;
	if (justifi == ""){
		inlineMsg('txtJustifEdit', 'Debe introducir la raz�n por la cual se realiza la modificaci�n de los datos.',3);
		return false;
	}
   return true;
}

function validatePassword(form) {
	var oldPass = form.txtOldPassword.value;
	var pass = form.txtPassword.value;
	var passRpt = form.txtPasswordRpt.value;
	
	if(oldPass == "") {
	    inlineMsg('txtOldPassword','Debe introducir la contrase&ntilde;a anterior del usuario.', 2);
	    return false;
	}
	
	if(pass == "") {
	    inlineMsg('txtPassword','Debe introducir la contrase&ntilde;a del usuario.', 2);
	    return false;
	}
	if(passRpt == "") {
	    inlineMsg('txtPasswordRpt','Debe repetir la contrase&ntilde;a del usuario.', 2);
	    return false;
	}
	if (pass.length < 6){
	  inlineMsg('txtPassword','Las contrase�a debe tener una longitud mayor o igual a 6 caracteres.', 2);
	  return false;
	}
	if(passRpt != pass) {
	  inlineMsg('txtPasswordRpt','Las contrase�as deben coincidir', 2);
	  return false;
	}
   return true;
}


function validateCed(form) {
	var cedula = form.txtCedIdNum.value;
	if(cedula == "") {
	    inlineMsg('txtCedIdNum','Debe introducir el n�mero de c�dula del cliente.',2);
	    return false;
	}
   return true;
}

function validateCreditCard(form) {
	var bank = form.txtBankEdit.value;
	if(bank == "") {
	    inlineMsg('txtBankEdit','Debe introducir el nombre del banco al que pertenece la tarjeta de cr�dito del cliente.',2);
	    return false;
	}
   return true;
}



function validatePayment(form) {
	  var cardType = form.txtCardType.value;
	  var numCard = form.numCard.value;
	  var bank = form.txtBank.value;
	  var ced = form.txtCedNumClient.value;
	  var voucher = form.txtVoucher.value;
		  
	  if(cardType == "") {
	    inlineMsg('txtCardType','Debe introducir el tipo de tarjeta del cliente.',2);
	    return false;
	  }
	   if(numCard == "") {
	    inlineMsg('numCard','Debe introducir el n�mero de tarjeta del cliente.',2);
	    return false;
	  }
	   if(bank == "") {
	    inlineMsg('txtBank','Debe introducir el banco al que pertenece la tarjeta del cliente.',2);
	    return false;
	  }
	   if(ced == "") {
	    inlineMsg('txtCedNumClient','Debe introducir la c�dula del cliente.',2);
	    return false;
	  }
	   
	  if(voucher == "") {
	    inlineMsg('txtVoucher','Debe introducir el n�mero de voucher.',2);
	    return false;
	  }
	 
	  return true;
}


function validateClient(form) {
	  var name = form.txtName.value;
	  var lastName = form.txtLastName.value;
	  var cedula = form.txtCedIdNum.value;
	  var birthdate = form.txtDateIni.value;
	  var state = form.txtState.value;
	  var city = form.txtCity.value;
	  
	  if(name == "") {
	    inlineMsg('txtName','Debe introducir el nombre del cliente.',2);
	    return false;
	  }
	   if(lastName == "") {
	    inlineMsg('txtLastName','Debe introducir el apellido del cliente.',2);
	    return false;
	  }
	   if(cedula == "") {
	    inlineMsg('txtCedIdNum','Debe introducir el n�mero de c�dula del cliente.',2);
	    return false;
	  }
	   if(birthdate == "") {
	    inlineMsg('txtDateIni','Debe introducir la fecha de nacimiento del cliente.',2);
	    return false;
	  }
	   
	  
	  if(state == "") {
		    inlineMsg('txtState','Debe introducir el estado donde vive el cliente.',2);
		    return false;
	  }
	  
	  if(city == "") {
		    inlineMsg('txtCity','Debe introducir la ciudad donde vive el cliente.',2);
		    return false;
	  }

}

function validateCreateAlbum(form) {
	  var name = form.txtName.value;
	  var image = form.txtImage.value;
	  
	  if(name == "") {
	    inlineMsg('txtName','Debe introducir el nombre del �lbum.',2);
	    return false;
	  }
	 
	  if(image == "") {
	    inlineMsg('txtImage','Debe subir una imagen para el �lbum.', 2);
	    return false;
	  }
	  
	  return true;
}

function validateEditAlbum(form) {
	  var name = form.txtName.value;
	  
	  if(name == "") {
	    inlineMsg('txtName','Debe introducir el nombre del �lbum.',2);
	    return false;
	  }
	  return true;
}

function validateCreateStep(form) {
	  var position = form.txtPosition.value;
	  var name = form.txtName.value;
	 
	  if(position == "") {
	    inlineMsg('txtPosition','Debe introducir el n�mero del paso.', 2);
	    return false;
	  }
	  
	  if(name == "") {
	    inlineMsg('txtName','Debe introducir el nombre del paso.',2);
	    return false;
	  }
	  
	  return true;
}

function validateEditStep(form) {
	  var position = form.txtPosition.value;
	  var name = form.txtName.value;
	 
	  if(position == "") {
	    inlineMsg('txtPosition','Debe introducir el n�mero del paso.', 2);
	    return false;
	  }
	  
	  if(name == "") {
	    inlineMsg('txtName','Debe introducir el nombre del paso.',2);
	    return false;
	  }
	  
	  return true;
}

function validateCreateOption(form) {
	  var position = form.txtPosition.value;
	  var name = form.txtName.value;
	  var price = form.txtPrice.value;
	 
	  if(position == "") {
	    inlineMsg('txtPosition','Debe introducir la posici�n de la opci�n.', 2);
	    return false;
	  }
	  
	  if(name == "") {
	    inlineMsg('txtName','Debe introducir el nombre de la opci�n.',2);
	    return false;
	  }
	  
	  if(price == "") {
	    inlineMsg('txtPrice','Debe introducir el precio de la opci�n.',2);
	    return false;
	  }
	  
	  return true;
}

function validateEditOption(form) {
	  var position = form.txtPosition.value;
	  var name = form.txtName.value;
	  var price = form.txtPrice.value;
	 
	  if(position == "") {
	    inlineMsg('txtPosition','Debe introducir la posici�n de la opci�n.', 2);
	    return false;
	  }
	  
	  if(name == "") {
	    inlineMsg('txtName','Debe introducir el nombre de la opci�n.',2);
	    return false;
	  }
	  
	  if(price == "") {
	    inlineMsg('txtPrice','Debe introducir el precio de la opci�n.',2);
	    return false;
	  }
	  
	  return true;
}

function validateBenef(form) {
	  var name = form.txtName.value;
	  var lastName = form.txtLastName.value;
	  var cedula = form.txtCedIdNum.value;
	  var birthdate = form.txtDateIni.value;
	  var sex = form.txtGen.value;
	  
	  if(name == "") {
	    inlineMsg('txtName','Debe introducir el nombre del cliente.',2);
	    return false;
	  }
	   if(lastName == "") {
	    inlineMsg('txtLastName','Debe introducir el apellido del cliente.',2);
	    return false;
	  }
	   if(cedula == "") {
	    inlineMsg('txtCedIdNum','Debe introducir el n�mero de c�dula del cliente.',2);
	    return false;
	  }
	   if(birthdate == "") {
	    inlineMsg('txtDateIni','Debe introducir la fecha de nacimiento del cliente.',2);
	    return false;
	  }
	  if(sex == "-") {
		    inlineMsg('txtGen','Debe escoger el sexo del cliente.', 2);
		    return false;
	  }
	   
	  return true;
}



function validateAddress(form) {
	  var state = form.txtState.value;
	  var city = form.txtCity.value;
	  var municipality = form.txtMunicipality.value;
	  
	  if(state == "") {
		    inlineMsg('txtState','Debe introducir el estado donde vive el cliente .',2);
		    return false;
	  }
	  
	  if(city == "") {
		    inlineMsg('txtCity','Debe introducir la ciudad donde vive el cliente .',2);
		    return false;
	  }
	  
	  if(municipality == "") {
		    inlineMsg('txtMunicipality','Debe introducir el municipio donde vive el cliente .',2);
		    return false;
	  }
	 
	  return true;
}

// START OF MESSAGE SCRIPT //
function validateCreatePhoto(form) {
	  var name = form.txtName.value;
	  var image = form.txtImage.value;
	  
	  if(name == "") {
	    inlineMsg('txtName','Debe introducir el nombre de la foto.',2);
	    return false;
	  }
	 
	  if(image == "") {
	    inlineMsg('txtImage','Debe subir una imagen para la foto.', 2);
	    return false;
	  }
	  
	  return true;
}

function validateEditPhoto(form) {
	  var name = form.txtName.value;
	  
	  if(name == "") {
	    inlineMsg('txtName','Debe introducir el nombre de la foto.',2);
	    return false;
	  }
	  
	  return true;
}

var MSGTIMER = 20;
var MSGSPEED = 5;
var MSGOFFSET = 3;
var MSGHIDE = 3;

//build out the divs, set attributes and call the fade function //
function inlineMsg(target,string,autohide) {
  var msg;
  var msgcontent;
  if(!document.getElementById('msg')) {
    msg = document.createElement('div');
    msg.id = 'msg';
    msgcontent = document.createElement('div');
    msgcontent.id = 'msgcontent';
    document.body.appendChild(msg);
    msg.appendChild(msgcontent);
    msg.style.filter = 'alpha(opacity=0)';
    msg.style.opacity = 0;
    msg.alpha = 0;
  } else {
    msg = document.getElementById('msg');
    msgcontent = document.getElementById('msgcontent');
  }
  msgcontent.innerHTML = string;
  msg.style.display = 'block';
  var msgheight = msg.offsetHeight;
  var targetdiv = document.getElementById(target);
  targetdiv.focus();
  var targetheight = targetdiv.offsetHeight;
  var targetwidth = targetdiv.offsetWidth;
  var topposition = topPosition(targetdiv) - ((msgheight - targetheight) / 2);
  var leftposition = leftPosition(targetdiv) + targetwidth + MSGOFFSET;
  msg.style.top = topposition + 'px';
  msg.style.left = leftposition + 'px';
  clearInterval(msg.timer);
  msg.timer = setInterval("fadeMsg(1)", MSGTIMER);
  if(!autohide) {
    autohide = MSGHIDE;  
  }
  window.setTimeout("hideMsg()", (autohide * 1000));
}


//hide the form alert //
function hideMsg(msg) {
  var msg = document.getElementById('msg');
  if(!msg.timer) {
    msg.timer = setInterval("fadeMsg(0)", MSGTIMER);
  };
}

//face the message box //
function fadeMsg(flag) {
  if(flag == null) {
    flag = 1;
  }
  var msg = document.getElementById('msg');
  var value;
  if(flag == 1) {
    value = msg.alpha + MSGSPEED;
  } else {
    value = msg.alpha - MSGSPEED;
  }
  msg.alpha = value;
  msg.style.opacity = (value / 100);
  msg.style.filter = 'alpha(opacity=' + value + ')';
  if(value >= 99) {
    clearInterval(msg.timer);
    msg.timer = null;
  } else if(value <= 1) {
    msg.style.display = "none";
    clearInterval(msg.timer);
  };
}

// calculate the position of the element in relation to the left of the browser //
function leftPosition(target) {
  var left = 0;
  if(target.offsetParent) {
    while(1) {
      left += target.offsetLeft;
      if(!target.offsetParent) {
        break;
      }
      target = target.offsetParent;
    };
  } else if(target.x) {
    left += target.x;
  }
  return left;
}

// calculate the position of the element in relation to the top of the browser window //
function topPosition(target) {
  var top = 0;
  if(target.offsetParent) {
    while(1) {
      top += target.offsetTop;
      if(!target.offsetParent) {
        break;
      }
      target = target.offsetParent;
    };
  } else if(target.y) {
    top += target.y;
  }
  return top;
}

// preload the arrow //
if(document.images) {
  arrow = new Image(7,80); 
  arrow.src = "./msg_arrow.gif"; 
}
	
function Siguiente(){
	if (validateReg() == true){
		$(".block1").hide();
		$("#infPers").attr('class', 'separator');
		$(".block2").show();
		$("#infEnv").attr('class', 'separator-current');
	}
	
}

function SiguienteAux(){
	if (validateRegAux() == true){
		$(".block1").hide();
		$("#infPers").attr('class', 'separator');
		$(".block2").show();
		$("#infEnv").attr('class', 'separator-current');
	}
	
}

function Back(){
	$(".block1").show();
	$("#infPers").attr('class', 'separator-current');
	$(".block2").hide();
	$("#infEnv").attr('class', 'separator');
	
}

function validateEmail(element){
	var emailRegex = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
	if (element.value != ""){
		if (element.value.match(emailRegex)){
			element.style.background = 'url("/armaTuTorta/images/check.png") no-repeat scroll 220px 5px #FFFFFF';
			$('#errorEmail').hide();
			return true;
		}
		else{
			element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
			$('#errorEmail').show();
			return false;
		}
	}else{
			element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
			$('#errorEmail').show();
			return false;
	};
}

function validateName(element, i){
	if (element.value != ""){
		element.style.background = 'url("/armaTuTorta/images/check.png") no-repeat scroll 220px 5px #FFFFFF';
		if (i == 1){
			$('#errorName').hide();
			return true;
		}
		else if (i == 2){
			$('#errorLastName').hide();
			return true;
		}
	}else{
		element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
		if (i == 1){
			$('#errorName').show();
			return false;
		}
		else if (i == 2){
			$('#errorLastName').show();
			return false;
		}
	}
}



function validateCedIdnt(element){
	var cedRegex = /^[0-9]+(([\.][0-9])?[0-9]*)*$/;
	if (element.value != ""){
		if (element.value.match(cedRegex)){
			element.style.background = 'url("/armaTuTorta/images/check.png") no-repeat scroll 220px 5px #FFFFFF';
			$('#errorCed').hide();
			return true;
		}
		else{
			element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
			$('#errorCed').show();
			return false;
		};
	}else{
			element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
			$('#errorCed').show();
			return false;
	};
	
}

function validatePass(element){
	if (element.value != ""){
		if (element.value.length >= 6){
			element.style.background = 'url("/armaTuTorta/images/check.png") no-repeat scroll 220px 5px #FFFFFF';
			$('#errorPass').hide();
			return true;
		}
		else{
			element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
			$('#errorPass').show();
			return false;
		}
	}else{
			element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
			$('#errorPass').show();
			return false;
	}
	
}

function validateRptPass(element){
	var pass = document.getElementById("txtPass").value;

	if (element.value != ""){
		if (element.value.length >= 6){
			if (element.value != pass){
				element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
				$('#errorRptPass').show();
				return false;
			
			}
			else{
				element.style.background = 'url("/armaTuTorta/images/check.png") no-repeat scroll 220px 5px #FFFFFF';
				$('#errorRptPass').hide();
				return true;
			};
		}
		else{
			element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
			$('#errorRptPass').show();
			return false;
		}
	}else{
			element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
			$('#errorRptPass').show();
			return false;
	};
	
}

function validateReg(){
	var empresa = $("input:radio[name=typePers]:checked").val();
	var name = document.getElementById("txtName");
	var lastName = document.getElementById("txtLastName");
	var cedula = document.getElementById("txtCed");
	var email = document.getElementById("txtEmail");
	var pass = document.getElementById("txtPass");
	var passRpt = document.getElementById("txtRptPass");
	
	var bool = true;
	
	if (empresa == null)
		bool = false;	

	if (validateName(name, '1') != true)
		bool = false;

	if (validateName(lastName, '2') != true)
		bool = false;

	if (validateCedIdnt(cedula) != true)
		bool = false;
	
	if (validateEmail(email) != true)
		bool = false;

	if (validatePass(pass)!= true)
		bool = false;
	
	if (validateRptPass(passRpt)!= true)
		bool = false;
	
	return bool;
}


function validateRegAux(){
	var name = document.getElementById("txtName");
	var lastName = document.getElementById("txtLastName");
	var cedula = document.getElementById("txtCed");
	var email = document.getElementById("txtEmail");
	
	var bool = true;

	if (validateName(name, '1') != true)
		bool = false;

	if (validateName(lastName, '2') != true)
		bool = false;

	if (validateCedIdnt(cedula) != true)
		bool = false;
	
	if (validateEmail(email) != true)
		bool = false;

	return bool;
}


function agregarOtro(){
	$('.otherPhone').show();
	$('.imgPlus').hide();

}

function validatePhone(element, i){
	var phoneRegex = /^[0-9]+(([-][0-9])?[0-9]*)*$/;
	if (element.value != ""){
		if (element.value.length >= 11){
			if (element.value.match(phoneRegex)){
				element.style.background = 'url("/armaTuTorta/images/check.png") no-repeat scroll 220px 5px #FFFFFF';
				if (i == 1)
					$('#errorPhone').hide();
				else
					$('#errorMovPhone').hide();
			
				return true;
			}else{
				element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
				if (i == 1)
					$('#errorPhone').show();
				else
					$('#errorMovPhone').show();
				return false;
			};
		}
		else{
			element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
			if (i == 1)
				$('#errorPhone').show();
			else
				$('#errorMovPhone').show();
			return false;
		};
	}else{
			element.style.background = 'none no-repeat scroll 220px 5px #FFFFFF';
			if (i == 1)
				$('#errorPhone').show();
			else
				$('#errorMovPhone').show();
			return false;
	};
}

$('#checkDir').click(function() {
	if ($(this).is(':checked')) {
		$('.otherDir').hide();
    }else{
		$('.otherDir').show();
    
	}
	
});


function validateDir(element, i){
	if (element.value != ""){
		if (i == 1){
			$('#errorDir').hide();
		}
		else{
			$('#errorDirEnv').hide();
		}
		return true;
	}
	else{
		if (i == 1)
			$('#errorDir').show();
		else
			$('#errorDirEnv').show();
		return false;
	}
}


function validateRegCont(){
	var phone = document.getElementById("txtPhone");
	var phoneMov = document.getElementById("txtMovPhone");
	var dir = document.getElementById("dir");
	var dirEnv = document.getElementById("dirEnv");
	var styleDir = $('.otherPhone').css('display');
	
	var bool = true;
	
	if (validatePhone(phone, '1') != true)
		bool = false;
		
	if (styleDir != 'none'){
		alert('no deberia');
	
		if (validatePhone(phoneMov, '2') != true)
			bool = false;
	}

	if (validateDir(dir, '1') != true)
		bool = false;
	
	
	if (!$('#checkDir').is(':checked')) {
		if (validateDir(dirEnv, '2') != true)
			bool = false;
	}
	
	return bool;
}


