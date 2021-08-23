part of fdl_api;

class _RestEndpoints {
  _RestEndpoints(String baseUrl) : _clinet = _RestClient(baseUrl);

  final _RestClient _clinet;

  Future<ServerStats> getMainServerStats() async {
    final res = await _clinet.get('/stats/main');
    return ServerStats._new(res.body);
  }

  Future<PaymentResponse> pay(PaymentBuilder paymentQuery) async {
    final res = await _clinet.get(
      '/stats/main',
      parameters: paymentQuery.build(),
    );
    return PaymentResponse._new(res.body, hasError: res.statusCode != 200);
  }
}
