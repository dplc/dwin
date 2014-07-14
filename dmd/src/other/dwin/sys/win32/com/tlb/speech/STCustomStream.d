// STCustomStream 1.0 Type Library
// Version 1.0

//mixin(uuid("edaeecd8-0d75-499e-9b69-187acacf2c05"));
module dwin.sys.win32.com.tlb.speech.STCustomStream;
//module stcustomstreamlib;

/*[importlib("stdole2.tlb")]*/
private import dwin.sys.win32.com.Core;

// Interfaces

// IASRStream Interface
interface IASRStream : IDispatch {
  mixin(uuid("c78cda8e-dc97-4b4a-964e-2cedac7145a7"));
  //static DWINGUID IID = { 0xc78cda8e, 0xdc97, 0x4b4a, 0x96, 0x4e, 0x2c, 0xed, 0xac, 0x71, 0x45, 0xa7 };
  // method InitSRRenderStream
  /*[id(0x00000001)]*/ int InitSRRenderStream(IUnknown pRenderTerminal);
  // method PurgeStream
  /*[id(0x00000002)]*/ int PurgeStream();
  // method PurgeStream
  /*[id(0x00000003)]*/ int RestartStream();
}

// ITTSStream Interface
interface ITTSStream : IDispatch {
  mixin(uuid("006ff399-a14c-4767-9347-65a4388b7b14"));
  //static DWINGUID IID = { 0x006ff399, 0xa14c, 0x4767, 0x93, 0x47, 0x65, 0xa4, 0x38, 0x8b, 0x7b, 0x14 };
  // method InitTTSCaptureStream
  /*[id(0x00000001)]*/ int InitTTSCaptureStream(IUnknown pCaptureTerminal);
}

// CoClasses

// ASRStream Class
abstract class ASRStream {
  mixin(uuid("6cd93b97-482e-409b-b2eb-128231f0fea1"));
  //static DWINGUID CLSID = { 0x6cd93b97, 0x482e, 0x409b, 0xb2, 0xeb, 0x12, 0x82, 0x31, 0xf0, 0xfe, 0xa1 };
  mixin Interfaces!(IASRStream);
}

// TTSStream Class
abstract class TTSStream {
  mixin(uuid("b827d5cc-96fa-4a1e-9877-d54586d433f4"));
  //static DWINGUID CLSID = { 0xb827d5cc, 0x96fa, 0x4a1e, 0x98, 0x77, 0xd5, 0x45, 0x86, 0xd4, 0x33, 0xf4 };
  mixin Interfaces!(ITTSStream);
}
