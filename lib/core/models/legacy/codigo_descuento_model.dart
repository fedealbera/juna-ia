class CodigoDescuentoModel {
  late int dispo;
  late String dispoCod;
  late String dispoMsg;
  String? locdId;
  String? tipoDescuento;
  String? locdTipo;
  String? locdNombre;
  String? locdLoteCod;
  String? locdLoteCant;
  String? locdLoteDispo;
  String? locdFechaInicio;
  String? locdFechaFin;
  String? locdDescuentoPorc;
  String? locdEstado;
  String? tipoRedondeoId;
  String? fFin;

  CodigoDescuentoModel();

  CodigoDescuentoModel.fromJson(Map<String, dynamic> parsedJson) {
    dispo = parsedJson['dispo'] ?? 0;
    dispoCod = parsedJson['dispo_cod'] ?? '';
    dispoMsg = parsedJson['dispo_msg'] ?? '';
    locdId = parsedJson['locd_id'];
    tipoDescuento = parsedJson['tipo_descuento'];
    locdTipo = parsedJson['locd_tipo'];
    locdNombre = parsedJson['locd_nombre'];
    locdLoteCod = parsedJson['locd_lote_cod'];
    locdLoteCant = parsedJson['locd_lote_cant'];
    locdLoteDispo = parsedJson['locd_lote_dispo'];
    locdFechaInicio = parsedJson['locd_fecha_inicio'];
    locdFechaFin = parsedJson['locd_fecha_fin'];
    locdDescuentoPorc = parsedJson['locd_descuento_porc'];
    locdEstado = parsedJson['locd_estado'];
    tipoRedondeoId = parsedJson['tipo_redondeo_id'];
    fFin = parsedJson['ffin'];
  }

  Map<String, dynamic> toMap() => {
        "dispo": dispo,
        "dispo_cod": dispoCod,
        "dispo_msg": dispoMsg,
        "locd_id": locdId,
        "tipo_descuento": tipoDescuento,
        "locd_tipo": locdTipo,
        "locd_nombre": locdNombre,
        "locd_lote_cod": locdLoteCod,
        "locd_lote_cant": locdLoteCant,
        "locd_lote_dispo": locdLoteDispo,
        "remeraTalle": locdLoteDispo,
        "locd_fecha_inicio": locdFechaInicio,
        "locd_fecha_fin": locdFechaFin,
        "locd_descuento_porc": locdDescuentoPorc,
        "locd_estado": locdEstado,
        "tipo_redondeo_id": tipoRedondeoId,
        "ffin": fFin,
      };
}
