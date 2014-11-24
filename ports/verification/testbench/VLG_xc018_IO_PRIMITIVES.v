//************************************************************************/
// Copyright        : (c) All Rights Reserved 
// Company          : X-FAB Semiconductor Foundries AG 
// Address          : Haarbergstr. 67,  D-99097 Erfurt, Germany
//
// File             : VLG_xc018_IO_PRIMITIVES.v
// Description      : Verilog simulation file: IO primitives & UDP's
//
// Lib_version      : V 1.0.0, Feb 14 2007
// Last Modified by : shl
// Created by       : X-FAB Library Characterizer XLICDSM Manager V3_0
// Created by       : X-FAB Library Characterizer XLICDSM Calculating Templates V3_0
// Created by       : X-FAB Library Characterizer XLICDSM Export Templates V3_0
//
//************************************************************************/

// --------------------------------------------------------------------
// cell primitive section --- BEGIN ---

primitive u_chk_s (vx, clm, ig, og, sv, iv, lv, ov);
    output vx;
    input clm, ig, og, sv, iv, lv, ov;


    table
    //  clm, ig, og, sv, iv, lv, ov: vx
       1    0  0   1  1   1  1 : 0 ; 
    endtable
endprimitive

primitive check_buf   (z, a, b);
    output z;
    input a, b ;

// FUNCTION :  Comparison cell

    table
    //  a    b      :   z
        1    1      :   1 ;
        x    1      :   x ;
	0    1      :   0 ;
        1    x      :   x ;
        x    x      :   x ;
	0    x      :   x ;

    endtable
endprimitive

primitive check_vdd   (z, a);
    output z;
    input a;

// FUNCTION :  Comparison cell

    table
    // a      :   z
       1      :   1 ;

    endtable
endprimitive

primitive check_gnd   (z, a);
    output z;
    input a;

// FUNCTION :  Comparison cell

    table
    // a      :   z
       0      :   1 ;

    endtable
endprimitive

// cell primitive section --- END ---
// --------------------------------------------------------------------


