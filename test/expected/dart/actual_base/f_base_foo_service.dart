// Autogenerated by Frugal Compiler (2.0.0-RC3)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING

library actual_base_dart.src.f_basefoo_service;

import 'dart:async';

import 'dart:typed_data' show Uint8List;
import 'package:thrift/thrift.dart' as thrift;
import 'package:frugal/frugal.dart' as frugal;

import 'package:actual_base_dart/actual_base_dart.dart' as t_actual_base_dart;


abstract class FBaseFoo {

  Future basePing(frugal.FContext ctx);
}

class FBaseFooClient implements FBaseFoo {
  Map<String, frugal.FMethod> _methods;

  FBaseFooClient(frugal.FTransport transport, frugal.FProtocolFactory protocolFactory, [List<frugal.Middleware> middleware]) {
    _transport = transport;
    _protocolFactory = protocolFactory;
    this._methods = {};
    this._methods['basePing'] = new frugal.FMethod(this._basePing, 'BaseFoo', 'basePing', middleware);
  }

  frugal.FTransport _transport;
  frugal.FProtocolFactory _protocolFactory;

  Future basePing(frugal.FContext ctx) {
    return this._methods['basePing']([ctx]) as Future;
  }

  Future _basePing(frugal.FContext ctx) async {
    var controller = new StreamController();
    var closeSubscription = _transport.onClose.listen((_) {
      controller.addError(new thrift.TTransportError(
        thrift.TTransportErrorType.NOT_OPEN,
        "Transport closed before request completed."));
      });
    _transport.register(ctx, _recvBasePingHandler(ctx, controller));
    try {
      var memoryBuffer = new frugal.TMemoryOutputBuffer(_transport.requestSizeLimit);
      var oprot = _protocolFactory.getProtocol(memoryBuffer);
      oprot.writeRequestHeader(ctx);
      oprot.writeMessageBegin(new thrift.TMessage("basePing", thrift.TMessageType.CALL, 0));
      basePing_args args = new basePing_args();
      args.write(oprot);
      oprot.writeMessageEnd();
      await _transport.send(memoryBuffer.writeBytes);

      return await controller.stream.first.timeout(ctx.timeout, onTimeout: () {
        throw new frugal.FTimeoutError.withMessage("BaseFoo.basePing timed out after ${ctx.timeout}");
      });
    } finally {
      closeSubscription.cancel();
      _transport.unregister(ctx);
    }
  }

  frugal.FAsyncCallback _recvBasePingHandler(frugal.FContext ctx, StreamController controller) {
    basePingCallback(thrift.TTransport transport) {
      try {
        var iprot = _protocolFactory.getProtocol(transport);
        iprot.readResponseHeader(ctx);
        thrift.TMessage msg = iprot.readMessageBegin();
        if (msg.type == thrift.TMessageType.EXCEPTION) {
          thrift.TApplicationError error = thrift.TApplicationError.read(iprot);
          iprot.readMessageEnd();
          if (error.type == frugal.FApplicationError.RESPONSE_TOO_LARGE) {
            controller.addError(new frugal.FMessageSizeError.response(message: error.message));
            return;
          }
          if (error.type == frugal.FApplicationError.RATE_LIMIT_EXCEEDED) {
            controller.addError(new frugal.FRateLimitError(message: error.message));
            return;
          }
          throw error;
        }

        basePing_result result = new basePing_result();
        result.read(iprot);
        iprot.readMessageEnd();
        controller.add(null);
      } catch(e) {
        controller.addError(e);
        rethrow;
      }
    }
    return basePingCallback;
  }

}

class basePing_args implements thrift.TBase {
  static final thrift.TStruct _STRUCT_DESC = new thrift.TStruct("basePing_args");



  basePing_args() {
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch(fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch(fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(thrift.TProtocol iprot) {
    thrift.TField field;
    iprot.readStructBegin();
    while(true) {
      field = iprot.readFieldBegin();
      if(field.type == thrift.TType.STOP) {
        break;
      }
      switch(field.id) {
        default:
          thrift.TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    validate();
  }

  write(thrift.TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("basePing_args(");

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
class basePing_result implements thrift.TBase {
  static final thrift.TStruct _STRUCT_DESC = new thrift.TStruct("basePing_result");



  basePing_result() {
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch(fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch(fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(thrift.TProtocol iprot) {
    thrift.TField field;
    iprot.readStructBegin();
    while(true) {
      field = iprot.readFieldBegin();
      if(field.type == thrift.TType.STOP) {
        break;
      }
      switch(field.id) {
        default:
          thrift.TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    validate();
  }

  write(thrift.TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("basePing_result(");

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
