// simpleaudio 1.0 Type Library
// Version 1.0

//mixin(uuid("17709aa0-2512-4ffe-bb24-1f6c535debca"));
module dwin.sys.win32.com.tlb.speech.simpleaudiolib;

/*[importlib("stdole2.tlb")]*/
private import dwin.sys.win32.com.Core;

// Enums

enum SpeechAudioFormatType {
  SAFTDefault = 0xFFFFFFFF,
  SAFTNoAssignedFormat = 0x00000000,
  SAFTText = 0x00000001,
  SAFTNonStandardFormat = 0x00000002,
  SAFTExtendedAudioFormat = 0x00000003,
  SAFT8kHz8BitMono = 0x00000004,
  SAFT8kHz8BitStereo = 0x00000005,
  SAFT8kHz16BitMono = 0x00000006,
  SAFT8kHz16BitStereo = 0x00000007,
  SAFT11kHz8BitMono = 0x00000008,
  SAFT11kHz8BitStereo = 0x00000009,
  SAFT11kHz16BitMono = 0x0000000A,
  SAFT11kHz16BitStereo = 0x0000000B,
  SAFT12kHz8BitMono = 0x0000000C,
  SAFT12kHz8BitStereo = 0x0000000D,
  SAFT12kHz16BitMono = 0x0000000E,
  SAFT12kHz16BitStereo = 0x0000000F,
  SAFT16kHz8BitMono = 0x00000010,
  SAFT16kHz8BitStereo = 0x00000011,
  SAFT16kHz16BitMono = 0x00000012,
  SAFT16kHz16BitStereo = 0x00000013,
  SAFT22kHz8BitMono = 0x00000014,
  SAFT22kHz8BitStereo = 0x00000015,
  SAFT22kHz16BitMono = 0x00000016,
  SAFT22kHz16BitStereo = 0x00000017,
  SAFT24kHz8BitMono = 0x00000018,
  SAFT24kHz8BitStereo = 0x00000019,
  SAFT24kHz16BitMono = 0x0000001A,
  SAFT24kHz16BitStereo = 0x0000001B,
  SAFT32kHz8BitMono = 0x0000001C,
  SAFT32kHz8BitStereo = 0x0000001D,
  SAFT32kHz16BitMono = 0x0000001E,
  SAFT32kHz16BitStereo = 0x0000001F,
  SAFT44kHz8BitMono = 0x00000020,
  SAFT44kHz8BitStereo = 0x00000021,
  SAFT44kHz16BitMono = 0x00000022,
  SAFT44kHz16BitStereo = 0x00000023,
  SAFT48kHz8BitMono = 0x00000024,
  SAFT48kHz8BitStereo = 0x00000025,
  SAFT48kHz16BitMono = 0x00000026,
  SAFT48kHz16BitStereo = 0x00000027,
  SAFTTrueSpeech_8kHz1BitMono = 0x00000028,
  SAFTCCITT_ALaw_8kHzMono = 0x00000029,
  SAFTCCITT_ALaw_8kHzStereo = 0x0000002A,
  SAFTCCITT_ALaw_11kHzMono = 0x0000002B,
  SAFTCCITT_ALaw_11kHzStereo = 0x0000002C,
  SAFTCCITT_ALaw_22kHzMono = 0x0000002D,
  SAFTCCITT_ALaw_22kHzStereo = 0x0000002E,
  SAFTCCITT_ALaw_44kHzMono = 0x0000002F,
  SAFTCCITT_ALaw_44kHzStereo = 0x00000030,
  SAFTCCITT_uLaw_8kHzMono = 0x00000031,
  SAFTCCITT_uLaw_8kHzStereo = 0x00000032,
  SAFTCCITT_uLaw_11kHzMono = 0x00000033,
  SAFTCCITT_uLaw_11kHzStereo = 0x00000034,
  SAFTCCITT_uLaw_22kHzMono = 0x00000035,
  SAFTCCITT_uLaw_22kHzStereo = 0x00000036,
  SAFTCCITT_uLaw_44kHzMono = 0x00000037,
  SAFTCCITT_uLaw_44kHzStereo = 0x00000038,
  SAFTADPCM_8kHzMono = 0x00000039,
  SAFTADPCM_8kHzStereo = 0x0000003A,
  SAFTADPCM_11kHzMono = 0x0000003B,
  SAFTADPCM_11kHzStereo = 0x0000003C,
  SAFTADPCM_22kHzMono = 0x0000003D,
  SAFTADPCM_22kHzStereo = 0x0000003E,
  SAFTADPCM_44kHzMono = 0x0000003F,
  SAFTADPCM_44kHzStereo = 0x00000040,
  SAFTGSM610_8kHzMono = 0x00000041,
  SAFTGSM610_11kHzMono = 0x00000042,
  SAFTGSM610_22kHzMono = 0x00000043,
  SAFTGSM610_44kHzMono = 0x00000044,
}

// Interfaces

// ISpAudioPlug Interface
interface ISpAudioPlug : IDispatch {
  mixin(uuid("1ce52e86-6b75-4749-bbac-3d23626da468"));
  //static DWINGUID IID = { 0x1ce52e86, 0x6b75, 0x4749, 0xbb, 0xac, 0x3d, 0x23, 0x62, 0x6d, 0xa4, 0x68 };
  // Init
  /*[id(0x000003E8)]*/ int Init(short fWrite, SpeechAudioFormatType FormatType);
  // SetData
  /*[id(0x000003E9)]*/ int SetData(DWINVARIANT vData, out int pWritten);
  // GetData
  /*[id(0x000003EA)]*/ int GetData(out DWINVARIANT vData);
}

// CoClasses

// SpAudioPlug Class
abstract class SpAudioPlug {
  mixin(uuid("f0cb433f-9453-466a-a35e-95909872e2a8"));
  //static DWINGUID CLSID = { 0xf0cb433f, 0x9453, 0x466a, 0xa3, 0x5e, 0x95, 0x90, 0x98, 0x72, 0xe2, 0xa8 };
  mixin Interfaces!(ISpAudioPlug);
}
