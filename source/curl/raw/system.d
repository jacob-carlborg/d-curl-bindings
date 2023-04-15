module curl.raw.system;

import core.stdc.config;
import core.sys.posix.sys.socket;

extern (C):

/***************************************************************************
 *                                  _   _ ____  _
 *  Project                     ___| | | |  _ \| |
 *                             / __| | | | |_) | |
 *                            | (__| |_| |  _ <| |___
 *                             \___|\___/|_| \_\_____|
 *
 * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
 *
 * This software is licensed as described in the file COPYING, which
 * you should have received as part of this distribution. The terms
 * are also available at https://curl.se/docs/copyright.html.
 *
 * You may opt to use, copy, modify, merge, publish, distribute and/or sell
 * copies of the Software, and permit persons to whom the Software is
 * furnished to do so, under the terms of the COPYING file.
 *
 * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
 * KIND, either express or implied.
 *
 * SPDX-License-Identifier: curl
 *
 ***************************************************************************/

/*
 * Try to keep one section per platform, compiler and architecture, otherwise,
 * if an existing section is reused for a different one and later on the
 * original is adjusted, probably the piggybacking one can be adversely
 * changed.
 *
 * In order to differentiate between platforms/compilers/architectures use
 * only compiler built in predefined preprocessor symbols.
 *
 * curl_off_t
 * ----------
 *
 * For any given platform/compiler curl_off_t must be typedef'ed to a 64-bit
 * wide signed integral data type. The width of this data type must remain
 * constant and independent of any possible large file support settings.
 *
 * As an exception to the above, curl_off_t shall be typedef'ed to a 32-bit
 * wide signed integral data type if there is no 64-bit type.
 *
 * As a general rule, curl_off_t shall not be mapped to off_t. This rule shall
 * only be violated if off_t is the only 64-bit data type available and the
 * size of off_t is independent of large file support settings. Keep your
 * build on the safe side avoiding an off_t gating.  If you have a 64-bit
 * off_t then take for sure that another 64-bit data type exists, dig deeper
 * and you will find it.
 *
 */

/* MCST eLbrus Compiler Collection */

/* Local (or Little) C Compiler */

/* Treat all ARM compilers equally */

/* Required for 32-bit NonStop builds only. */

/* also known as tcc */

/* Oracle Solaris Studio */

/* IBM xlc compiler */

/* ===================================== */
/*    KEEP MSVC THE PENULTIMATE ENTRY    */
/* ===================================== */

/* ===================================== */
/*    KEEP GENERIC GCC THE LAST ENTRY    */
/* ===================================== */

alias CURL_TYPEOF_CURL_OFF_T = c_long;
enum CURL_FORMAT_CURL_OFF_T = "ld";
enum CURL_FORMAT_CURL_OFF_TU = "lu";

alias CURL_TYPEOF_CURL_SOCKLEN_T = socklen_t;
enum CURL_PULL_SYS_TYPES_H = 1;
enum CURL_PULL_SYS_SOCKET_H = 1;

/* generic "safe guess" on old 32 bit style */

/* AIX needs <sys/poll.h> */

/* CURL_PULL_WS2TCPIP_H is defined above when inclusion of header file  */
/* ws2tcpip.h is required here to properly make type definitions below. */

/* CURL_PULL_SYS_TYPES_H is defined above when inclusion of header file  */
/* sys/types.h is required here to properly make type definitions below. */

/* CURL_PULL_SYS_SOCKET_H is defined above when inclusion of header file  */
/* sys/socket.h is required here to properly make type definitions below. */

/* CURL_PULL_SYS_POLL_H is defined above when inclusion of header file    */
/* sys/poll.h is required here to properly make type definitions below.   */

/* Data type definition of curl_socklen_t. */
alias curl_socklen_t = uint;

/* Data type definition of curl_off_t. */

alias curl_off_t = c_long;

/*
 * CURL_ISOCPP and CURL_OFF_T_C definitions are done here in order to allow
 * these to be visible and exported by the external libcurl interface API,
 * while also making them visible to the library internals, simply including
 * curl_setup.h, without actually needing to include curl.h internally.
 * If some day this section would grow big enough, all this should be moved
 * to its own header file.
 */

/*
 * Figure out if we can use the ## preprocessor operator, which is supported
 * by ISO/ANSI C and C++. Some compilers support it without setting __STDC__
 * or  __cplusplus so we need to carefully check for them too.
 */

/* This compiler is believed to have an ISO compatible preprocessor */

/* This compiler is believed NOT to have an ISO compatible preprocessor */

/*
 * Macros for minimum-width signed and unsigned curl_off_t integer constants.
 */

extern (D) string CURLINC_OFF_T_C_HLPR2(T0, T1)(auto ref T0 Val, auto ref T1 Suffix)
{
    import std.conv : to;

    return to!string(Val) ~ to!string(Suffix);
}

/**/

alias CURLINC_OFF_T_C_HLPR1 = CURLINC_OFF_T_C_HLPR2;

extern (D) auto CURL_OFF_T_C(T)(auto ref T Val)
{
    return CURLINC_OFF_T_C_HLPR1(Val, CURL_SUFFIX_CURL_OFF_T);
}

extern (D) auto CURL_OFF_TU_C(T)(auto ref T Val)
{
    return CURLINC_OFF_T_C_HLPR1(Val, CURL_SUFFIX_CURL_OFF_TU);
}

/* CURLINC_SYSTEM_H */
