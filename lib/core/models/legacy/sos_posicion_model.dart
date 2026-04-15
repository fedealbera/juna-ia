class SOSPosicionModel {
  String? org_id;
  String? evento_id;
  String? parti_id;
  String? ins_id;
  String? latitud;
  String? longitud;

  SOSPosicionModel();

  Map<String, dynamic> toMap() => {
        "org_id": org_id,
        "evento_id": evento_id,
        "parti_id": parti_id,
        "ins_id": ins_id,
        "latitud": latitud,
        "longitud": longitud,
      };
}
