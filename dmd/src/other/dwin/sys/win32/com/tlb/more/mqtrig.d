// MSMQTriggerObjects 1.0 Type Library
// Version 1.0

/*[uuid("1d9f85b1-9666-11d2-8927-0008c70c0622")]*/
//module dwin.sys.win32.com.tlb.more.msmqtriggerobjects;
module dwin.sys.win32.com.tlb.more.mqtrig;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL___MIDL_itf_mqtrig_0000_0001 {
  RULES_PROCESSING_CONTINUE = 0x00000000,
  RULES_PROCESSING_STOP = 0x00000001,
}

enum __MIDL___MIDL_itf_mqtrig_0000_0002 {
  SYSTEM_QUEUE_NONE = 0x00000000,
  SYSTEM_QUEUE_JOURNAL = 0x00000001,
  SYSTEM_QUEUE_DEADLETTER = 0x00000002,
  SYSTEM_QUEUE_DEADXACT = 0x00000003,
}

enum __MIDL___MIDL_itf_mqtrig_0000_0003 {
  PEEK_MESSAGE = 0x00000000,
  RECEIVE_MESSAGE = 0x00000001,
  RECEIVE_MESSAGE_XACT = 0x00000002,
}

// Aliases

alias __MIDL___MIDL_itf_mqtrig_0000_0001 RulesProcessingStatus;

alias __MIDL___MIDL_itf_mqtrig_0000_0002 SystemQueueIdentifier;

alias __MIDL___MIDL_itf_mqtrig_0000_0003 MsgProcessingType;

// Interfaces

// _IMSMQTriggerSetEvents Interface
interface _IMSMQTriggerSetEvents : IDispatch {
  mixin(uuid("1d9f85c1-9666-11d2-8927-0008c70c0622"));
  // static DWINGUID IID = { 0x1d9f85c1, 0x9666, 0x11d2, 0x89, 0x27, 0x00, 0x08, 0xc7, 0x0c, 0x06, 0x22 };
}

// IMSMQPropertyBag Interface
interface IMSMQPropertyBag : IDispatch {
  mixin(uuid("07f19951-ab28-11d2-8936-000000000000"));
  // static DWINGUID IID = { 0x07f19951, 0xab28, 0x11d2, 0x89, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
  // method Write
  /*[id(0x00000001)]*/ int Write(wchar* sPropertyName, DWINVARIANT vPropertyValue);
  // method Read
  /*[id(0x00000002)]*/ int Read(wchar* sPropertyName, out DWINVARIANT pvPropertyValue);
  // property Count
  /*[id(0x00000003)]*/ int get_Count(out int pVal);
}

// IMSMQRuleHandler Interface
interface IMSMQRuleHandler : IDispatch {
  mixin(uuid("b0cdbf11-9774-11d2-8929-000000000000"));
  // static DWINGUID IID = { 0xb0cdbf11, 0x9774, 0x11d2, 0x89, 0x29, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
  // method Init
  /*[id(0x00000001)]*/ int Init(wchar* bstrRuleID, wchar* sRuleCondition, wchar* sRuleAction, int fShowWindow);
  // method CheckRuleCondition
  /*[id(0x00000002)]*/ int CheckRuleCondition(IMSMQPropertyBag pIPropertyBag, out int pbConditionSatisfied);
  // method ExecuteRule
  /*[id(0x00000003)]*/ int ExecuteRule(IMSMQPropertyBag pIPropertyBag, int fIsSerializedQueue, out int plRuleResult);
}

// _IMSMQRuleHandlerEvents Interface
interface _IMSMQRuleHandlerEvents : IDispatch {
  mixin(uuid("b0cdbf13-9774-11d2-8929-000000000000"));
  // static DWINGUID IID = { 0xb0cdbf13, 0x9774, 0x11d2, 0x89, 0x29, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
}

// IMSMQTriggerSet Interface
interface IMSMQTriggerSet : IDispatch {
  mixin(uuid("1d9f85bf-9666-11d2-8927-0008c70c0622"));
  // static DWINGUID IID = { 0x1d9f85bf, 0x9666, 0x11d2, 0x89, 0x27, 0x00, 0x08, 0xc7, 0x0c, 0x06, 0x22 };
  // method Refresh
  /*[id(0x00000001)]*/ int Refresh();
  // method AddTrigger
  /*[id(0x00000002)]*/ int AddTrigger(wchar* sTriggerName, wchar* sQueueName, SystemQueueIdentifier SystemQueue, int lEnabled, int lSerialized, MsgProcessingType msgProcType, out wchar* psTriggerID);
  // method DeleteTrigger
  /*[id(0x00000003)]*/ int DeleteTrigger(wchar* sTriggerID);
  // method GetTriggerDetailsByID
  /*[id(0x00000004)]*/ int GetTriggerDetailsByID(wchar* sTriggerID, out wchar* psTriggerName, out wchar* psQueueName, out SystemQueueIdentifier pSystemQueue, out int plNumberOfRules, out int plEnabledStatus, out int plSerialized, out MsgProcessingType pMsgProcType);
  // method GetTriggerDetailsByIndex
  /*[id(0x00000005)]*/ int GetTriggerDetailsByIndex(int lTriggerIndex, out wchar* psTriggerID, out wchar* psTriggerName, out wchar* psQueueName, out SystemQueueIdentifier pSystemQueue, out int plNumberOfRules, out int plEnabledStatus, out int plSerialized, out MsgProcessingType pMsgProcType);
  // method GetRuleDetailsByTriggerID
  /*[id(0x00000006)]*/ int GetRuleDetailsByTriggerID(wchar* sTriggerID, int lRuleIndex, out wchar* psRuleID, out wchar* psRuleName, out wchar* psDescription, out wchar* psCondition, out wchar* psAction, out wchar* psImplementationProgID, out int pfShowWindow);
  // method GetRuleDetailsByTriggerIndex
  /*[id(0x00000007)]*/ int GetRuleDetailsByTriggerIndex(int lTriggerIndex, int lRuleIndex, out wchar* psRuleID, out wchar* psRuleName, out wchar* psDescription, out wchar* psCondition, out wchar* psAction, out wchar* psImplementationProgID, out int pfShowWindow);
  // property Count
  /*[id(0x00000009)]*/ int get_Count(out int pVal);
  // method UpdateTrigger
  /*[id(0x0000000A)]*/ int UpdateTrigger(wchar* sTriggerID, wchar* sTriggerName, wchar* sQueueName, SystemQueueIdentifier SystemQueue, int lEnabled, int lSerialized, MsgProcessingType msgProcType);
  // method DetachAllRules
  /*[id(0x0000000B)]*/ int DetachAllRules(wchar* sTriggerID);
  // method AttachRule
  /*[id(0x0000000C)]*/ int AttachRule(wchar* sTriggerID, wchar* sRuleID, int lPriority);
  // method DetachRule
  /*[id(0x0000000D)]*/ int DetachRule(wchar* sTriggerID, wchar* sRuleID);
  // method Init
  /*[id(0x0000000E)]*/ int Init(wchar* bstrMachineName);
  // property TriggerStoreMachineName
  /*[id(0x0000000F)]*/ int get_TriggerStoreMachineName(out wchar* pVal);
}

// IMSMQRuleSet Interface
interface IMSMQRuleSet : IDispatch {
  mixin(uuid("65221283-b64e-11d2-894c-0008c70c0622"));
  // static DWINGUID IID = { 0x65221283, 0xb64e, 0x11d2, 0x89, 0x4c, 0x00, 0x08, 0xc7, 0x0c, 0x06, 0x22 };
  // Refreshes the Ruleset object with rule information from the trigger data store
  /*[id(0x00000001)]*/ int Refresh();
  // property Count
  /*[id(0x00000002)]*/ int get_Count(out int pVal);
  // method GetRuleDetailsByID
  /*[id(0x00000003)]*/ int GetRuleDetailsByID(wchar* sRuleID, out wchar* psRuleName, out wchar* psDescription, out wchar* psCondition, out wchar* psAction, out wchar* psImplementationProgID, out int pfShowWindow);
  // method GetRuleDetailsByIndex
  /*[id(0x00000004)]*/ int GetRuleDetailsByIndex(int lRuleIndex, out wchar* psRuleID, out wchar* psRuleName, out wchar* psDescription, out wchar* psCondition, out wchar* psAction, out wchar* psImplementationProgID, out int pfShowWindow);
  // method Delete
  /*[id(0x00000005)]*/ int Delete(wchar* sRuleID);
  // method Add
  /*[id(0x00000006)]*/ int Add(wchar* sName, wchar* sDescription, wchar* sCondition, wchar* sAction, wchar* sImplementation, int fShowWindow, out wchar* psRuleID);
  // method Update
  /*[id(0x00000007)]*/ int Update(wchar* sRuleID, wchar* sName, wchar* sDescription, wchar* sCondition, wchar* sAction, wchar* sImplementation, int fShowWindow);
  // method Init
  /*[id(0x00000008)]*/ int Init(wchar* bstrMachineName);
  // property TriggerStoreMachineName
  /*[id(0x00000009)]*/ int get_TriggerStoreMachineName(out wchar* pVal);
}

// IMSMQTriggersConfig Interface
interface IMSMQTriggersConfig : IDispatch {
  mixin(uuid("7c55d6a1-f584-11d2-89b2-000000000000"));
  // static DWINGUID IID = { 0x7c55d6a1, 0xf584, 0x11d2, 0x89, 0xb2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
  // property TriggerStoreMachineName
  /*[id(0x00000001)]*/ int get_TriggerStoreMachineName(out wchar* pVal);
  // property InitialThreads
  /*[id(0x00000002)]*/ int get_InitialThreads(out int pVal);
  // property InitialThreads
  /*[id(0x00000002)]*/ int set_InitialThreads(int pVal);
  // property MaxThreads
  /*[id(0x00000003)]*/ int get_MaxThreads(out int pVal);
  // property MaxThreads
  /*[id(0x00000003)]*/ int set_MaxThreads(int pVal);
  // property NotificationsQueueName
  /*[id(0x00000004)]*/ int get_NotificationsQueueName(out wchar* pVal);
  // property DefaultMsgBodySize
  /*[id(0x00000005)]*/ int get_DefaultMsgBodySize(out int plMsgBodySize);
  // property DefaultMsgBodySize
  /*[id(0x00000005)]*/ int set_DefaultMsgBodySize(int plMsgBodySize);
  // property InitTimeout
  /*[id(0x00000006)]*/ int get_InitTimeout(out int pVal);
  // property InitTimeout
  /*[id(0x00000006)]*/ int set_InitTimeout(int pVal);
}

// CoClasses

// MSMQTriggerSet Class
abstract class MSMQTriggerSet {
  mixin(uuid("1d9f85c0-9666-11d2-8927-0008c70c0622"));
  // static DWINGUID CLSID = { 0x1d9f85c0, 0x9666, 0x11d2, 0x89, 0x27, 0x00, 0x08, 0xc7, 0x0c, 0x06, 0x22 };
  mixin Interfaces!(IMSMQTriggerSet);
}

// MSMQRuleHandler Class
abstract class MSMQRuleHandler {
  mixin(uuid("b0cdbf12-9774-11d2-8929-000000000000"));
  // static DWINGUID CLSID = { 0xb0cdbf12, 0x9774, 0x11d2, 0x89, 0x29, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IMSMQRuleHandler);
}

// IMSMQPropertyBag Class
abstract class MSMQPropertyBag {
  mixin(uuid("07f19952-ab28-11d2-8936-000000000000"));
  // static DWINGUID CLSID = { 0x07f19952, 0xab28, 0x11d2, 0x89, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IMSMQPropertyBag);
}

// MSMQRuleSet Class
abstract class MSMQRuleSet {
  mixin(uuid("65221284-b64e-11d2-894c-0008c70c0622"));
  // static DWINGUID CLSID = { 0x65221284, 0xb64e, 0x11d2, 0x89, 0x4c, 0x00, 0x08, 0xc7, 0x0c, 0x06, 0x22 };
  mixin Interfaces!(IMSMQRuleSet);
}

// MSMQTriggersConfig Class
abstract class MSMQTriggersConfig {
  mixin(uuid("7c55d6a2-f584-11d2-89b2-000000000000"));
  // static DWINGUID CLSID = { 0x7c55d6a2, 0xf584, 0x11d2, 0x89, 0xb2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
  mixin Interfaces!(IMSMQTriggersConfig);
}
