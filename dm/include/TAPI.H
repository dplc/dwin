/* Copyright (C) 1986-2001 by Digital Mars. */
#if __SC__ || __RCC__
#pragma once
#endif

#ifndef RC_INVOKED
#pragma pack(__DEFALIGN)
#endif  

#if __NT__
#include <win32\scdefs.h>
#include <win32\TAPI.H>
#else
#include <win16\TAPI.H>
#endif

#ifndef RC_INVOKED
#pragma pack()
#endif 


