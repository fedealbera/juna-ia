import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:churo_mobile/core/models/legacy/categoria_response_model.dart';
import 'package:churo_mobile/core/models/legacy/circuito_response_model.dart';
import 'package:churo_mobile/core/models/legacy/ciudad_response_model.dart';
import 'package:churo_mobile/core/models/legacy/codigo_descuento_model.dart';
import 'package:churo_mobile/core/models/legacy/contenido_response_model.dart';
import 'package:churo_mobile/core/models/legacy/corredor_response_model.dart';
import 'package:churo_mobile/core/models/legacy/documentation_response_model.dart';
import 'package:churo_mobile/core/models/legacy/pais_response_model.dart';
import 'package:churo_mobile/core/models/legacy/placa_model.dart';
import 'package:churo_mobile/core/models/legacy/provincia_response_model.dart';
import 'package:churo_mobile/core/models/legacy/setting_response_model.dart';
import 'package:churo_mobile/core/models/legacy/sos_posicion_model.dart';
import 'package:churo_mobile/core/models/legacy/talle_response_model.dart';
import 'package:churo_mobile/core/models/legacy/token_model.dart';
import 'dart:convert' as convert;

class JunaProvider {
  Future<ContenidoResponseModel> recuperarContenido(String idOrganizacion, String eventoId, String perfilId, String idUsuario, String dni) async {
    String url = 'https://sandbox.churo.com/api/' + "contenido/$idOrganizacion/$eventoId/$idUsuario/$dni/$perfilId";
    final response = await http.get(Uri.parse(url));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ContenidoResponseModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<CorredorResponseModel> recuperarInscripcion(String idOrganizacion, String eventoId, String roundId, String placa) async {
    String url = 'https://sandbox.churo.com/api/' + "corredor/$eventoId/$idOrganizacion/$roundId/$placa";
    final response = await http.get(Uri.parse(url));
    print("recuperarInscripcion: " + response.body.toString());
    if (response.statusCode == 200 && response.body.toString().trim().isNotEmpty) {
      // If the call to the server was successful, parse the JSON
      return CorredorResponseModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<CorredorResponseModel> registrarPlaca(String idOrganizacion, String eventoId, String dni, String nroPlaca, String token) async {
    String url = 'https://sandbox.churo.com/api/' + "placa";
    PlacaModel placaModel = new PlacaModel();
    placaModel.dni = dni;
    placaModel.nroPlaca = nroPlaca;
    placaModel.idEvento = eventoId;
    placaModel.idOrg = idOrganizacion;
    placaModel.token = token;

    var placaJson = convert.jsonEncode(placaModel.toMap());

    final response = await http.post(Uri.parse(url), body: placaJson, headers: {"Content-Type": "application/json"});
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return CorredorResponseModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<bool> informarPosicionSOS(SOSPosicionModel model) async {
    String url = 'https://sandbox.churo.com/api/' + "sos";

    var data = convert.jsonEncode(model.toMap());
    print("Request body:" + data);

    final response = await http.post(Uri.parse(url), body: data, headers: {"Content-Type": "application/json"});
    print(response.body.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<SettingResponseModel> recuperarSettingsMap(String idOrganizacion, String eventoId) async {
    String url = 'https://sandbox.churo.com/api/' + "settings/$idOrganizacion/$eventoId";
    final response = await http.get(Uri.parse(url));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return SettingResponseModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<bool> informarToken(TokenModel model) async {
    String url = 'https://sandbox.churo.com/api/' + "token";

    var data = convert.jsonEncode(model.toMap());
    print("Request body:" + data);

    final response = await http.post(Uri.parse(url), body: data, headers: {"Content-Type": "application/json"});
    print(response.body.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<DocumentationResponseModel> getMandatoryDocumentationsMap(String? idPar) async {
    String url = 'https://sandbox.churo.com/api/' + "archivos.php?parti_id=$idPar"; // "archivos.php/$idIscripcion";
    final response = await http.get(Uri.parse(url));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return DocumentationResponseModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<bool> uploadFile(String? idPar, String typeDocumentation, File fileUpload) async {
    Client client = Client();
    String url = 'https://sandbox.churo.com/api/' + "upload.php";
    Uri uriParse = Uri.parse(url);

    try {
      var request = MultipartRequest('POST', uriParse);
      String fileName = fileUpload.path.split('/').last;

      request.files.add(
        await MultipartFile.fromPath(
          'file',
          fileUpload.path,
          filename: fileName, // forzar nombre si hace falta
          contentType: MediaType('image', 'jpeg'),
        ),
      );

      request.fields['tipo'] = typeDocumentation;
      if (idPar != null) {
        request.fields['parti_id'] = idPar;
      }

      var streamedResponse = await client.send(request);
      var response = await Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<PaisResponseModel> getPaisesMap() async {
    String url = 'https://sandbox.churo.com/api/' + "paises";
    final response = await http.get(Uri.parse(url));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return PaisResponseModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<ProvinciaResponseModel> getProvinciasMap() async {
    String url = 'https://sandbox.churo.com/api/' + "provincias";
    final response = await http.get(Uri.parse(url));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ProvinciaResponseModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<CiudadResponseModel> getCiudadesMap(String? provinciaId) async {
    String url = 'https://sandbox.churo.com/api/' + "ciudades/${provinciaId}";
    // String url = 'https://sandbox.churo.com/api/' + "ciudades/1818";
    final response = await http.get(Uri.parse(url));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return CiudadResponseModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<bool> updateDatosContacto(
    String partId,
    String insId,
    String domPais,
    String domProvincia,
    String domCiudad,
    String domCiudadNombre,
    String contInstagram,
    String contCelular,
    String contEmail,
  ) async {
    String url = 'https://sandbox.churo.com/api/' + "upd_datos_contacto";

    final Map<String, dynamic> jsonBody = {
      "partiId": partId,
      "insId": insId,
      "domPais": domPais,
      "domProvincia": domProvincia,
      "domCiudad": domCiudad,
      "domCiudadNombre": domCiudadNombre,
      "contInstagram": contInstagram,
      "contCelular": contCelular,
      "contEmail": contEmail,
    };

    final response = await http.post(Uri.parse(url), body: jsonEncode(jsonBody), headers: {"Content-Type": "application/json"});
    print(response.body.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateCircuitoCategoria(String partId, String insId, String circuitoId, String categoriaId, String talleId) async {
    String url = 'https://sandbox.churo.com/api/' + "upd_insc_circuito";

    final Map<String, dynamic> jsonBody = {"partiId": partId, "insId": insId, "circuitoId": circuitoId, "categoriaId": categoriaId, "talleId": talleId};

    final response = await http.post(Uri.parse(url), body: jsonEncode(jsonBody), headers: {"Content-Type": "application/json"});
    print(response.body.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateDatosEmergencia(String partId, String insId, String contEmergenciaNombre, String contEmergenciaTel) async {
    String url = 'https://sandbox.churo.com/api/' + "upd_contacto_emergencia";

    final Map<String, dynamic> jsonBody = {"partiId": partId, "insId": insId, "contNombre": contEmergenciaNombre, "contTel": contEmergenciaTel};

    final response = await http.post(Uri.parse(url), body: jsonEncode(jsonBody), headers: {"Content-Type": "application/json"});
    print(response.body.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<CodigoDescuentoModel> validateCodigoDescuento(String dni, String codigo, String insId) async {
    final codigoParam = codigo.isEmpty ? "null" : codigo;

    String url = 'https://sandbox.churo.com/api/' + "validar_codigo_descuento/${dni}/${insId}/${codigoParam}";

    final response = await http.get(Uri.parse(url));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return CodigoDescuentoModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<CircuitoResponseModel> getCircuitosMap() async {
    String url = 'https://sandbox.churo.com/api/' + "circuitos";

    final response = await http.get(Uri.parse(url));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return CircuitoResponseModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<CategoriaResponseModel> getCategoriasMap(String circuitoId, String dni) async {
    String url = 'https://sandbox.churo.com/api/' + "categoria/${circuitoId}/${dni}";

    final response = await http.get(Uri.parse(url));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return CategoriaResponseModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<TalleResponseModel> getTallesMap() async {
    String url = 'https://sandbox.churo.com/api/' + "talles";

    final response = await http.get(Uri.parse(url));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return TalleResponseModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
