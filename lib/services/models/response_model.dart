
class ResponseModel{
  bool _isError;
  String _message;
  ResponseModel(
    this._isError, this._message
);
  String get message => _message;
  bool get isError => _isError;

}