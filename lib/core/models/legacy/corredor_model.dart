class CorredorModel {
  late String id;
  late String idInscripcion;
  late String dni;
  late String nombre;
  late String nroPlaca;
  late String apellido;
  late String circuitoId;
  late String circuitoNombre;
  late bool remera_regalo;
  late bool remera_paga;
  late bool remera_paga_estado;
  late String estado;
  late String linkPago;
  late String remeraTalleId;
  String? remeraTalle;
  late bool vip;
  late List<dynamic> articulos;
  late String largada;
  late String agrupamiento;
  late String idCategoria;
  late String nombreCategoria;
  late bool regalo1;
  late String edicion;
  late String contDomPaisId;
  late String contDomPaisNombre;
  late String contDomProvinciaId;
  late String contDomProvinciaNombre;
  late String contDomCiudadId;
  late String contDomCiudadNombre;
  late String contCelular;
  late String contInstagram;
  late String contEmail;
  late String contEmergenciaNombre;
  late String contEmergenciaTel;
  late String codigoDescuento;

  CorredorModel();

  CorredorModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    idInscripcion = parsedJson['idInscripcion'];
    dni = parsedJson['dni'];
    nombre = parsedJson['nombre'];
    apellido = parsedJson['apellido'];
    nroPlaca = parsedJson['nroPlaca'];
    circuitoId = parsedJson['idCircuito'];
    circuitoNombre = parsedJson['idCircuitoNombre'];
    remera_regalo = parsedJson['remera_regalo'];
    remera_paga = parsedJson['remera_paga'];
    remera_paga_estado = parsedJson['remera_paga_estado'];
    remeraTalleId = parsedJson['partTalleId'];
    remeraTalle = parsedJson['remeraTalle'];
    vip = false;
    //(parsedJson['vip'] as String).isEmpty ? false : parsedJson['vip'];
    articulos = parsedJson['articulos'];
    largada = parsedJson['largada'];
    agrupamiento = parsedJson['agrupamiento'];
    idCategoria = parsedJson['idCategoria'];
    nombreCategoria = parsedJson['categoriaNombre'];
    regalo1 = parsedJson['regalo1'];
    estado = parsedJson.containsKey('estado') ? parsedJson['estado'] : '';
    linkPago = parsedJson.containsKey('linkPago') ? parsedJson['linkPago'] : '';
    edicion = parsedJson.containsKey('edicion') ? parsedJson['edicion'] : '';
    contEmergenciaNombre = parsedJson['contNombre'];
    contEmergenciaTel = parsedJson['contTel'];
    contDomPaisId = parsedJson['domPais'];
    contDomPaisNombre = parsedJson['domPaisNombre'];
    contDomProvinciaId = parsedJson['domProvincia'];
    contDomProvinciaNombre = parsedJson['domProvinciaNombre'];
    contDomCiudadId = parsedJson['domCiudad'];
    contDomCiudadNombre = parsedJson['domCiudadNombre'] ?? '';
    contCelular = parsedJson['contCelular'];
    contInstagram = parsedJson['contInstagram'];
    contEmail = parsedJson['contEmail'];
    codigoDescuento = parsedJson['insCodDesc'];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "idInscripcion": idInscripcion,
        "dni": dni,
        "nombre": nombre,
        "nroPlaca": nroPlaca,
        "apellido": apellido,
        "idCircuito": circuitoId,
        "idCircuitoNombre": circuitoNombre,
        "remera_paga": remera_paga,
        "remera_paga_estado": remera_paga_estado,
        "remera_regalo": remera_regalo,
        "partTalleId": remeraTalleId,
        "remeraTalle": remeraTalle,
        "articulos": articulos,
        "vip": vip,
        "largada": largada,
        "agrupamiento": agrupamiento,
        "idCategoria": idCategoria,
        "categoriaNombre": nombreCategoria,
        "regalo1": regalo1,
        "estado": estado,
        "linkPago": linkPago,
        "edicion": edicion,
        "domPais": contDomPaisId,
        "domPaisNombre": contDomPaisNombre,
        "domProvincia": contDomProvinciaId,
        "domProvinciaNombre": contDomProvinciaNombre,
        "domCiudad": contDomCiudadId,
        "domCiudadNombre": contDomCiudadNombre,
        "contInstagram": contInstagram,
        "contCelular": contCelular,
        "contEmail": contEmail,
        "contNombre": contEmergenciaNombre,
        "contTel": contEmergenciaTel,
        "insCodDesc": codigoDescuento,
      };
}
